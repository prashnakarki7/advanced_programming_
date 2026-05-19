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

    /**
     * Handles displaying the user list.
     */
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
            // 2. Fetch all users from the database
            // Note: Your UserDAO now automatically assigns "admin" or "user" roles based on logic
            List<UserModel> users = dao.getAllUsers();
            request.setAttribute("userList", users);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Could not load user list from database.");
        }

        // 3. Forward to the JSP page located in the protected WEB-INF folder
        request.getRequestDispatcher("/WEB-INF/pages/manageuser.jsp").forward(request, response);
    }

    /**
     * Handles CRUD actions like Delete.
     */
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
                
                // You can add more cases here for "update" or "block" in the future

            } catch (Exception e) {
                // Catches database exceptions and number format errors
                e.printStackTrace();
            }
        }

        // 3. Post-Redirect-Get Pattern: Redirect back to the GET mapping to refresh the list
        // This prevents re-submitting the delete request if the user refreshes their browser.
        response.sendRedirect(request.getContextPath() + "/manageuser"); 
    }
}