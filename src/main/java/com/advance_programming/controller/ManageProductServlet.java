package com.advance_programming.controller;

import com.advance_programming.DAO.AdminDAO;
import com.advance_programming.model.BookModel;
import com.advance_programming.utils.FileUploadUtil;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.util.List;

/**
 * ManageProductServlet
 * GET  /manageproduct         → list all books
 * POST /manageproduct?action= → add | edit | delete
 */
@WebServlet("/manageproduct")
@MultipartConfig(maxFileSize = 5 * 1024 * 1024) // 5 MB
public class ManageProductServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        AdminDAO dao = new AdminDAO();
        List<BookModel> books = dao.getAllBooks();
        request.setAttribute("books", books);
        request.setAttribute("totalBooks", books.size());
        request.getRequestDispatcher("/WEB-INF/pages/manageproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");
        AdminDAO dao = new AdminDAO();

        if ("delete".equals(action)) {
            int bookId = Integer.parseInt(request.getParameter("bookId"));
            boolean ok = dao.deleteBook(bookId);
            request.getSession().setAttribute("msg", ok ? "Book deleted successfully." : "Failed to delete book.");
            response.sendRedirect(request.getContextPath() + "/manageproduct");
            return;
        }

        // Build book from form
        BookModel book = new BookModel();
        if ("edit".equals(action)) {
            book.setBookId(Integer.parseInt(request.getParameter("bookId")));
        }
        book.setTitle(request.getParameter("title"));
        book.setAuthor(request.getParameter("author"));
        book.setIsbn(request.getParameter("isbn"));
        book.setGenre(request.getParameter("genre"));
        book.setDescription(request.getParameter("description"));
        book.setPrice(Double.parseDouble(request.getParameter("price")));
        book.setStock(Integer.parseInt(request.getParameter("stock")));
        book.setPublishedDate(request.getParameter("publishedDate"));

        // Handle image upload
        Part imagePart = request.getPart("coverImage");
        if (imagePart != null && imagePart.getSize() > 0 && FileUploadUtil.isImage(imagePart)) {
            String fileName = System.currentTimeMillis()
                + FileUploadUtil.getFileExtension(imagePart.getSubmittedFileName());
            String uploadDir = getServletContext().getRealPath("") + "/uploads/books/";
            FileUploadUtil.saveFile(imagePart, uploadDir, fileName);
            book.setCoverImage("uploads/books/" + fileName);
        }

        boolean ok;
        if ("edit".equals(action)) {
            ok = dao.updateBook(book);
            request.getSession().setAttribute("msg", ok ? "Book updated successfully." : "Failed to update book.");
        } else {
            ok = dao.addBook(book);
            request.getSession().setAttribute("msg", ok ? "Book added successfully." : "Failed to add book.");
        }

        response.sendRedirect(request.getContextPath() + "/manageproduct");
    }
}
