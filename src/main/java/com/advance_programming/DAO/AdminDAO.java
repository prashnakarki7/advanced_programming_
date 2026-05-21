package com.advance_programming.DAO;

import com.advance_programming.model.AdminModel;
import com.advance_programming.model.BookModel;
import com.advance_programming.model.OrderModel;
import com.advance_programming.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class AdminDAO {


    public AdminModel getAdminByEmail(String email) {
        String sql = "SELECT * FROM admins WHERE email = ?";

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

        } catch (SQLException e) {
            System.out.println("❌ Error in getAdminByEmail:");
            e.printStackTrace();
        }
        return null;
    }


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

        } catch (SQLException e) {
            System.out.println("❌ Error in addBook:");
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

        } catch (SQLException e) {
            System.out.println("❌ Error in updateBook:");
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

        } catch (SQLException e) {
            System.out.println("❌ Error in deleteBook:");
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

        } catch (SQLException e) {
            System.out.println("❌ Error in getBookById:");
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

        } catch (SQLException e) {
            System.out.println("❌ Error in getAllBooks:");
            e.printStackTrace();
        }
        return books;
    }

    public List<BookModel> getBooksByGenre(String genre) {
        List<BookModel> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE genre = ? ORDER BY title";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, genre);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                books.add(mapBook(rs));
            }

        } catch (SQLException e) {
            System.out.println("❌ Error in getBooksByGenre:");
            e.printStackTrace();
        }
        return books;
    }

    public List<BookModel> searchBooks(String keyword) {
        List<BookModel> books = new ArrayList<>();
        String sql = "SELECT * FROM books WHERE title LIKE ? OR author LIKE ? OR isbn LIKE ?";
        String pattern = "%" + keyword + "%";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, pattern);
            ps.setString(2, pattern);
            ps.setString(3, pattern);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                books.add(mapBook(rs));
            }

        } catch (SQLException e) {
            System.out.println("❌ Error in searchBooks:");
            e.printStackTrace();
        }
        return books;
    }

    public boolean isbnExists(String isbn) {
        String sql = "SELECT 1 FROM books WHERE isbn = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, isbn);
            return ps.executeQuery().next();

        } catch (SQLException e) {
            System.out.println("❌ Error in isbnExists:");
            e.printStackTrace();
            return false;
        }
    }


    public List<OrderModel> getAllOrders() {
        List<OrderModel> orders = new ArrayList<>();
        
        String sql = "SELECT o.*, u.full_name AS user_name "
                   + "FROM orders o "
                   + "LEFT JOIN users u ON o.user_id = u.user_id "
                   + "ORDER BY o.order_date DESC";

        String itemsSql = "SELECT oi.quantity, b.title "
                        + "FROM order_items oi "
                        + "JOIN books b ON oi.book_id = b.book_id "
                        + "WHERE oi.order_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                OrderModel o = mapOrder(rs);

                // Fetch child items without colliding on any table structure variations
                try (PreparedStatement psItems = conn.prepareStatement(itemsSql)) {
                    psItems.setInt(1, o.getOrderId());
                    try (ResultSet rsItems = psItems.executeQuery()) {
                        while (rsItems.next()) {
                            OrderModel.OrderItemDetail item = new OrderModel.OrderItemDetail();
                            item.setBookTitle(rsItems.getString("title"));
                            item.setQuantity(rsItems.getInt("quantity"));
                            o.getOrderItems().add(item);
                        }
                    }
                } catch (SQLException itemEx) {
                    System.out.println("⚠️ Warning: Failed to load order line items for ID: " + o.getOrderId());
                    itemEx.printStackTrace();
                }
                
                orders.add(o);
            }

        } catch (SQLException e) {
            System.out.println("❌ CRITICAL SQL ERROR inside AdminDAO.getAllOrders():");
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

        } catch (SQLException e) {
            System.out.println("❌ Error in updateOrderStatus:");
            e.printStackTrace();
            return false;
        }
    }

   
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
        // Safe check if user_name comes back null from the LEFT JOIN lookup layout
        String customerName = rs.getString("user_name");
        if (customerName == null || customerName.trim().isEmpty()) {
            customerName = "Customer (ID: " + rs.getInt("user_id") + ")";
        }

        return new OrderModel(
            rs.getInt("order_id"),
            rs.getInt("user_id"),
            customerName,
            rs.getDouble("total_amount"),
            rs.getString("status"),
            rs.getString("shipping_address"),
            rs.getString("order_date")
        );
    }
}