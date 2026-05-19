package com.advance_programming.controller;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.*;
import java.util.UUID;
import com.advance_programming.DAO.ProductDAO;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.SessionUtil;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/AddProduct")
@MultipartConfig(
    maxFileSize = 5 * 1024 * 1024,      // 5MB max individual file size
    maxRequestSize = 10 * 1024 * 1024   // 10MB max total request structural size
)
public class AddProductServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/pages/addproduct.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (!SessionUtil.isAdminLoggedIn(request)) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }
        
        try {
            String title = request.getParameter("title") != null ? request.getParameter("title").trim() : "";
            String author = request.getParameter("author") != null ? request.getParameter("author").trim() : "";
            String category = request.getParameter("category") != null ? request.getParameter("category").trim() : "";
            String description = request.getParameter("description") != null ? request.getParameter("description").trim() : "";
            String imageUrl = request.getParameter("imageUrl") != null ? request.getParameter("imageUrl").trim() : "";
            
            double price = 0.0;
            int stock = 0;
            String priceStr = request.getParameter("price");
            String stockStr = request.getParameter("stock");
            
            if (priceStr != null && !priceStr.trim().isEmpty()) {
                price = Double.parseDouble(priceStr.trim());
            }
            if (stockStr != null && !stockStr.trim().isEmpty()) {
                stock = Integer.parseInt(stockStr.trim());
            }

            // File Upload Path Management Flow
            String imagePath = imageUrl; 
            Part filePart = request.getPart("bookImage");
            
            if (filePart != null && filePart.getSize() > 0) {
                String contentType = filePart.getContentType();
                if (contentType != null && contentType.startsWith("image/")) {
                    
                    // Fetch real path safely
                    String appPath = request.getServletContext().getRealPath("");
                    Path uploadPath;
                    
                    if (appPath != null && !appPath.isEmpty()) {
                        uploadPath = Paths.get(appPath, "images", "uploads");
                    } else {
                        // Fallback fallback strategy to ensure local development consistency
                        String userHome = System.getProperty("user.home");
                        uploadPath = Paths.get(userHome, "nepal_reads_images", "uploads");
                    }
                    
                    // Create storage folders explicitly if absent
                    if (!Files.exists(uploadPath)) {
                        Files.createDirectories(uploadPath);
                    }
                    
                    // Establish standardized extension names safely
                    String ext = ".jpg";
                    if (contentType.contains("png")) ext = ".png";
                    else if (contentType.contains("webp")) ext = ".webp";
                    else if (contentType.contains("gif")) ext = ".gif";
                    
                    String fileName = "book_" + UUID.randomUUID().toString() + ext;
                    Path fileTargetLocation = uploadPath.resolve(fileName);
                    
                    // Perform the binary input transfer stream safely
                    try (InputStream is = filePart.getInputStream()) {
                        Files.copy(is, fileTargetLocation, StandardCopyOption.REPLACE_EXISTING);
                    }
                    
                    // Track relative deployment uniform location
                    imagePath = "images/uploads/" + fileName;
                }
            }

            // Bind values to application data model structure
            ProductModel product = new ProductModel();
            product.setProductName(title);
            product.setAuthorName(author);
            product.setCategory(category);
            product.setPrice(price);
            product.setStock(stock);
            product.setDescription(description);
            product.setImagePath(imagePath != null ? imagePath : "");

            ProductDAO dao = new ProductDAO();
            boolean isAdded = dao.addProduct(product);

            if (isAdded) {
                response.sendRedirect(request.getContextPath() + "/manageproduct?success=true");
            } else {
                response.sendRedirect(request.getContextPath() + "/AddProduct?error=db");
            }
        } catch (NumberFormatException e) {
            System.err.println("Validation Error: Invalid numerical payload formats received.");
            response.sendRedirect(request.getContextPath() + "/AddProduct?error=validation");
        } catch (Exception e) {
            e.printStackTrace(); 
            response.sendRedirect(request.getContextPath() + "/AddProduct?error=server");
        }
    }
}