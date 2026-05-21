package com.advance_programming.controller;

import com.advance_programming.DAO.UserDAO;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/manageuser")
public class ManageUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security Check: Ensure only Admins can view this page
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserDAO dao = new UserDAO();
        try {
      
            List<UserModel> users = dao.getAllUsers();
            request.setAttribute("userList", users);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load user list from database.");
        }

        // 3. Forward to the JSP page located in the protected WEB-INF folder
        request.getRequestDispatcher("/WEB-INF/pages/manageuser.jsp").forward(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // 1. Security Check: Ensure only Admins can perform actions
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        String userIdStr = request.getParameter("userId");

        if (userIdStr != null && !userIdStr.isEmpty()) {
            try {
                int userId = Integer.parseInt(userIdStr);
                UserDAO dao = new UserDAO();

                // 2. Routing logic for CRUD actions
                if ("delete".equals(action)) {
                    dao.deleteUser(userId); // Executes the SQL DELETE command
                }
                
                

            } catch (Exception e) {
                // Catches database exceptions and number format errors
                e.printStackTrace();
            }
        }


        response.sendRedirect(request.getContextPath() + "/manageuser"); 
    }
}