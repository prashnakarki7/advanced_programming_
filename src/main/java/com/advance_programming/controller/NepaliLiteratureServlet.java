package com.advance_programming.controller;

import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/nepaliliterature")
public class NepaliLiteratureServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            List<ProductModel> books = new ProductDAO().getProductsByGenre("Nepali Literature");
            request.setAttribute("genreBooks", books);
            request.getRequestDispatcher("/WEB-INF/pages/nepaliliterature.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}