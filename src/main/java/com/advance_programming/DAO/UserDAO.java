package com.advance_programming.DAO;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.DBconfig;

public class UserDAO {

    // 1. Registration
    public boolean insertUser(String firstName, String lastName, String username, String dob,
                              String gender, String email, String number, String password) throws Exception {
        String sql = "INSERT INTO users (first_name, last_name, username, dob, gender, email, number, password, role, status) VALUES (?, ?, ?, ?, ?, ?, ?, ?, 'user', 'Active')";
        try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, firstName);
            pst.setString(2, lastName);
            pst.setString(3, username);
            pst.setDate(4, java.sql.Date.valueOf(dob));
            pst.setString(5, gender);
            pst.setString(6, email);
            pst.setString(7, number);
            pst.setString(8, password);
            return pst.executeUpdate() > 0;
        }
    }

    // 2. Login / Fetch User (Fixes your current error)
    public UserModel getUserByUsername(String username) throws Exception {
        UserModel user = null;
        String sql = "SELECT * FROM users WHERE username = ?";
        try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, username);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    user = new UserModel();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setUserName(rs.getString("username"));
                    user.setDob(rs.getDate("dob"));
                    user.setEmail(rs.getString("email"));
                    user.setNumber(rs.getString("number"));
                    user.setPassword(rs.getString("password"));
                    user.setRole(rs.getString("role"));
                    user.setStatus(rs.getString("status"));
                }
            }
        }
        return user;
    }

    // 3. Profile Update (used by ProfileServlet)
    public int updateUser(int userId, String firstName, String lastName, String dob, String email, String number) throws Exception {
        String sql = "UPDATE users SET first_name=?, last_name=?, dob=?, email=?, number=? WHERE user_id=?";
        try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, firstName);
            pst.setString(2, lastName);
            pst.setDate(3, java.sql.Date.valueOf(dob));
            pst.setString(4, email);
            pst.setString(5, number);
            pst.setInt(6, userId);
            return pst.executeUpdate();
        }
    }

    // 4. Admin: Get All Users
    public List<UserModel> getAllUsers() throws Exception {
        List<UserModel> list = new ArrayList<>();
        String sql = "SELECT * FROM users";
        try (Connection con = DBconfig.getConnection(); Statement st = con.createStatement(); ResultSet rs = st.executeQuery(sql)) {
            while (rs.next()) {
                UserModel u = new UserModel();
                u.setUserId(rs.getInt("user_id"));
                u.setUserName(rs.getString("username"));
                u.setEmail(rs.getString("email"));
                u.setRole(rs.getString("role"));
                u.setStatus(rs.getString("status"));
                list.add(u);
            }
        }
        return list;
    }

    // 5. Admin: Update Status
    public boolean updateStatus(int userId, String status) throws Exception {
        String sql = "UPDATE users SET status = ? WHERE user_id = ?";
        try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setString(1, status);
            pst.setInt(2, userId);
            return pst.executeUpdate() > 0;
        }
    }

    // 6. Admin: Delete User
    public boolean deleteUser(int userId) throws Exception {
        String sql = "DELETE FROM users WHERE user_id = ?";
        try (Connection con = DBconfig.getConnection(); PreparedStatement pst = con.prepareStatement(sql)) {
            pst.setInt(1, userId);
            return pst.executeUpdate() > 0;
        }
    }
}