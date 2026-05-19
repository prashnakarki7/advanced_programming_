package com.advance_programming.DAO;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import com.advance_programming.model.UserModel;
import com.advance_programming.utils.DBconfig;

public class UserDAO {

    /**
     * INSERT: Adds a new user to the database.
     * This must match the 8 parameters called by RegisterService.
     */
    public boolean insertUser(String firstName, String lastName, String username, String dob,
                              String gender, String email, String number, String password) throws Exception {

        // Convert String date from form to SQL Date
        LocalDate localDate = LocalDate.parse(dob); 
        Date sqlDate = Date.valueOf(localDate);

        String sql = "INSERT INTO users (first_name, last_name, username, dob, gender, email, number, password) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, firstName);
            pst.setString(2, lastName);
            pst.setString(3, username);
            pst.setDate(4, sqlDate);
            pst.setString(5, gender);
            pst.setString(6, email);
            pst.setString(7, number);
            pst.setString(8, password);

            return pst.executeUpdate() > 0;
        }
    }

    /**
     * READ: Fetches a single user by username and assigns a logical role.
     */
    public UserModel getUserByUsername(String username) throws Exception {
        UserModel user = null;
        String sql = "SELECT * FROM users WHERE username = ?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, username);
            try (ResultSet rs = pst.executeQuery()) {
                if (rs.next()) {
                    user = new UserModel();
                    user.setUserId(rs.getInt("user_id"));
                    user.setFirstName(rs.getString("first_name"));
                    user.setLastName(rs.getString("last_name"));
                    user.setUserName(rs.getString("username"));
                    user.setDob(rs.getDate("dob")); 
                    user.setGender(rs.getString("gender"));
                    user.setEmail(rs.getString("email"));
                    user.setNumber(rs.getString("number"));
                    user.setPassword(rs.getString("password")); 
                    
                    // Logic-based role assignment
                    if ("admin".equalsIgnoreCase(username)) {
                        user.setRole("admin");
                    } else {
                        user.setRole("user");
                    }
                }
            }
        }
        return user;
    }

    /**
     * READ: Fetches all users for the Management Dashboard.
     */
    public List<UserModel> getAllUsers() throws Exception {
        List<UserModel> users = new ArrayList<>();
        String sql = "SELECT * FROM users";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql);
             ResultSet rs = pst.executeQuery()) {
            
            while (rs.next()) {
                UserModel s = new UserModel();
                s.setUserId(rs.getInt("user_id"));
                s.setFirstName(rs.getString("first_name"));
                s.setLastName(rs.getString("last_name"));
                String uname = rs.getString("username");
                s.setUserName(uname);
                s.setDob(rs.getDate("dob"));
                s.setEmail(rs.getString("email"));
                s.setNumber(rs.getString("number"));
                
                // Logic-based role assignment for the table view
                if ("admin".equalsIgnoreCase(uname)) {
                    s.setRole("admin");
                } else {
                    s.setRole("user");
                }
                users.add(s);
            }
        }
        return users;
    }

    /**
     * DELETE: Removes a user by ID.
     */
    public boolean deleteUser(int userId) throws Exception {
        String sql = "DELETE FROM users WHERE user_id = ?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setInt(1, userId);
            return pst.executeUpdate() > 0;
        }
    }
    public boolean updateUserProfile(UserModel user) throws Exception {
        String sql = "UPDATE users SET first_name=?, last_name=?, email=?, number=? WHERE user_id=?";
        
        try (Connection con = DBconfig.getConnection();
             PreparedStatement pst = con.prepareStatement(sql)) {
            
            pst.setString(1, user.getFirstName());
            pst.setString(2, user.getLastName());
            pst.setString(3, user.getEmail());
            pst.setString(4, user.getNumber());
            pst.setInt(5, user.getUserId());
            
            return pst.executeUpdate() > 0;
        }
    }
}