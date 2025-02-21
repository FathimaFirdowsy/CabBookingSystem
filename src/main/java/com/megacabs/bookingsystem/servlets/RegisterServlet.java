
package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


@WebServlet(name = "Register", urlPatterns = {"/Register"})
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        // Validate required fields
        if (nic == null || username == null || email == null || password == null || confirmPassword == null ||
            contact == null || address == null || nic.isEmpty() || username.isEmpty() || email.isEmpty() || 
            password.isEmpty() || confirmPassword.isEmpty() || contact.isEmpty() || address.isEmpty()) {
            response.sendRedirect("register.jsp?error=All fields are required!");
            return;
        }

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=Your password and confirm password do not match!");
            return;
        }

        // Hash the password before storing
        String hashedPassword = hashPassword(password);

        Connection conn = null;
        PreparedStatement checkStmt = null;
        PreparedStatement insertStmt = null;
        ResultSet rs = null;

        try {
            conn = DatabaseConnection.getConnection();

            // Check if NIC, Username, or Email already exists
            String checkQuery = "SELECT * FROM User WHERE NIC = ? OR Username = ? OR Email = ?";
            checkStmt = conn.prepareStatement(checkQuery);
            checkStmt.setString(1, nic);
            checkStmt.setString(2, username);
            checkStmt.setString(3, email);
            rs = checkStmt.executeQuery();

            if (rs.next()) {
                // If a record is found, determine what already exists
                String existingNIC = rs.getString("NIC");
                String existingUsername = rs.getString("Username");
                String existingEmail = rs.getString("Email");

                if (existingNIC.equals(nic)) {
                    response.sendRedirect("register.jsp?error=NIC already exists!");
                } else if (existingUsername.equals(username)) {
                    response.sendRedirect("register.jsp?error=Username already exists!");
                } else if (existingEmail.equals(email)) {
                    response.sendRedirect("register.jsp?error=Email already exists!");
                }
                return;
            }

            // Insert new user if no duplicate is found
            String insertQuery = "INSERT INTO User (NIC, Username, Email, Password, Contact, Address) VALUES (?, ?, ?, ?, ?, ?)";
            insertStmt = conn.prepareStatement(insertQuery);
            insertStmt.setString(1, nic);
            insertStmt.setString(2, username);
            insertStmt.setString(3, email);
            insertStmt.setString(4, hashedPassword);
            insertStmt.setString(5, contact);
            insertStmt.setString(6, address);

            int rowsInserted = insertStmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("register.jsp?success=Registration successful! Please log in.");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed. Please try again!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database error! Please try again.");
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (checkStmt != null) checkStmt.close();
                if (insertStmt != null) insertStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }

    // Password hashing function using SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b)); // Convert to hexadecimal format
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}
