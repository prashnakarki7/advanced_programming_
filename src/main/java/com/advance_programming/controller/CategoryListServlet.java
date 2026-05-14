package com.advance_programming.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.*;

@WebServlet("/categories")
public class CategoryListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private final String DB_URL = "jdbc:mysql://localhost:3306/nepal_reads";
    private final String DB_USER = "root";
    private final String DB_PASS = "";

    /**
     * Logic: Fetches the list of all categories to display.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<String> categoryList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
                
                // Fetch unique categories from the books table
                String sql = "SELECT DISTINCT category FROM books ORDER BY category ASC";
                PreparedStatement ps = conn.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();

                while (rs.next()) {
                    categoryList.add(rs.getString("category"));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        // Set the list in request attribute
        request.setAttribute("categories", categoryList);
        
        // Forward to your category listing page or the homepage sidebar
        request.getRequestDispatcher("/WEB-INF/pages/categories.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }
}