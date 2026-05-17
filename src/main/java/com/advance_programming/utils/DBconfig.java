package com.advance_programming.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconfig {
    private static final String URL = "jdbc:mysql://localhost:3306/nepalreads";
    private static final String USER = "root";
    private static final String PASSWORD = ""; 

    // This method now signals it can throw two types of errors
    public static Connection getConnection() throws SQLException, ClassNotFoundException {
        // Matches the mysql-connector-j version 9.6.0 in your pom.xml
        Class.forName("com.mysql.cj.jdbc.Driver");
        return DriverManager.getConnection(URL, USER, PASSWORD);
    }
}