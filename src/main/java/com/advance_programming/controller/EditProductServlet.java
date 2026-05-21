package com.advance_programming.controller;

import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.FileUploadUtil;
import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;

@WebServlet("/editProduct")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,
    maxFileSize = 1024 * 1024 * 10,
    maxRequestSize = 1024 * 1024 * 50
)
public class EditProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) { 
            response.sendRedirect(request.getContextPath() + "/login"); 
            return; 
        }
        
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            ProductModel product = new ProductDAO().getProductById(id);
            request.setAttribute("product", product);
            request.getRequestDispatcher("/WEB-INF/pages/editProduct.jsp").forward(request, response);
        } catch (Exception e) { 
            e.printStackTrace(); 
            response.sendRedirect(request.getContextPath() + "/manageproduct?error=FetchError");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) { 
            response.sendRedirect(request.getContextPath() + "/login"); 
            return; 
        }

        try {
            int productId = Integer.parseInt(request.getParameter("productId"));
            String productName = request.getParameter("productName");
            String authorName = request.getParameter("authorName");
            String category = request.getParameter("category");
            double price = Double.parseDouble(request.getParameter("price"));
            int stock = Integer.parseInt(request.getParameter("stock"));
            String description = request.getParameter("description");
            
            // Retain old image path from the hidden input form variable as a safeguard fallback
            String existingImagePath = request.getParameter("existingImagePath");

            ProductDAO dao = new ProductDAO();
            ProductModel product = dao.getProductById(productId);

            product.setProductName(productName);
            product.setAuthorName(authorName);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stock);
            product.setDescription(description);
            
            // Set fallback beforehand
            product.setImagePath(existingImagePath);

            // Handle Image Upload Check
            Part filePart = request.getPart("coverImage");
            if (filePart != null && filePart.getSize() > 0) {
                if (FileUploadUtil.isImage(filePart)) {
                    // Save directly to the deployed web application context matching structural comments: uploads/books
                    String uploadPath = getServletContext().getRealPath("/uploads/books");
                    File uploadDirFile = new File(uploadPath);
                    if (!uploadDirFile.exists()) {
                        uploadDirFile.mkdirs();
                    }

                    String extension = FileUploadUtil.getFileExtension(filePart.getSubmittedFileName());
                    String fileName = "book_" + productId + "_" + System.currentTimeMillis() + extension;
                    
                    filePart.write(uploadPath + File.separator + fileName);
                    
                    // Match pattern: uploads/books/filename.jpg
                    product.setImagePath("uploads/books/" + fileName); 
                } else {
                    SessionUtil.setAttribute(request, "error", "Invalid cover image file type.", 60);
                }
            }

            if (dao.updateProduct(product)) {
                SessionUtil.setAttribute(request, "message", "Book properties successfully altered!", 60);
            } else {
                SessionUtil.setAttribute(request, "error", "Could not complete database execution changes.", 60);
            }
        } catch (Exception e) {
            e.printStackTrace();
            SessionUtil.setAttribute(request, "error", "System Exception Error: " + e.getMessage(), 60);
        }
        response.sendRedirect(request.getContextPath() + "/manageproduct");
    }
}