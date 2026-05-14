package com.advance_programming.controller;

import com.advance_programming.DAO.AdminDAO;
import com.advance_programming.model.BookModel;
import com.advance_programming.utils.CookieUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * HomeServlet - Loads featured books for the Nepal Reads landing page
 * and exposes the "last_login" cookie so JSP can display it.
 *
 * GET /home
 */
@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO        dao   = new AdminDAO();
        List<BookModel> books = dao.getAllBooks();

        // Show at most 8 books on the home carousel / grid
        List<BookModel> featured = books.subList(0, Math.min(8, books.size()));

        request.setAttribute("featuredBooks", featured);
        request.setAttribute("pageTitle",     "Nepal Reads – Discover Your Next Book");

        // Pass last-login cookie value so the JSP can greet the user
        String lastLogin = CookieUtil.getCookieValue(request, "last_login");
        if (lastLogin != null) {
            request.setAttribute("lastLogin", lastLogin);
        }

        request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
