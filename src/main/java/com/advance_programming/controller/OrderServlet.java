package com.advance_programming.controller;

import com.advance_programming.DAO.OrderDAO;
import com.advance_programming.model.OrderModel;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.SessionUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;


@WebServlet("/order")
public class OrderServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        UserModel user = (UserModel) SessionUtil.getAttribute(request, "user");
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Optional "success" parameter set by CheckoutServlet after a new order
        String successOrderId = request.getParameter("success");
        if (successOrderId != null && !successOrderId.isEmpty()) {
            request.setAttribute("successOrderId", successOrderId);
        }

        OrderDAO           dao    = new OrderDAO();
        List<OrderModel>   orders = dao.getOrdersByUser(user.getUserId());

        request.setAttribute("orders", orders);
        request.getRequestDispatcher("/WEB-INF/pages/order.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
