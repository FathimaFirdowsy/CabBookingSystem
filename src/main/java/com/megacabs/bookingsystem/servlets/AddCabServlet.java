
package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.*;
import java.sql.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.*;


@MultipartConfig(maxFileSize = 16177215) // Limit file size for image upload
@WebServlet(name = "AddCabServlet", urlPatterns = {"/AddCabServlet"})
public class AddCabServlet extends HttpServlet {

     protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form parameters
        String cabType = request.getParameter("cabType");
        String model = request.getParameter("model");
        String seats = request.getParameter("seats");
        String farePerKm = request.getParameter("farePerKm");
        String description = request.getParameter("description");
        Part filePart = request.getPart("cabImage"); // Retrieves file input

        // Convert image file to byte array
        InputStream imageStream = null;
        if (filePart != null) {
            imageStream = filePart.getInputStream();
        }

        Connection conn = null;
        PreparedStatement stmt = null;
        
        try {
            // Database connection
            conn = DatabaseConnection.getConnection(); 

            // SQL Query
            String sql = "INSERT INTO Cab (CabType, Model, Seats, FarePerKm, Description, CabImage) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, cabType);
            stmt.setString(2, model);
            stmt.setString(3, seats);
            stmt.setBigDecimal(4, new java.math.BigDecimal(farePerKm));
            stmt.setString(5, description);
            
            if (imageStream != null) {
                stmt.setBlob(6, imageStream);
            } else {
                stmt.setNull(6, Types.BLOB);
            }

            // Execute update
            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                response.sendRedirect("add_cab.jsp?success=true");
            } else {
                response.sendRedirect("add_cab.jsp?error=true");
            }
            
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("add_cab.jsp?error=true");
        } finally {
            try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
            try { if (conn != null) conn.close(); } catch (SQLException ignored) {}
        }
     }
}

