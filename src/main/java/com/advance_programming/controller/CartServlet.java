package com.advance_programming.controller;

import com.advance_programming.DAO.AdminDAO;
import com.advance_programming.model.BookModel;
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
 * CartServlet – Session-based shopping cart for Nepal Reads.
 *
 * Session key: "cart" → Map<String, Integer>  bookId → quantity
 *
 * GET  /cart                      → display cart page
 * POST /cart?action=add           → add 1 unit of bookId
 * POST /cart?action=remove        → remove bookId entirely
 * POST /cart?action=update&qty=N  → set quantity to N (0 = remove)
 * POST /cart?action=clear         → empty the cart
 *
 * BUG FIX: redirect to /login?next=/cart so the user returns here after login,
 *          instead of landing on /home.
 */
@WebServlet("/cart")
public class CartServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isUserLoggedIn(request)) {
            // Pass the intended destination so LoginServlet can redirect back
            String next = URLEncoder.encode("/cart", StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/login?next=" + next);
            return;
        }

        @SuppressWarnings("unchecked")
        Map<String, Integer> cart =
            (Map<String, Integer>) SessionUtil.getAttribute(request, "cart");

        List<BookModel> cartBooks = new ArrayList<>();
        double          cartTotal = 0.0;

        if (cart != null && !cart.isEmpty()) {
            AdminDAO dao = new AdminDAO();
            for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                try {
                    BookModel book = dao.getBookById(Integer.parseInt(entry.getKey()));
                    if (book != null) {
                        cartBooks.add(book);
                        cartTotal += book.getPrice() * entry.getValue();
                    }
                } catch (NumberFormatException e) {
                    // Skip malformed entry
                }
            }
        }

        request.setAttribute("cartBooks", cartBooks);
        request.setAttribute("cartItems", cart != null ? cart : Collections.emptyMap());
        request.setAttribute("cartTotal", cartTotal);
        request.getRequestDispatcher("/WEB-INF/pages/cart.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isUserLoggedIn(request)) {
            // BUG FIX: send user back to /cart after login (not /home)
            String next = URLEncoder.encode("/cart", StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/login?next=" + next);
            return;
        }

        String bookId = request.getParameter("bookId");
        String action = request.getParameter("action");

        @SuppressWarnings("unchecked")
        Map<String, Integer> cart =
            (Map<String, Integer>) SessionUtil.getAttribute(request, "cart");
        if (cart == null) {
            cart = new LinkedHashMap<>();
        }

        switch (action != null ? action : "") {
            case "add":
                if (bookId != null) {
                    cart.merge(bookId, 1, Integer::sum);
                }
                break;
            case "remove":
                if (bookId != null) {
                    cart.remove(bookId);
                }
                break;
            case "update":
                if (bookId != null) {
                    try {
                        int qty = Integer.parseInt(request.getParameter("qty"));
                        if (qty <= 0) {
                            cart.remove(bookId);
                        } else {
                            cart.put(bookId, qty);
                        }
                    } catch (NumberFormatException e) {
                        // Ignore bad qty
                    }
                }
                break;
            case "clear":
                cart.clear();
                break;
            default:
                break;
        }

        SessionUtil.setAttribute(request, "cart", cart);

        // PRG pattern – redirect after POST
        response.sendRedirect(request.getContextPath() + "/cart");
    }
}
