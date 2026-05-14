package com.advance_programming.controller;

import com.advance_programming.DAO.AdminDAO;
import com.advance_programming.model.BookModel;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

/**
 * BookListingServlet - Displays the full catalogue with an optional genre filter.
 *
 * GET /booklisting           → show all books
 * GET /booklisting?genre=X   → show books filtered by genre
 */
@WebServlet("/booklisting")
public class BookListingServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO       dao   = new AdminDAO();
        String         genre = request.getParameter("genre");
        List<BookModel> books;

        if (genre != null && !genre.trim().isEmpty()) {
            books = dao.getBooksByGenre(genre.trim());
            request.setAttribute("selectedGenre", genre.trim());
        } else {
            books = dao.getAllBooks();
        }

        request.setAttribute("books", books);
        request.getRequestDispatcher("/WEB-INF/pages/booklisting.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
