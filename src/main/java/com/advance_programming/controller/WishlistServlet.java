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
import java.util.ArrayList;
import java.util.List;

/**
 * WishlistServlet – Manages the session-based wishlist for Nepal Reads.
 *
 * GET  /wishlist              → display wishlist page
 * POST /wishlist?action=add   → add a bookId to the wishlist
 * POST /wishlist?action=remove → remove a bookId from the wishlist
 *
 * BUG FIX: redirect to /login?next=/wishlist so the user returns here after
 *          login instead of landing on /home.
 */
@WebServlet("/wishlist")
public class WishlistServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isUserLoggedIn(request)) {
            String next = URLEncoder.encode("/wishlist", StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/login?next=" + next);
            return;
        }

        @SuppressWarnings("unchecked")
        List<String> wishlist =
            (List<String>) SessionUtil.getAttribute(request, "wishlist");

        List<BookModel> wishedBooks = new ArrayList<>();

        if (wishlist != null && !wishlist.isEmpty()) {
            AdminDAO dao = new AdminDAO();
            for (String bookIdStr : wishlist) {
                try {
                    BookModel book = dao.getBookById(Integer.parseInt(bookIdStr));
                    if (book != null) {
                        wishedBooks.add(book);
                    }
                } catch (NumberFormatException e) {
                    // Skip malformed IDs
                }
            }
        }

        request.setAttribute("wishedBooks", wishedBooks);
        request.getRequestDispatcher("/WEB-INF/pages/wishlist.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (!SessionUtil.isUserLoggedIn(request)) {
            // BUG FIX: preserve destination so user returns after login
            String next = URLEncoder.encode("/wishlist", StandardCharsets.UTF_8);
            response.sendRedirect(request.getContextPath() + "/login?next=" + next);
            return;
        }

        String bookId = request.getParameter("bookId");
        String action = request.getParameter("action");

        if (bookId == null || bookId.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/wishlist");
            return;
        }

        @SuppressWarnings("unchecked")
        List<String> wishlist =
            (List<String>) SessionUtil.getAttribute(request, "wishlist");
        if (wishlist == null) {
            wishlist = new ArrayList<>();
        }

        if ("add".equals(action)) {
            if (!wishlist.contains(bookId)) {
                wishlist.add(bookId);
            }
        } else if ("remove".equals(action)) {
            wishlist.remove(bookId);
        }

        SessionUtil.setAttribute(request, "wishlist", wishlist);

        // Return to referrer if available; otherwise go to wishlist page
        String referer = request.getHeader("Referer");
        if (referer != null && !referer.isEmpty()) {
            response.sendRedirect(referer);
        } else {
            response.sendRedirect(request.getContextPath() + "/wishlist");
        }
    }
}
