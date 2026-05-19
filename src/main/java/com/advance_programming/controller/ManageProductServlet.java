package com.advance_programming.controller;

import java.io.IOException;
import java.util.List;
import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/manageproduct")
@MultipartConfig
public class ManageProductServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        try {
            ProductDAO dao = new ProductDAO();
            List<ProductModel> productList = dao.getAllProducts();
            request.setAttribute("productList", productList);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Error loading inventory: " + e.getMessage());
        }
        request.getRequestDispatcher("/WEB-INF/pages/manageproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        String action = request.getParameter("action");
        try {
            ProductDAO dao = new ProductDAO();
            if ("delete".equals(action)) {
                int productId = Integer.parseInt(request.getParameter("productId"));
                dao.deleteProduct(productId);
                response.sendRedirect(request.getContextPath() + "/manageproduct?deleted=true");
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        response.sendRedirect(request.getContextPath() + "/manageproduct");
    }
}