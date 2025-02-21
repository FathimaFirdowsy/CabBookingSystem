package com.megacabs.bookingsystem.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    
    private static final String URL = "jdbc:mysql://localhost:3306/BookingDB";
    private static final String USER = "root";
    private static final String PASSWORD = "";
    private static Connection connection = null;

    private DatabaseConnection() {} // Private constructor to prevent instantiation

    public static Connection getConnection() {
        try {
            if (connection == null || connection.isClosed()) { // Ensure fresh connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                connection = DriverManager.getConnection(URL, USER, PASSWORD);
                System.out.println("Database Connected Successfully!");
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
