package com.advance_programming.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.advance_programming.model.ProductModel;
import com.advance_programming.utils.DBconfig;

public class ProductDAO {

    public boolean addProduct(ProductModel product) throws Exception {
        String sql = "INSERT INTO products (product_name, price, image_path, description) VALUES (?, ?, ?, ?)";
        try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, product.getProductName());
            pst.setDouble(2, product.getPrice());
            pst.setString(3, product.getImagePath());
            pst.setString(4, product.getDescription());
            return pst.executeUpdate() > 0;
        }
    }

    public List<ProductModel> getAllProducts() throws Exception {
        List<ProductModel> products = new ArrayList<>();
        String sql = "SELECT * FROM products";
        try (Connection con = DBconfig.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                ProductModel p = new ProductModel();
                p.setProductId(rs.getInt("product_id"));
                p.setProductName(rs.getString("product_name"));
                p.setPrice(rs.getDouble("price"));
                p.setImagePath(rs.getString("image_path"));
                products.add(p);
            }
        }
        return products;
    }
}