package com.advance_programming.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconfig {

    // Ensure these match your actual MySQL database configuration
    private static final String URL = "jdbc:mysql://localhost:3306/nepalreads";
    private static final String USER = "root";
    private static final String PASSWORD = ""; // Keep empty if you have no password set

    public static Connection getConnection() {
        Connection conn = null;
        try {
            // 1. Register the MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // 2. Attempt to establish the connection
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            
            System.out.println("Successfully connected to the database: nepalreads");

        } catch (ClassNotFoundException e) {
            System.err.println("JDBC Driver not found. Add mysql-connector-j to your project classpath.");
            e.printStackTrace();
        } catch (SQLException e) {
            // This will show exactly what is wrong (e.g., wrong password, DB not started)
            System.err.println("SQL Error: " + e.getMessage());
            System.err.println("SQL State: " + e.getSQLState());
            System.err.println("Vendor Error Code: " + e.getErrorCode());
            e.printStackTrace();
        } catch (Exception e) {
            System.err.println("An unexpected error occurred during database connection.");
            e.printStackTrace();
        }
        return conn;
    }
}