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


@WebServlet(urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if (username != null) username = username.trim();

        // 1. Authenticate
        LoginService service = new LoginService();
        String status = service.authenticate(username, password);

        // 2. Handle Logic
        if ("Success".equals(status)) {
            try {
                UserDAO dao = new UserDAO();
                UserModel studentdata = dao.getUserByUsername(username);

              
                SessionUtil.setAttribute(request, "user", studentdata, 3600);

               
                String loginTime = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd_HH:mm:ss"));
                CookieUtil.addCookie(response, "last_login", loginTime, 3600);

                // Redirect based on role
                if (studentdata != null && "admin".equalsIgnoreCase(studentdata.getRole())) {
                    response.sendRedirect(request.getContextPath() + "/dashboard");
                } else {
                    response.sendRedirect(request.getContextPath() + "/home");
                }
            } catch (Exception e) {
                e.printStackTrace(); 
                request.setAttribute("error", "Database connection error.");
                request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
            }
        } else {
            // Failure: Send back to login with message
            request.setAttribute("error", status);
            request.setAttribute("typedUser", username);
            request.getRequestDispatcher("/WEB-INF/pages/login.jsp").forward(request, response);
        }
    }
}