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

@WebServlet("/admin/manageuser")
public class ManageUserServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        UserDAO DAO = new UserDAO();
        try {
            List<UserModel> users = DAO.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/WEB-INF/pages/manageuser.jsp").forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            // Handle error gracefully, perhaps redirect to an error page
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Database retrieval error.");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action = request.getParameter("action");
        int userId;

        try {
            userId = Integer.parseInt(request.getParameter("userId"));
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/admin/manageuser");
            return;
        }

        UserDAO dao = new UserDAO();

        try {
            switch (action != null ? action : "") {
                case "approve":
                    dao.updateStatus(userId, "approved");
                    break;
                case "block":
                    dao.updateStatus(userId, "blocked");
                    break;
                case "delete":
                    dao.deleteUser(userId);
                    break;
                default:
                    break;
            }
        } catch (Exception e) {
            e.printStackTrace();
            // Log error or set error attribute
        }

        // FIXED: Added missing '/admin' context directory to the redirect path
        response.sendRedirect(request.getContextPath() + "/admin/manageuser");
    }
}