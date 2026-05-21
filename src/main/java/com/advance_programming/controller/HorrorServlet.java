package com.advance_programming.controller;

import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

@WebServlet("/horror")
public class HorrorServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            // Must perfectly match the value string in your SQL database seed block: 'Horror'
            List<ProductModel> books = new ProductDAO().getProductsByGenre("Horror");
            request.setAttribute("genreBooks", books);
            request.getRequestDispatcher("/WEB-INF/pages/horror.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/home");
        }
    }
}