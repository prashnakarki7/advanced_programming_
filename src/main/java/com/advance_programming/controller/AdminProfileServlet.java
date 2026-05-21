package com.advance_programming.controller;

import java.io.IOException;
import com.advance_programming.DAO.UserDAO;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/adminprofile")
@MultipartConfig 
public class AdminProfileServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Strict Admin Security Check
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        
        UserModel currentAdmin = (UserModel) SessionUtil.getAttribute(request, "user");
        
        request.setAttribute("adminUser", currentAdmin);
        request.getRequestDispatcher("/WEB-INF/pages/adminprofile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        // 1. Strict Admin Security Check
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserModel currentAdmin = (UserModel) SessionUtil.getAttribute(request, "user");

        try {
            // 2. Map form data to the model
            currentAdmin.setFirstName(request.getParameter("firstName"));
            currentAdmin.setLastName(request.getParameter("lastName"));
            currentAdmin.setEmail(request.getParameter("email"));
            currentAdmin.setNumber(request.getParameter("number"));
            
            String dobStr = request.getParameter("dob");
            if (dobStr != null && !dobStr.isEmpty()) {
                currentAdmin.setDob(java.sql.Date.valueOf(dobStr));
            }

            // 3. Database Update
            UserDAO dao = new UserDAO();
            boolean success = dao.updateUserProfile(currentAdmin); // Reusing your existing update method
            
            if (success) {
                // Sync session and redirect with success parameter
                SessionUtil.setAttribute(request, "user", currentAdmin);
                response.sendRedirect(request.getContextPath() + "/adminprofile?success=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/adminprofile?error=database");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/adminprofile?error=system");
        }
    }
}