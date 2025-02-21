package com.megacabs.bookingsystem.dao;

import com.megacabs.bookingsystem.models.Driver;
import com.megacabs.bookingsystem.db.DatabaseConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DriverDAO {

    // Fetch all drivers from the database
    public List<Driver> getAllDrivers() {
        List<Driver> drivers = new ArrayList<>();
        String sql = "SELECT * FROM Driver";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                Driver driver = new Driver();
                driver.setDriverID(resultSet.getInt("DriverID"));
                driver.setName(resultSet.getString("Name"));
                driver.setEmail(resultSet.getString("Email"));
                driver.setContactNo(resultSet.getString("ContactNo"));
                driver.setWorkType(resultSet.getString("WorkType"));
                driver.setWorkingArea(resultSet.getString("WorkingArea"));
                driver.setAssignedCabID(resultSet.getInt("AssignedCabID"));
                driver.setLicenseNo(resultSet.getString("LicenseNo"));
                driver.setPassword(resultSet.getString("Password"));
                driver.setStatus(resultSet.getString("Status"));
                drivers.add(driver);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        // Debugging: Print out the list of drivers
    for (Driver driver : drivers) {
        System.out.println(driver.getDriverID() + " - " + driver.getName());
    }

        return drivers;
    }

    // Add a new driver to the database
    public void addDriver(Driver driver) {
        String sql = "INSERT INTO Driver (Name, Email, ContactNo, WorkType, WorkingArea, AssignedCabID, LicenseNo, Status, Password) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, driver.getName());
            statement.setString(2, driver.getEmail());
            statement.setString(3, driver.getContactNo());
            statement.setString(4, driver.getWorkType());
            statement.setString(5, driver.getWorkingArea());
            statement.setInt(6, driver.getAssignedCabID());
            statement.setString(7, driver.getLicenseNo());
            statement.setString(8, driver.getStatus());
            statement.setString(9, driver.getPassword());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Update an existing driver in the database
    public void updateDriver(Driver driver) {
        String sql = "UPDATE Driver SET Name = ?, Email = ?, ContactNo = ?, WorkType = ?, WorkingArea = ?, AssignedCabID = ?, LicenseNo = ?, Status = ?, Password = ? WHERE DriverID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setString(1, driver.getName());
            statement.setString(2, driver.getEmail());
            statement.setString(3, driver.getContactNo());
            statement.setString(4, driver.getWorkType());
            statement.setString(5, driver.getWorkingArea());
            statement.setInt(6, driver.getAssignedCabID());
            statement.setString(7, driver.getLicenseNo());
            statement.setString(8, driver.getStatus());
            statement.setString(9, driver.getPassword());
            statement.setInt(10, driver.getDriverID());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Delete a driver from the database
    public void deleteDriver(int driverID) {
        String sql = "DELETE FROM Driver WHERE DriverID = ?";

        try (Connection connection = DatabaseConnection.getConnection();
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, driverID);
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
