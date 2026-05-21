package com.advance_programming.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/aboutus")
public class AboutusServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AboutusServlet() {
        super();
    }

    /**
     * Logic: Handles the navigation to the About Us page.
     * This is where we would fetch team data if it were stored in a database.
     */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    
        request.getRequestDispatcher("/WEB-INF/pages/aboutus.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        doGet(request, response);
    }
}