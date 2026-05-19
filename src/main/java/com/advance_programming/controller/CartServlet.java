package com.advance_programming.controller;

import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.*;

/**
 * CartServlet - Session-based shopping cart using product translation engine.
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (!SessionUtil.isUserLoggedIn(request)) {
            String next = URLEncoder.encode("/cart", StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/login?next=" + next);
            return;
        }
        
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) SessionUtil.getAttribute(request, "cart");

        List<ProductModel> cartBooks = new ArrayList<>();
        if (cart != null && !cart.isEmpty()) {
            try {
                // Instantiating your existing product data access object
                ProductDAO dao = new ProductDAO();
                
                // CRITICAL FIXED LINE: Calls getAllProducts() matching your current file layout
                List<ProductModel> allProductsList = dao.getAllProducts();
                
                for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                    try {
                        int currentSessionId = Integer.parseInt(entry.getKey());
                        for (ProductModel p : allProductsList) {
                            if (p.getProductId() == currentSessionId) { 
                                cartBooks.add(p); 
                                break; 
                            }
                        }
                    } catch (NumberFormatException ignored) {}
                }
            } catch (Exception e) { 
                e.printStackTrace(); 
            }
        }

        // Map elements directly over to view render pages
        request.setAttribute("cartBooks", cartBooks);
        request.setAttribute("cartItems", cart != null ? cart : Collections.emptyMap());
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        if (!SessionUtil.isUserLoggedIn(request)) {
            String next = URLEncoder.encode("/cart", StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/login?next=" + next);
            return;
        }
        
        String bookId = request.getParameter("bookId");
        String action = request.getParameter("action");
        
        @SuppressWarnings("unchecked")
        Map<String, Integer> cart = (Map<String, Integer>) SessionUtil.getAttribute(request, "cart");
        if (cart == null) cart = new LinkedHashMap<>();

        switch (action != null ? action : "") {
            case "add":
                if (bookId != null) cart.merge(bookId, 1, Integer::sum);
                break;
            case "remove":
                if (bookId != null) cart.remove(bookId);
                break;
            case "update":
                if (bookId != null) {
                    try {
                        int qty = Integer.parseInt(request.getParameter("qty"));
                        if (qty <= 0) cart.remove(bookId); else cart.put(bookId, qty);
                    } catch (NumberFormatException ignored) {}
                }
                break;
            case "clear":
                cart.clear();
                break;
        }
        SessionUtil.setAttribute(request, "cart", cart);
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}