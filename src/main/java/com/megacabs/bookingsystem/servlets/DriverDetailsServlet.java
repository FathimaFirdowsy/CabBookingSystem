/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.megacabs.bookingsystem.servlets;

import com.google.gson.JsonObject;
import com.megacabs.bookingsystem.models.Driver;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet(name = "DriverDetailsServlet", urlPatterns = {"/DriverDetailsServlet"})
public class DriverDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
       response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080"); 
        response.setHeader("Access-Control-Allow-Credentials", "true");  // ✅ Allow cookies/session
         // Set the CORS headers to allow cross-origin requests
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        
        HttpSession session = request.getSession(false); // Don't create a new session if one doesn't exist
        Driver driver = (Driver) session.getAttribute("driver"); // Get driver details from the session

        if (driver != null) {
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status", "success");

            JsonObject driverDetails = new JsonObject();
            
            driverDetails.addProperty("driverID", driver.getDriverID());
            driverDetails.addProperty("name", driver.getName());
            driverDetails.addProperty("email", driver.getEmail());
            driverDetails.addProperty("contactNo", driver.getContactNo());
            driverDetails.addProperty("status", driver.getStatus());
            driverDetails.addProperty("workType", driver.getWorkType());
            driverDetails.addProperty("workingArea", driver.getWorkingArea());
            driverDetails.addProperty("assignedCabID", driver.getAssignedCabID());
            driverDetails.addProperty("licenseNo", driver.getLicenseNo());
            driverDetails.addProperty("status", driver.getStatus());
            
            
            jsonResponse.add("driver", driverDetails);
            response.setContentType("application/json");
            response.getWriter().write(jsonResponse.toString());
        } else {
            JsonObject jsonResponse = new JsonObject();
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Driver not logged in.");
            response.getWriter().write(jsonResponse.toString());
        }
    }
}
