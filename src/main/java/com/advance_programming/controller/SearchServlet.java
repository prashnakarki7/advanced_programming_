package com.advance_programming.controller;

import com.advance_programming.DAO.AdminDAO;
import com.advance_programming.model.BookModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Collections;
import java.util.List;

/**
 * SearchServlet - Handles keyword searches across title, author, and ISBN.
 *
 * GET  /search?q=keyword → return matching books
 * POST /search            → same (form may use POST)
 */
@WebServlet("/search")
public class SearchServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String keyword = request.getParameter("q");
        List<BookModel> results = Collections.emptyList();

        if (keyword != null && !keyword.trim().isEmpty()) {
            AdminDAO dao = new AdminDAO();
            results = dao.searchBooks(keyword.trim());
            request.setAttribute("keyword", keyword.trim());
        }

        request.setAttribute("results", results);
        request.getRequestDispatcher("/WEB-INF/pages/search.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
