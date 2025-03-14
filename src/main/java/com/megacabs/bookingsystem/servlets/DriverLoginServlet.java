package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import com.megacabs.bookingsystem.models.Driver;
import org.mindrot.jbcrypt.BCrypt;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet(name = "DriverLoginServlet", urlPatterns = {"/DriverLoginServlet"})
public class DriverLoginServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
         response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080"); 
        response.setHeader("Access-Control-Allow-Credentials", "true");  // ✅ Allow cookies/session
         // Set the CORS headers to allow cross-origin requests
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if (email == null || password == null) {
            sendErrorResponse(response, "Email and Password are required.");
            return;
        }

        // Verify the driver credentials
        Driver driver = authenticateDriver(email, password);

        if (driver != null) {
            // Create session for the driver
            HttpSession session = request.getSession();
            session.setAttribute("driver", driver);  // Save driver object in session

            // Respond with success
            response.getWriter().print("{\"status\": \"success\", \"message\": \"Login successful.\", \"redirect\": \"driverDashboard.html\"}");
            response.getWriter().flush();
        } else {
            sendErrorResponse(response, "Invalid email or password.");
        }
    }

    private Driver authenticateDriver(String email, String password) {
        String sql = "SELECT * FROM Driver WHERE Email = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Verify password using BCrypt
                String hashedPassword = rs.getString("Password");
                if (BCrypt.checkpw(password, hashedPassword)) {
                    // Create Driver object and return it
                    Driver driver = new Driver();
                    driver.setDriverID(rs.getInt("DriverID"));
                    driver.setName(rs.getString("Name"));
                    driver.setEmail(rs.getString("Email"));
                    driver.setContactNo(rs.getString("ContactNo"));
                    driver.setWorkType(rs.getString("WorkType"));
                    driver.setWorkingArea(rs.getString("WorkingArea"));
                    driver.setAssignedCabID(rs.getInt("AssignedCabID"));
                    driver.setLicenseNo(rs.getString("LicenseNo"));
                    driver.setStatus(rs.getString("Status"));
                    return driver;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null; // Return null if credentials are invalid
    }

    private void sendErrorResponse(HttpServletResponse response, String message) throws IOException {
        PrintWriter out = response.getWriter();
        out.print("{\"status\": \"error\", \"message\": \"" + message + "\"}");
        out.flush();
    }
}
