package com.advance_programming.controller;

import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.DAO.OrderDAO;
import com.advance_programming.model.ProductModel;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.*;

@WebServlet("/checkout")
public class CheckoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
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
        
        List<ProductModel> cartBooks = new ArrayList<>();
        double cartTotal = 0.0;
        try {
            ProductDAO dao = new ProductDAO();
            List<ProductModel> all = dao.getAllProducts();
            for (Map.Entry<String, Integer> e : cart.entrySet()) {
                try {
                    int id = Integer.parseInt(e.getKey());
                    for (ProductModel p : all) {
                        if (p.getProductId() == id) { 
                            cartBooks.add(p); 
                            cartTotal += p.getPrice() * e.getValue(); 
                            break; 
                        }
                    }
                } catch (NumberFormatException ignored) {}
            }
        } catch (Exception e) { 
            e.printStackTrace(); 
        }
        
        request.setAttribute("user", user);
        request.setAttribute("cartBooks", cartBooks);
        request.setAttribute("cartItems", cart);
        request.setAttribute("cartTotal", cartTotal);
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
        
        String addr = request.getParameter("shippingAddress");
        if (addr == null || addr.trim().isEmpty()) {
            request.setAttribute("error", "Shipping address is required.");
            doGet(request, response);
            return;
        }

        // Invoke atomic database submission processor
        OrderDAO orderDao = new OrderDAO();
        int generatedOrderId = orderDao.placeOrder(user.getUserId(), cart, addr);

        if (generatedOrderId > 0) {
            // Clear cart from session ONLY when database storage operation succeeds
            SessionUtil.removeAttribute(request, "cart");
            response.sendRedirect(request.getContextPath() + "/order?success=" + generatedOrderId);
        } else {
            
            request.setAttribute("error", "Database Transaction Failed! Please verify that the items in your cart are in stock in your 'books' table.");
            
            // Re-fetch cart items manually so the view doesn't render empty on fallback
            try {
                com.advance_programming.DAO.ProductDAO dao = new com.advance_programming.DAO.ProductDAO();
                List<ProductModel> all = dao.getAllProducts();
                List<ProductModel> cartBooks = new ArrayList<>();
                double cartTotal = 0.0;
                for (Map.Entry<String, Integer> e : cart.entrySet()) {
                    int id = Integer.parseInt(e.getKey());
                    for (ProductModel p : all) {
                        if (p.getProductId() == id) { 
                            cartBooks.add(p); 
                            cartTotal += p.getPrice() * e.getValue(); 
                            break; 
                        }
                    }
                }
                request.setAttribute("cartBooks", cartBooks);
                request.setAttribute("cartItems", cart);
                request.setAttribute("cartTotal", cartTotal);
            } catch(Exception ignored) {}
            
            request.setAttribute("user", user);
            request.getRequestDispatcher("/WEB-INF/pages/checkout.jsp").forward(request, response);
        }
}
}