package com.advance_programming.DAO;

import com.advance_programming.model.AdminModel;
import com.advance_programming.model.BookModel;
import com.advance_programming.model.OrderModel;
import com.advance_programming.utils.DBconfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/**
 * AdminDAO - Data Access Object for admin-specific operations:
 * admin login lookups, full book CRUD, and order management.
 */
public class AdminDAO {

    // ══════════════════════════════════════════════════════════════════════════
    // ADMIN ACCOUNT
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * Finds an admin by e-mail address (used during login).
     *
     * @param email the admin's login e-mail
     * @return matching {@link AdminModel}, or {@code null}
     */
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
            e.printStackTrace();
        }
        return null;
    }

    // ══════════════════════════════════════════════════════════════════════════
    // BOOK CRUD
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * Inserts a new book record.
     *
     * @param book populated {@link BookModel} (bookId ignored – auto-generated)
     * @return {@code true} on success
     */
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
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Updates all editable fields of an existing book.
     */
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
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Permanently deletes a book by its primary key.
     */
    public boolean deleteBook(int bookId) {
        String sql = "DELETE FROM books WHERE book_id = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, bookId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    /**
     * Retrieves a single book by its primary key.
     */
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
            e.printStackTrace();
        }
        return null;
    }

    /**
     * Returns every book in the catalogue, newest first.
     */
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
            e.printStackTrace();
        }
        return books;
    }

    /**
     * Returns all books belonging to a specific genre.
     */
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
            e.printStackTrace();
        }
        return books;
    }

    /**
     * Full-text-style search on title, author and ISBN.
     *
     * @param keyword search term (will be wrapped in % wildcards)
     */
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
            e.printStackTrace();
        }
        return books;
    }

    /**
     * Checks whether an ISBN is already in the catalogue.
     */
    public boolean isbnExists(String isbn) {
        String sql = "SELECT 1 FROM books WHERE isbn = ?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, isbn);
            return ps.executeQuery().next();

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // ══════════════════════════════════════════════════════════════════════════
    // ORDER MANAGEMENT
    // ══════════════════════════════════════════════════════════════════════════

    /**
     * Returns all orders across all users, joined with the user name.
     */
    public List<OrderModel> getAllOrders() {
        List<OrderModel> orders = new ArrayList<>();
        String sql = "SELECT o.*, u.full_name AS user_name "
                   + "FROM orders o JOIN users u ON o.user_id = u.user_id "
                   + "ORDER BY o.order_date DESC";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                orders.add(mapOrder(rs));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return orders;
    }

    /**
     * Updates the fulfilment status of an order.
     *
     * @param orderId target order
     * @param status  new status string (e.g. "confirmed", "shipped")
     */
    public boolean updateOrderStatus(int orderId, String status) {
        String sql = "UPDATE orders SET status=? WHERE order_id=?";

        try (Connection conn = DBconfig.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, status);
            ps.setInt(2,    orderId);
            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
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
        o.setUpdatedAt(rs.getString("updated_at"));
        return o;
    }
}
