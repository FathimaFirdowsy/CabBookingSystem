package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import com.google.gson.JsonObject;

@WebServlet(name = "CabServlet", urlPatterns = {"/CabServlet"})
public class CabServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject json = new JsonObject();

        String sql = "SELECT CabType, Model, Seats, Description FROM Cab WHERE CabID = 1";  // Fetch only Cab with CabID = 1

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            if (rs.next()) {
                json.addProperty("cabType", rs.getString("CabType"));
                json.addProperty("model", rs.getString("Model"));
                json.addProperty("seats", rs.getString("Seats"));
                json.addProperty("description", rs.getString("Description"));
            } else {
                json.addProperty("error", "Cab with ID 1 not found.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            json.addProperty("error", "Database error: " + e.getMessage());
        }

        try (PrintWriter out = response.getWriter()) {
            out.write(json.toString());
        }
    }
}
