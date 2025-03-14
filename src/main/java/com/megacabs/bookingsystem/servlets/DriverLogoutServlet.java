package com.megacabs.bookingsystem.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet(name = "DriverLogoutServlet", urlPatterns = {"/DriverLogoutServlet"})
public class DriverLogoutServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setHeader("Access-Control-Allow-Origin", "http://localhost:8080"); 
        response.setHeader("Access-Control-Allow-Credentials", "true");  // ✅ Allow cookies/session
         // Set the CORS headers to allow cross-origin requests
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        // Invalidate the session to log out the driver
        request.getSession().invalidate();

        // Set response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Send a successful logout response
        response.getWriter().print("{\"status\": \"success\", \"message\": \"Logged out successfully.\"}");
        response.getWriter().flush();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session to log out the driver
        request.getSession().invalidate();

        // Redirect to the login page or show a successful logout message
        response.sendRedirect("http://localhost:8080/BookingFrontend/driverLogin.html");
    }
}
