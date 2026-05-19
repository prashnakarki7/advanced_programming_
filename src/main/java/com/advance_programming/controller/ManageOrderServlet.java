package com.advance_programming.controller;

import com.advance_programming.DAO.AdminDAO;
import com.advance_programming.model.OrderModel;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * ManageOrderServlet - Admin page to view and update order status.
 *
 * GET  /manageorder                → list all orders (with status filtering)
 * POST /manageorder?action=updateStatus → change status of an order
 */
@WebServlet("/manageorder")
public class ManageOrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        AdminDAO dao = new AdminDAO();
        List<OrderModel> allOrders = dao.getAllOrders();
        List<OrderModel> filteredOrders = new ArrayList<>();

        // Capture filter parameter from the drop-down selector selection
        String statusFilter = request.getParameter("status");
        if (statusFilter == null || statusFilter.trim().isEmpty()) {
            statusFilter = "all";
        }

        // Handle filtering robustly here in the controller layer to protect the view layer
        for (OrderModel order : allOrders) {
            String currentStatus = (order.getStatus() != null) ? order.getStatus().trim() : "pending";
            
            if ("all".equalsIgnoreCase(statusFilter) || currentStatus.equalsIgnoreCase(statusFilter)) {
                // Ensure a safe fallback string if database records have any whitespace/null variants
                order.setStatus(currentStatus); 
                filteredOrders.add(order);
            }
        }

        // Send filtered array list and the active selector tag over to the page matching context
        request.setAttribute("orders", filteredOrders);
        request.setAttribute("currentFilter", statusFilter.toLowerCase());
        
        request.getRequestDispatcher("/WEB-INF/pages/manageorder.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String action  = request.getParameter("action");
        String status  = request.getParameter("status");
        int    orderId;

        try {
            orderId = Integer.parseInt(request.getParameter("orderId"));
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/manageorder");
            return;
        }

        if ("updateStatus".equals(action) && status != null) {
            AdminDAO dao = new AdminDAO();
            dao.updateOrderStatus(orderId, status.trim().toLowerCase());
        }

        // Redirect back to main list view securely
        response.sendRedirect(request.getContextPath() + "/manageorder");
    }
}