package com.advance_programming.controller;

import com.advance_programming.DAO.OrderDAO;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Map;

/**
 * CheckoutServlet - Handles the checkout page and order placement.
 *
 * GET  /checkout → show checkout form (pre-populated with user address)
 * POST /checkout → place the order, clear the cart, redirect to /order
 */
@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Require login
        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Check that the cart is not empty
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) SessionUtil.getAttribute(request, "cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/WEB-INF/pages/checkout.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) SessionUtil.getAttribute(request, "cart");
        if (cart == null || cart.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/cart");
            return;
        }

        // ── Read shipping address from form ───────────────────────────────────
        String shippingAddress = request.getParameter("shippingAddress");
        if (shippingAddress == null || shippingAddress.trim().isEmpty()) {
            request.setAttribute("error", "Shipping address is required.");
            doGet(request, response);
            return;
        }

        // ── Place the order ───────────────────────────────────────────────────
        OrderDAO dao      = new OrderDAO();
        int      orderId  = dao.placeOrder(user.getUserId(), cart, shippingAddress.trim());

        if (orderId > 0) {
            // Clear the cart after successful order
            SessionUtil.removeAttribute(request, "cart");
            response.sendRedirect(request.getContextPath() + "/order?success=" + orderId);
        } else {
            request.setAttribute("error",
                    "Could not place your order. Some items may be out of stock.");
            doGet(request, response);
        }
    }
}
