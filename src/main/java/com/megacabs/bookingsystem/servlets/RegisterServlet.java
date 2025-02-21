
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
import java.sql.SQLException;


@WebServlet("/Register")

public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String nic = request.getParameter("nic");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String contact = request.getParameter("contact");
        String address = request.getParameter("address");

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=Your password and confirm password do not match!");
            return;
        }

        // Hash the password before storing
        String hashedPassword = hashPassword(password);

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DatabaseConnection.getConnection();
            String sql = "INSERT INTO User (NIC, Username, Email, Password, Contact, Address) VALUES (?, ?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, nic);
            pstmt.setString(2, username);
            pstmt.setString(3, email);
            pstmt.setString(4, hashedPassword);
            pstmt.setString(5, contact);
            pstmt.setString(6, address);

            int rowsInserted = pstmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("register.jsp?success=true");
            } else {
                response.sendRedirect("register.jsp?error=Registration failed!");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=Database error!");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
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
