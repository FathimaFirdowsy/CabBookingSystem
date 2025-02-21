
package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "BookingServlet", urlPatterns = {"/BookingServlet"})
public class BookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve the bookingConfirmID from the request
        String bookingConfirmID = request.getParameter("bookingConfirmId");

        // Log the received bookingConfirmID for debugging
        System.out.println("Received bookingConfirmID: " + bookingConfirmID);

        // Initialize response message with an error message
        String responseMessage = "{\"status\": \"error\", \"message\": \"Sorry, No cabs available for now! Try again later.\"}";

        // Define SQL query to get booking details based on bookingConfirmID and confirmed status
        String getBookingDetailsQuery = "SELECT BookingID, DriverID, Fare FROM Bookings WHERE BookingConfirmID = ? AND Status = 'Confirmed'";

        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(getBookingDetailsQuery)) {

            // Set the parameter for the SQL query
            stmt.setString(1, bookingConfirmID);

            // Execute query to fetch booking details
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                // Fetch the booking details from the result set
                int bookingId = rs.getInt("BookingID");
                int driverId = rs.getInt("DriverID");
                BigDecimal fare = rs.getBigDecimal("Fare");

                // Construct the response JSON with fetched data
                responseMessage = String.format(
                        "{\"status\": \"success\", \"bookingId\": \"%d\", \"driverId\": \"%d\", \"fare\": \"%s\"}",
                        bookingId, driverId, fare.toString()
                );
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        // Send the response message as JSON
        response.setContentType("application/json");
        response.getWriter().write(responseMessage);
    }
}
