package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet(name = "BookingConfirmationServlet", urlPatterns = {"/BookingConfirmationServlet"})
public class BookingConfirmationServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String userIdStr = request.getParameter("userId");
        int userId = -1;  // Default value
        if (userIdStr != null && !userIdStr.trim().isEmpty()) {
            try {
                userId = Integer.parseInt(userIdStr);
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Invalid User ID.\"}");
                return;  // Exit the method if the user ID is invalid
            }
        }

        String cabIdStr = request.getParameter("cabID");
        int cabId = -1;  // Default value
        if (cabIdStr != null && !cabIdStr.trim().isEmpty()) {
            try {
                cabId = Integer.parseInt(cabIdStr);
            } catch (NumberFormatException e) {
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Invalid Cab ID.\"}");
                return;  // Exit the method if the cab ID is invalid
            }
        }

        String pickupLocation = request.getParameter("pickup");
        String dropLocation = request.getParameter("drop");
        String dateTime = request.getParameter("datetime");
        String offerCode = request.getParameter("offer");

        // Log the received parameters
        System.out.println("Received data: ");
        System.out.println("userId: " + userId);
        System.out.println("cabId: " + cabId);
        System.out.println("pickupLocation: " + pickupLocation);
        System.out.println("dropLocation: " + dropLocation);
        System.out.println("dateTime: " + dateTime);
        System.out.println("offerCode: " + offerCode);

        // Handle offer: if null or empty, set to "No Offer"
        if (offerCode == null || offerCode.isEmpty()) {
            offerCode = "No Offer";  // Set a default message if the offer is not provided
        }

        // SQL query to insert booking data
        String sql = "INSERT INTO BookingConfirmation (UserID, CabID, PickupLocation, DropLocation, BookingTime, OfferCode) "
                   + "VALUES (?, ?, ?, ?, ?, ?)";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {

            // Set the parameters for the SQL query
            stmt.setInt(1, userId);
            stmt.setInt(2, cabId);
            stmt.setString(3, pickupLocation);
            stmt.setString(4, dropLocation);
            stmt.setString(5, dateTime);
            stmt.setString(6, offerCode);

            // Execute the update
            int rowsInserted = stmt.executeUpdate();

            // Get the generated BookingConfirmID
            if (rowsInserted > 0) {
                ResultSet generatedKeys = stmt.getGeneratedKeys();
                if (generatedKeys.next()) {
                    int bookingConfirmId = generatedKeys.getInt(1);  // Retrieve the auto-generated BookingConfirmID

                    // Send the BookingConfirmID in the response
                    response.getWriter().write("{\"status\": \"success\", \"bookingConfirmId\": " + bookingConfirmId + "}");
                    System.out.println("Booking successfully inserted! BookingConfirmID: " + bookingConfirmId);
                } else {
                    response.getWriter().write("{\"status\": \"error\", \"message\": \"Failed to retrieve BookingConfirmID.\"}");
                }
            } else {
                response.getWriter().write("{\"status\": \"error\", \"message\": \"Failed to create booking.\"}");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            response.getWriter().write("{\"status\": \"error\", \"message\": \"Database error: " + e.getMessage() + "\"}");
        }
    }
}
