package com.advance_programming.DAO;

import com.advance_programming.model.AdminModel;
import com.advance_programming.model.BookModel;
import com.advance_programming.model.OrderModel;
import com.advance_programming.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * AdminDAO - Fixed to handle ClassNotFoundException and SQLException
 */
public class AdminDAO {

    // ══════════════════════════════════════════════════════════════════════════
    // ADMIN ACCOUNT
    // ══════════════════════════════════════════════════════════════════════════

    public AdminModel getAdminByEmail(String email) {
        String sql = "SELECT * FROM admins WHERE email = ?";
        // Changed to Exception to handle ClassNotFoundException
        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return new AdminModel(
                    rs.getInt("admin_id"),
                    rs.getString("full_name"),
                    rs.getString("email"),
                    rs.getString("password"),
                    rs.getString("phone"),
                    rs.getString("profile_image"),
                    rs.getString("created_at")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // BOOK CRUD (For Photo, Price, and All)
    // ══════════════════════════════════════════════════════════════════════════

    public boolean addBook(BookModel book) {
        String sql = "INSERT INTO books "
                   + "(title, author, isbn, genre, description, price, stock, cover_image, published_date) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, book.getTitle());
            ps.setString(2, book.getAuthor());
            ps.setString(3, book.getIsbn());
            ps.setString(4, book.getGenre());
            ps.setString(5, book.getDescription());
            ps.setDouble(6, book.getPrice());
            ps.setInt(7,    book.getStock());
            ps.setString(8, book.getCoverImage());
            ps.setString(9, book.getPublishedDate());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean updateBook(BookModel book) {
        String sql = "UPDATE books SET title=?, author=?, isbn=?, genre=?, description=?, "
                   + "price=?, stock=?, cover_image=?, published_date=? WHERE book_id=?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1,  book.getTitle());
            ps.setString(2,  book.getAuthor());
            ps.setString(3,  book.getIsbn());
            ps.setString(4,  book.getGenre());
            ps.setString(5,  book.getDescription());
            ps.setDouble(6,  book.getPrice());
            ps.setInt(7,     book.getStock());
            ps.setString(8,  book.getCoverImage());
            ps.setString(9,  book.getPublishedDate());
            ps.setInt(10,    book.getBookId());

            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteBook(int bookId) {
        String sql = "DELETE FROM books WHERE book_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    public BookModel getBookById(int bookId) {
        String sql = "SELECT * FROM books WHERE book_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                return mapBook(rs);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public List<BookModel> getAllBooks() {
        List<BookModel> books = new ArrayList<>();
        String sql = "SELECT * FROM books ORDER BY created_at DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                books.add(mapBook(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return books;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ORDER MANAGEMENT
    // ══════════════════════════════════════════════════════════════════════════

    public List<OrderModel> getAllOrders() {
        List<OrderModel> orders = new ArrayList<>();
        String sql = "SELECT o.*, u.username AS user_name "
                   + "FROM orders o JOIN users u ON o.user_id = u.user_id "
                   + "ORDER BY o.order_date DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orders.add(mapOrder(rs));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return orders;
    }

    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status=? WHERE order_id=?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2,    orderId);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // ── Private helpers ───────────────────────────────────────────────────────

    private BookModel mapBook(ResultSet rs) throws SQLException {
        return new BookModel(
            rs.getInt("book_id"),
            rs.getString("title"),
            rs.getString("author"),
            rs.getString("isbn"),
            rs.getString("genre"),
            rs.getString("description"),
            rs.getDouble("price"),
            rs.getInt("stock"),
            rs.getString("cover_image"),
            rs.getString("published_date"),
            rs.getString("created_at")
        );
    }

    private OrderModel mapOrder(ResultSet rs) throws SQLException {
        OrderModel o = new OrderModel(
            rs.getInt("order_id"),
            rs.getInt("user_id"),
            rs.getString("user_name"),
            rs.getDouble("total_amount"),
            rs.getString("status"),
            rs.getString("shipping_address"),
            rs.getString("order_date")
        );
        return o;
    }
}