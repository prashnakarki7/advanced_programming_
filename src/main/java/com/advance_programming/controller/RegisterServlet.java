package com.advance_programming.controller;

import com.advance_programming.service.RegisterService;
import com.advance_programming.utils.ValidationUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(urlPatterns = { "/register" })
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        try {
            String firstName = request.getParameter("first_name");
            String lastName  = request.getParameter("last_name");
            String username  = request.getParameter("username");
            String dob       = request.getParameter("dob");
            String gender    = request.getParameter("gender");
            String email     = request.getParameter("email");
            String number    = request.getParameter("number");
            String password  = request.getParameter("password");

            // 1. Validation
            String error = null;
            if (!ValidationUtil.isValidName(firstName)) error = "First name must be 2-30 characters.";
            else if (!ValidationUtil.isValidName(lastName)) error = "Last name must be 2-30 characters.";
            else if (username == null || username.trim().length() < 3) error = "Username too short.";
            else if (!ValidationUtil.isOver10YearsOld(dob)) error = "Must be 10+ years old.";
            else if (!ValidationUtil.isValidEmail(email)) error = "Invalid email.";
            else if (!ValidationUtil.isValidPhone(number)) error = "Phone must be 10 digits.";
            else if (!ValidationUtil.isValidPassword(password)) error = "Weak password.";

            if (error != null) {
                request.setAttribute("error", error);
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
                return;
            }

            // 2. Service Call
            RegisterService service = new RegisterService();
            if (service.addUser(firstName, lastName, username, dob, gender, email, number, password)) {
                response.sendRedirect(request.getContextPath() + "/login");
            } else {
                request.setAttribute("error", "Username or Email already taken.");
                request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
            }
        } catch (Exception e) {
            e.printStackTrace(); 
            request.setAttribute("error", "System Error: " + e.getMessage());
            request.getRequestDispatcher("/WEB-INF/pages/register.jsp").forward(request, response);
        }
    }
}