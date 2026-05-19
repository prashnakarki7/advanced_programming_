package com.advance_programming.controller;

import com.advance_programming.DAO.UserDAO;
import com.advance_programming.model.UserModel;
import com.advance_programming.service.LoginService;
import com.advance_programming.utils.CookieUtil;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet(asyncSupported = true, urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public LoginServlet() {
        super();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Fetch User Information from Form (Trimming accidental white spaces)
        String username = request.getParameter("username");
        if (username != null) {
            username = username.trim();
        }
        String password = request.getParameter("password");

        // Call LoginService
        LoginService service = new LoginService();
        String status = service.authenticate(username, password);

        // Handle the response status
        if ("Success".equals(status)) {

            UserDAO student = new UserDAO();

            try {
                // Get user data from database
                UserModel studentdata = student.getUserByUsername(username);

                // Store user object inside the session context
                SessionUtil.setAttribute(request, "user", studentdata, 3600);

                // Capture current login time metrics
                LocalDateTime now = LocalDateTime.now();
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss");
                String loginTime = now.format(formatter);

                // Create tracking cookie
                CookieUtil.addCookie(response, "last_login", loginTime, 3600);

                // Better Dynamic Approach: Check the user's role from database
                // (Alternatively keep your: if ("admin".equalsIgnoreCase(username)) if model lacks roles)
                if (studentdata != null && "admin".equalsIgnoreCase(studentdata.getRole())) {
                    
                    // Route to Admin Dashboard Layout
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    
                    // Normal student route layout 
                    response.sendRedirect(request.getContextPath() + "/home");
                }

            } catch (Exception e) {
                e.printStackTrace();
                response.sendRedirect(request.getContextPath() + "/home");
            }

        } else {
            // Set error message framework and return back to entry view
            request.setAttribute("error", status);
            request.setAttribute("typedUser", username);
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}