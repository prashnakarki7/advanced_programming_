package com.advance_programming.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.DBconfig;

public class ProductDAO {

    // FETCH ALL BOOKS (Targets new 'books' table, maps to ProductModel)
    public List<ProductModel> getAllProducts() throws Exception {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT book_id, title, author, genre, price, stock, cover_image, description FROM books";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            
            while (rs.next()) {
                ProductModel p = new ProductModel();
                
                // Maps new DB columns to your existing Java fields
                p.setProductId(rs.getInt("book_id"));            // book_id -> productId
                p.setProductName(rs.getString("title"));         // title -> productName
                p.setAuthorName(rs.getString("author"));         // author -> authorName
                p.setCategory(rs.getString("genre"));            // genre -> category
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImagePath(rs.getString("cover_image"));     // cover_image -> imagePath
                p.setDescription(rs.getString("description"));
                
                products.add(p);
            }
        }
        return products;
    }

    // DELETE A BOOK
    public boolean deleteProduct(int productId) throws Exception {
        String sql = "DELETE FROM books WHERE book_id = ?";
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, productId);
            return pst.executeUpdate() > 0;
        }
    }

    // ADD NEW BOOK (For Admin Form Submissions)
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
}