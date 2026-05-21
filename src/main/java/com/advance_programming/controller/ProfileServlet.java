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

@WebServlet("/profile")
@MultipartConfig 
public class ProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UserModel currentUser = (UserModel) SessionUtil.getAttribute(request, "user");
        
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        request.setAttribute("user", currentUser);
        request.getRequestDispatcher("/WEB-INF/pages/profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        
        UserModel currentUser = (UserModel) SessionUtil.getAttribute(request, "user");
        
        if (currentUser == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        try {
  
            currentUser.setFirstName(request.getParameter("firstName"));
            currentUser.setLastName(request.getParameter("lastName"));
            currentUser.setEmail(request.getParameter("email"));
            currentUser.setNumber(request.getParameter("number"));
            
            // Handle Date of Birth parsing
            String dobStr = request.getParameter("dob");
            if (dobStr != null && !dobStr.isEmpty()) {
                currentUser.setDob(java.sql.Date.valueOf(dobStr));
            }

         
            UserDAO dao = new UserDAO();
            boolean success = dao.updateUserProfile(currentUser);
            
            if (success) {
               
                SessionUtil.setAttribute(request, "user", currentUser);
                response.sendRedirect(request.getContextPath() + "/profile?success=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/profile?error=database");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect(request.getContextPath() + "/profile?error=system");
        }
    }
}