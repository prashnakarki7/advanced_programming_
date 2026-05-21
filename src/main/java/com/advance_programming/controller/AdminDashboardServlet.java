package com.advance_programming.controller;

import com.advance_programming.model.UserModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet(asyncSupported = true, urlPatterns = { "/dashboard" })
public class AdminDashboardServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public AdminDashboardServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        // Get session
        HttpSession session = request.getSession(false);

        // If no session, go to login
        if (session == null) {

            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Get logged in user
        UserModel user =
                (UserModel) session.getAttribute("user");

        // If user not logged in
        if (user == null) {

            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

                if (!user.getUserName().equalsIgnoreCase("admin")) {

            // Normal users cannot access dashboard
            response.sendRedirect(request.getContextPath() + "/home");
            return;
        }

        // Open dashboard
        request.getRequestDispatcher("/WEB-INF/pages/adminDashboard.jsp")
                .forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

    }
}