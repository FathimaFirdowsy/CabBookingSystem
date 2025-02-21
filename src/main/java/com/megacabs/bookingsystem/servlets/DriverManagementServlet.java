
package com.megacabs.bookingsystem.servlets;


import com.megacabs.bookingsystem.services.DriverService;
import com.megacabs.bookingsystem.models.Driver;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "DriverManagementServlet", urlPatterns = {"/DriverManagementServlet"})
public class DriverManagementServlet extends HttpServlet {

    private DriverService driverService;

    @Override
    public void init() throws ServletException {
        driverService = new DriverService(); // Initialize the service layer
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if admin is authenticated
        if (session == null || session.getAttribute("admin") == null) {
            response.sendRedirect("admin_login.jsp");
            return;
        }

        // Fetch all driver details
        List<Driver> drivers = driverService.getAllDrivers();
        System.out.println(drivers); // Check if the data is fetched

        // Set drivers as an attribute to the request for displaying in JSP
        request.setAttribute("drivers", drivers);

        // Forward the request to the Driver Management page
        request.getRequestDispatcher("/admin_driver_management.jsp").forward(request, response);
    }
}
