package com.advance_programming.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.DBconfig;

public class ProductDAO {

    // FETCH ALL BOOKS
    public List<ProductModel> getAllProducts() throws Exception {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            
            while (rs.next()) {
                ProductModel p = new ProductModel();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setAuthorName(rs.getString("author_name"));
                p.setCategory(rs.getString("category"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setImagePath(rs.getString("image_path"));
                p.setDescription(rs.getString("description")); // Added this
                
                products.add(p);
            }
        }
        return products;
    }

    // DELETE A BOOK
    public boolean deleteProduct(int productId) throws Exception {
        String sql = "DELETE FROM products WHERE product_id = ?";
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, productId);
            return pst.executeUpdate() > 0;
        }
    }

    // UPDATED: ADD NEW BOOK 
    public boolean addProduct(ProductModel p) throws Exception {
        // Added 'description' to the SQL columns and values list
        String sql = "INSERT INTO products (product_name, author_name, category, price, stock, image_path, description) VALUES (?,?,?,?,?,?,?)";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, p.getProductName());
            pst.setString(2, p.getAuthorName());
            pst.setString(3, p.getCategory());
            pst.setDouble(4, p.getPrice());
            pst.setInt(5, p.getStock());
            pst.setString(6, p.getImagePath());
            pst.setString(7, p.getDescription()); // New parameter
            
            return pst.executeUpdate() > 0;
        }
    }
}