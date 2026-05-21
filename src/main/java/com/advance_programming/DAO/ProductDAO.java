package com.advance_programming.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.DBconfig;

public class ProductDAO {

    // 1. FETCH ALL PRODUCTS
    public List<ProductModel> getAllProducts() throws Exception {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT book_id, title, author, genre, price, stock, cover_image, description FROM books";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            
            while (rs.next()) {
                ProductModel p = new ProductModel();
                p.setProductId(rs.getInt("book_id"));
                p.setProductName(rs.getString("title"));
                p.setAuthorName(rs.getString("author"));
                p.setCategory(rs.getString("genre"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImagePath(rs.getString("cover_image"));
                p.setDescription(rs.getString("description"));
                products.add(p);
            }
        }
        return products;
    }

    // 2. FETCH ONE PRODUCT BY ID (Used for Edit Page)
    public ProductModel getProductById(int productId) throws Exception {
        String sql = "SELECT book_id, title, author, genre, price, stock, cover_image, description FROM books WHERE book_id = ?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setInt(1, productId);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    ProductModel p = new ProductModel();
                    p.setProductId(rs.getInt("book_id"));
                    p.setProductName(rs.getString("title"));
                    p.setAuthorName(rs.getString("author"));
                    p.setCategory(rs.getString("genre"));
                    p.setPrice(rs.getDouble("price"));
                    p.setStock(rs.getInt("stock"));
                    p.setImagePath(rs.getString("cover_image"));
                    p.setDescription(rs.getString("description"));
                    return p;
                }
            }
        }
        return null;
    }

    // 3. ADD NEW PRODUCT
    public boolean addProduct(ProductModel p) throws Exception {
        String sql = "INSERT INTO books (title, author, genre, price, stock, cover_image, description) VALUES (?,?,?,?,?,?,?)";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, p.getProductName());
            pst.setString(2, p.getAuthorName());
            pst.setString(3, p.getCategory());
            pst.setDouble(4, p.getPrice());
            pst.setInt(5, p.getStock());
            pst.setString(6, p.getImagePath() != null ? p.getImagePath() : "");
            pst.setString(7, p.getDescription() != null ? p.getDescription() : ""); 
            
            return pst.executeUpdate() > 0;
        }
    }

    // 4. UPDATE PRODUCT (Includes cover_image)
    public boolean updateProduct(ProductModel p) throws Exception {
        String sql = "UPDATE books SET title=?, author=?, genre=?, price=?, stock=?, description=?, cover_image=? WHERE book_id=?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, p.getProductName());
            pst.setString(2, p.getAuthorName());
            pst.setString(3, p.getCategory());
            pst.setDouble(4, p.getPrice());
            pst.setInt(5, p.getStock());
            pst.setString(6, p.getDescription());
            pst.setString(7, p.getImagePath()); 
            pst.setInt(8, p.getProductId());
            
            return pst.executeUpdate() > 0;
        }
    }

    // 5. DELETE A PRODUCT
    public boolean deleteProduct(int productId) throws Exception {
        String sql = "DELETE FROM books WHERE book_id = ?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, productId);
            return pst.executeUpdate() > 0;
        }
    }

    // 6. FETCH PRODUCTS BY GENRE (Dynamic Filtering)
    public List<ProductModel> getProductsByGenre(String genre) throws Exception {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT book_id, title, author, genre, price, stock, cover_image, description FROM books WHERE genre = ?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, genre);
            try (ResultSet rs = pst.executeQuery()) {
                while (rs.next()) {
                    ProductModel p = new ProductModel();
                    p.setProductId(rs.getInt("book_id"));
                    p.setProductName(rs.getString("title"));
                    p.setAuthorName(rs.getString("author"));
                    p.setCategory(rs.getString("genre"));
                    p.setPrice(rs.getDouble("price"));
                    p.setStock(rs.getInt("stock"));
                    p.setImagePath(rs.getString("cover_image"));
                    p.setDescription(rs.getString("description"));
                    products.add(p);
                }
            }
        }
        return products;
    }
}