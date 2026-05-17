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

@WebServlet("/home")
public class HomeServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO dao = new AdminDAO();
        List<BookModel> books = dao.getAllBooks();

        // First 8 = Featured, next 4 = New Arrivals
        int total = books.size();
        List<BookModel> featured   = books.subList(0, Math.min(8, total));
        List<BookModel> newArrivals = total > 8
            ? books.subList(8, Math.min(12, total))
            : java.util.Collections.emptyList();

        request.setAttribute("featuredBooks", featured);
        request.setAttribute("newArrivals",   newArrivals);
        request.setAttribute("pageTitle",     "Nepal Reads – Discover Your Next Book");

        String lastLogin = CookieUtil.getCookieValue(request, "last_login");
        if (lastLogin != null) request.setAttribute("lastLogin", lastLogin);

        request.getRequestDispatcher("/WEB-INF/pages/home.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
