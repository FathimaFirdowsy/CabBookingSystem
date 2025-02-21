
package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.services.DriverService;  
import com.megacabs.bookingsystem.models.Driver;
import com.megacabs.bookingsystem.models.Cab;
import com.megacabs.bookingsystem.services.CabService;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "CreateDriverServlet", urlPatterns = {"/CreateDriverServlet"})
public class CreateDriverServlet extends HttpServlet {

    private DriverService driverService;
    private CabService cabService;  // Service to interact with Cab table

    @Override
    public void init() throws ServletException {
        driverService = new DriverService();
        cabService = new CabService();  // Initialize the cab service
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         //Fetch the list of available cabs (with only CabID and CabModel)
        List<Cab> allCabs = cabService.fetchAvailableCabs();
        
        // Create a list to hold filtered cabs (only CabID and CabModel)
        List<Cab> filteredCabs = new ArrayList<>();
        
        // Iterate through all cabs and add a new object containing only CabID and CabModel
        for (Cab cab : allCabs) {
           // Cab filteredCab = new Cab(cab.getCabId(), cab.getModel(), null, null, 0, null, null, null);
           // filteredCab.setModel (cab.getModel()); 
           // filteredCabs.add(filteredCab);
        }

        // Set the filtered cabs as an attribute for use in the JSP
        request.setAttribute("cabs", filteredCabs);

        // Forward the request to the Create Driver page
        request.getRequestDispatcher("/create_driver.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve all form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String contactNo = request.getParameter("contactNo");
        String workType = request.getParameter("workType");
        String workingArea = request.getParameter("workingArea");
        String assignedCabIDStr = request.getParameter("assignedCabID");
        String licenseNo = request.getParameter("licenseNo");
        String status = request.getParameter("status");
        String password = request.getParameter("password");

        // Convert assignedCabID from string to integer (can be null)
        Integer assignedCabID = assignedCabIDStr != null && !assignedCabIDStr.isEmpty() ? Integer.parseInt(assignedCabIDStr) : null;

        // Create a new Driver object and set its properties
        Driver driver = new Driver();
        driver.setName(name);
        driver.setEmail(email);
        driver.setContactNo(contactNo);
        driver.setWorkType(workType);
        driver.setWorkingArea(workingArea);
        driver.setAssignedCabID(assignedCabID);
        driver.setLicenseNo(licenseNo);
        driver.setStatus(status);
        driver.setPassword(password);

        // Call the service to add the new driver to the database
        driverService.addDriver(driver);

        // Redirect back to the Driver Management page after successful creation
        response.sendRedirect("Admin/admin_driver_management.jsp");
    }
}
