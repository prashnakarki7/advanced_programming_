package com.advance_programming.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException; // Added

public class DBconfig {
    private static final String URL = "jdbc:mysql://localhost:3306/nepalreads";
    private static final String USER = "root";
    private static final String PASSWORD = "";

    // Changed signature to throw SQLException instead of generic Exception
    public static Connection getConnection() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            throw new SQLException("Database Driver not found!", e);
        }
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}