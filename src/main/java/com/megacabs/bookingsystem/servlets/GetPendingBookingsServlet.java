package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet("/GetPendingBookingsServlet")
public class GetPendingBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080"); 
        response.setHeader("Access-Control-Allow-Credentials", "true");  // ✅ Allow cookies/session
         // Set the CORS headers to allow cross-origin requests
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        // Set response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Fetch pending bookings from the database
        JsonArray bookingsArray = getPendingBookings();

        // Prepare the response
        JsonObject jsonResponse = new JsonObject();
        if (bookingsArray != null && bookingsArray.size() > 0) {
            jsonResponse.addProperty("status", "success");
            jsonResponse.add("bookings", bookingsArray); // Add bookings array to response
        } else {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "No pending bookings found.");
        }

        // Send the response to the client
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }

    private JsonArray getPendingBookings() {
        String sql = "SELECT * FROM BookingConfirmation WHERE Status = 'Pending'";
        JsonArray bookingsArray = new JsonArray();

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {
            
            while (rs.next()) {
                JsonObject bookingObj = new JsonObject();
                bookingObj.addProperty("BookingConfirmID", rs.getInt("BookingConfirmID"));
                bookingObj.addProperty("UserID", rs.getInt("UserID"));
                bookingObj.addProperty("PickupLocation", rs.getString("PickupLocation"));
                bookingObj.addProperty("DropLocation", rs.getString("DropLocation"));
                bookingObj.addProperty("CabID", rs.getInt("CabID"));
                bookingObj.addProperty("BookingTime", rs.getTimestamp("BookingTime").toString()); // Convert timestamp to string
                bookingObj.addProperty("OfferCode", rs.getString("OfferCode"));
                bookingObj.addProperty("Status", rs.getString("Status"));
                
                bookingsArray.add(bookingObj);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            return null;
        }
        
        return bookingsArray;
    }
}
