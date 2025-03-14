package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import com.megacabs.bookingsystem.models.Driver;
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
import org.mindrot.jbcrypt.BCrypt; // Import BCrypt

@WebServlet(name = "DriverRegisterServlet", urlPatterns = {"/DriverRegisterServlet"})
public class DriverRegisterServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080"); 
        response.setHeader("Access-Control-Allow-Credentials", "true");  // ✅ Allow cookies/session
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        
        // Extract form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String contact = request.getParameter("contact");
        String workType = request.getParameter("workType");
        String workingArea = request.getParameter("workingArea");
        String cabModel = request.getParameter("cabModel");
        String licenseNo = request.getParameter("licenseNo");

        System.out.println("Received Cab Model: " + cabModel);  // Add this line to debug
        
        
        // Validate inputs (simple example, expand this validation as needed)
        if (name == null || email == null || password == null || contact == null || workType == null || workingArea == null || cabModel == null || licenseNo == null) {
            sendErrorResponse(response, "All fields are required.");
            return;
        }

        // Hash the password using BCrypt
        String hashedPassword = BCrypt.hashpw(password, BCrypt.gensalt()); // Hash the password

        // Get the AssignedCabID from the cab model
        Integer assignedCabID = getCabIDByModel(cabModel);
        if (assignedCabID == null) {
            sendErrorResponse(response, "Invalid cab model selected.");
            return;
        }

        // Create Driver object
        Driver driver = new Driver();
        driver.setName(name);
        driver.setEmail(email);
        driver.setPassword(hashedPassword);  // Store the hashed password
        driver.setContactNo(contact);
        driver.setWorkType(workType);
        driver.setWorkingArea(workingArea);
        driver.setAssignedCabID(assignedCabID); // Set the AssignedCabID from the dropdown
        driver.setLicenseNo(licenseNo);
        driver.setStatus("Available"); // Status can be "Pending", "Approved", or "Inactive" based on your logic

        // Insert data into the database
        if (insertDriverData(driver)) {
            // Send a successful response
            PrintWriter out = response.getWriter();
            out.print("{\"status\": \"success\", \"message\": \"Driver registered successfully.\"}");
            out.flush();
        } else {
            sendErrorResponse(response, "Failed to register driver. Please try again.");
        }
    }

    private Integer getCabIDByModel(String cabModel) {
        String sql = "SELECT CabID FROM Cab WHERE Model = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, cabModel);
            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                return rs.getInt("CabID");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null; // Return null if no matching cab model is found
    }

    private boolean insertDriverData(Driver driver) {
        String sql = "INSERT INTO Driver (Name, Email, Password, ContactNo, WorkType, WorkingArea, AssignedCabID, LicenseNo, Status) "
                   + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, driver.getName());
            stmt.setString(2, driver.getEmail());
            stmt.setString(3, driver.getPassword());  // Store the hashed password
            stmt.setString(4, driver.getContactNo());
            stmt.setString(5, driver.getWorkType());
            stmt.setString(6, driver.getWorkingArea());
            stmt.setInt(7, driver.getAssignedCabID());  // Set the AssignedCabID
            stmt.setString(8, driver.getLicenseNo());
            stmt.setString(9, driver.getStatus());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0; // Return true if insertion was successful
        } catch (SQLException e) {
            e.printStackTrace();
            return false; // Return false if insertion failed
        }
    }

    private void sendErrorResponse(HttpServletResponse response, String message) throws IOException {
        PrintWriter out = response.getWriter();
        out.print("{\"status\": \"error\", \"message\": \"" + message + "\"}");
        out.flush();
    }
}
