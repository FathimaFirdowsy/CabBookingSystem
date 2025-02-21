
package com.megacabs.bookingsystem.services;


import com.megacabs.bookingsystem.models.Driver;
import com.megacabs.bookingsystem.dao.DriverDAO;

import java.util.List;

public class DriverService {

    private DriverDAO driverDAO;

    public DriverService() {
        driverDAO = new DriverDAO(); // Initialize the DAO layer
    }

    // Fetch all drivers from the database
    public List<Driver> getAllDrivers() {
        return driverDAO.getAllDrivers();
    }

    // Add a new driver to the database
    public void addDriver(Driver driver) {
        driverDAO.addDriver(driver);
    }

    // Edit an existing driver in the database
    public void updateDriver(Driver driver) {
        driverDAO.updateDriver(driver);
    }

    // Delete a driver from the database
    public void deleteDriver(int driverId) {
        driverDAO.deleteDriver(driverId);
    }
}

