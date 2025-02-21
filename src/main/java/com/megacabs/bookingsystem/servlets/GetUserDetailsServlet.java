package com.megacabs.bookingsystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.http.HttpSession;
import com.megacabs.bookingsystem.db.DatabaseConnection;
import com.google.gson.JsonObject;

@WebServlet(name = "GetUserDetailsServlet", urlPatterns = {"/GetUserDetailsServlet"})
public class GetUserDetailsServlet extends HttpServlet {

   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        HttpSession session = request.getSession();
        Integer userId = (Integer) session.getAttribute("userId"); // Ensure correct type

        JsonObject json = new JsonObject();

        if (userId != null) {
            try (Connection conn = DatabaseConnection.getConnection();
                 PreparedStatement stmt = conn.prepareStatement("SELECT Email, Contact, Address FROM User WHERE UserId = ?")) {

                stmt.setInt(1, userId); // Set userId as integer
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        json.addProperty("email", rs.getString("Email"));
                        json.addProperty("contact", rs.getString("Contact"));
                        json.addProperty("address", rs.getString("Address"));
                    } else {
                        json.addProperty("error", "User not found");
                    }
                }
            } catch (Exception e) {
                e.printStackTrace();
                json.addProperty("error", "Database error: " + e.getMessage());
            }
        } else {
            json.addProperty("error", "User not logged in");
        }

        try (PrintWriter out = response.getWriter()) {
            out.write(json.toString());
        }
    }
}

  

