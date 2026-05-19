package com.advance_programming.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconfig {
<<<<<<< HEAD
    private static final String URL = "jdbc:mysql://localhost:3306/nepalreads";
=======

    // Removed the double semicolon here
    private static final String URL = "jdbc:mysql://localhost:3306/nepalreads"; 
>>>>>>> branch 'nayan' of https://github.com/prashnakarki7/advanced_programming_.git
    private static final String USER = "root";
    private static final String PASSWORD = ""; 

<<<<<<< HEAD
    // This method now signals it can throw two types of errors
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Matches the mysql-connector-j version 9.6.0 in your pom.xml
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
=======
    public static Connection getConnection() {
        Connection conn = null;
        try {
            // Force the driver to load
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(URL, USER, PASSWORD);
            
            if (conn != null) {
                System.out.println("SUCCESS: Connected to NepalReads DB");
            }

        } catch (ClassNotFoundException e) {
            System.out.println("ERROR: MySQL Driver not found! Check your WEB-INF/lib folder.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.out.println("ERROR: Failed to connect to MySQL. Is XAMPP/MySQL running?");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("DB Connection Failed due to an unknown error.");
            e.printStackTrace();
        }

        return conn;
>>>>>>> branch 'nayan' of https://github.com/prashnakarki7/advanced_programming_.git
    }
}