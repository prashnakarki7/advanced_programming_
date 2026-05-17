package com.advance_programming.DAO;

import com.advance_programming.model.OrderModel;
import com.advance_programming.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * OrderDAO - Handles placing new orders and reading order history for a user.
 */
public class OrderDAO {

    /**
     * Creates a new order record and its line items atomically.
     * * @param userId          the ordering user's ID
     * @param cart            map of bookId → quantity (from session)
     * @param shippingAddress delivery address entered at checkout
     * @return the generated order ID, or -1 on failure
     */
    public int placeOrder(int userId, Map<String, Integer> cart, String shippingAddress) {
        if (cart == null || cart.isEmpty()) {
            return -1;
        }

        String insertOrder = "INSERT INTO orders (user_id, total_amount, status, shipping_address, order_date) "
                           + "VALUES (?, 0.00, 'pending', ?, NOW())";
        String insertItem  = "INSERT INTO order_items (order_id, book_id, quantity, unit_price) "
                           + "VALUES (?, ?, ?, ?)";
        String updateTotal = "UPDATE orders SET total_amount = "
                           + "(SELECT SUM(quantity * unit_price) FROM order_items WHERE order_id = ?) "
                           + "WHERE order_id = ?";
        String updateStock = "UPDATE books SET stock = stock - ? WHERE book_id = ? AND stock >= ?";

        Connection conn = null;
        try {
            // This now handles ClassNotFoundException via the catch(Exception e) below
            conn = DBconfig.getConnection();
            conn.setAutoCommit(false);  // begin transaction

            // 1. Create the order header
            PreparedStatement psOrder = conn.prepareStatement(
                    insertOrder, Statement.RETURN_GENERATED_KEYS);
            psOrder.setInt(1, userId);
            psOrder.setString(2, shippingAddress);
            psOrder.executeUpdate();

            ResultSet keys = psOrder.getGeneratedKeys();
            if (!keys.next()) {
                conn.rollback();
                return -1;
            }
            int orderId = keys.getInt(1);

            // 2. Insert order items and decrement stock
            PreparedStatement psItem  = conn.prepareStatement(insertItem);
            PreparedStatement psStock = conn.prepareStatement(updateStock);

            for (Map.Entry<String, Integer> entry : cart.entrySet()) {
                int bookId   = Integer.parseInt(entry.getKey());
                int quantity = entry.getValue();

                // Fetch current book price
                double price = getBookPrice(conn, bookId);

                psItem.setInt(1, orderId);
                psItem.setInt(2, bookId);
                psItem.setInt(3, quantity);
                psItem.setDouble(4, price);
                psItem.addBatch();

                psStock.setInt(1, quantity);
                psStock.setInt(2, bookId);
                psStock.setInt(3, quantity);
                psStock.addBatch();
            }

            psItem.executeBatch();
            psStock.executeBatch();

            // 3. Recalculate total
            PreparedStatement psTotal = conn.prepareStatement(updateTotal);
            psTotal.setInt(1, orderId);
            psTotal.setInt(2, orderId);
            psTotal.executeUpdate();

            conn.commit();
            return orderId;

        } catch (Exception e) { // catches both SQLException and ClassNotFoundException
            e.printStackTrace();
            if (conn != null) {
                try { conn.rollback(); } catch (SQLException ex) { ex.printStackTrace(); }
            }
            return -1;

        } finally {
            if (conn != null) {
                try { 
                    conn.setAutoCommit(true); 
                    conn.close(); 
                } catch (SQLException e) { 
                    e.printStackTrace(); 
                }
            }
        }
    }

    /**
     * Returns all orders placed by a specific user, newest first.
     */
    public List<OrderModel> getOrdersByUser(int userId) {
        List<OrderModel> list = new ArrayList<>();
        String sql = "SELECT o.*, u.username AS user_name "
                   + "FROM orders o JOIN users u ON o.user_id = u.user_id "
                   + "WHERE o.user_id = ? ORDER BY o.order_date DESC";

        // Updated to catch Exception to resolve the ClassNotFoundException error
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, userId);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                OrderModel o = new OrderModel(
                    rs.getInt("order_id"),
                    rs.getInt("user_id"),
                    rs.getString("user_name"),
                    rs.getDouble("total_amount"),
                    rs.getString("status"),
                    rs.getString("shipping_address"),
                    rs.getString("order_date")
                );
                list.add(o);
            }

        } catch (Exception e) { // Fix: Handles both SQL and Driver errors
            e.printStackTrace();
        }
        return list;
    }

    // ── Private helpers ───────────────────────────────────────────────────────

    private double getBookPrice(Connection conn, int bookId) throws SQLException {
        PreparedStatement ps = conn.prepareStatement("SELECT price FROM books WHERE book_id = ?");
        ps.setInt(1, bookId);
        ResultSet rs = ps.executeQuery();
        return rs.next() ? rs.getDouble("price") : 0.0;
    }
}