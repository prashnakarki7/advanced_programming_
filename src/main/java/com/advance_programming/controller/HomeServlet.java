package com.advance_programming.controller;

import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.CookieUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * HomeServlet - Controller for the Nepal Reads landing page.
 * Retrieves featured products and manages user greeting state.
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            // 1. Fetch products from the database using ProductDAO
            ProductDAO dao = new ProductDAO();
            List<ProductModel> allProducts = dao.getAllProducts();

            // 2. Select featured books (e.g., the first 8 items for the home grid)
            List<ProductModel> featured = allProducts.subList(0, Math.min(8, allProducts.size()));
            request.setAttribute("featuredBooks", featured);
            
            // 3. Set metadata for the JSP
            request.setAttribute("pageTitle", "Nepal Reads – Discover Your Next Book");

           
            String lastLogin = CookieUtil.getCookieValue(request, "last_login");
            if (lastLogin != null) {
                request.setAttribute("lastLoginTime", lastLogin);
            }

        
            HttpSession session = request.getSession(false);
            if (session != null && session.getAttribute("user") != null) {
                request.setAttribute("isLoggedIn", true);
            } else {
                request.setAttribute("isLoggedIn", false);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Unable to load featured books at this time.");
        }

     
        request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        doGet(request, response);
    }
}