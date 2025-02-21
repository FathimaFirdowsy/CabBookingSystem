<%-- 
    Document   : create_driver
    Created on : Mar 7, 2025, 12:56:51 AM
    Author     : USER
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page session="true" %>
<%@ page import="java.util.List" %>
<%@ page import="com.megacabs.bookingsystem.models.Cab" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create Driver | Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2>Create New Driver</h2>

    <form action="CreateDriverServlet" method="POST">
        <!-- Name Field -->
        <div class="mb-3">
            <label for="name" class="form-label">Name</label>
            <input type="text" class="form-control" id="name" name="name" required>
        </div>

        <!-- Email Field -->
        <div class="mb-3">
            <label for="email" class="form-label">Email</label>
            <input type="email" class="form-control" id="email" name="email" required>
        </div>

        <!-- Password Field -->
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password" required>
        </div>
        
        <!-- Contact Number Field -->
        <div class="mb-3">
            <label for="contactNo" class="form-label">Contact No</label>
            <input type="text" class="form-control" id="contactNo" name="contactNo" required>
        </div>

        <!-- Work Type Field (Full-Time / Part-Time) -->
        <div class="mb-3">
            <label for="workType" class="form-label">Work Type</label>
            <select class="form-select" id="workType" name="workType" required>
                <option value="Full-Time">Full-Time</option>
                <option value="Part-Time">Part-Time</option>
            </select>
        </div>

        <!-- Working Area Field -->
        <div class="mb-3">
            <label for="workingArea" class="form-label">Working Area</label>
            <textarea class="form-control" id="workingArea" name="workingArea" required></textarea>
        </div>

        <!-- Assigned Cab ID Field (Dropdown to select available Cab IDs) -->
        <div class="mb-3">
            <label for="assignedCabID" class="form-label">Assigned Cab ID</label>
            <select class="form-select" id="assignedCabID" name="assignedCabID">
                <option value="">Select Cab</option>
                <c:forEach var="cab" items="${cabs}">
                    <option value="${cab.cabID}">${cab.cabID} - ${cab.Model}</option>
                </c:forEach>
            </select>
        </div>

        <!-- License Number Field -->
        <div class="mb-3">
            <label for="licenseNo" class="form-label">License No</label>
            <input type="text" class="form-control" id="licenseNo" name="licenseNo" required>
        </div>

        <!-- Status Field (Active / Inactive) -->
        <div class="mb-3">
            <label for="status" class="form-label">Status</label>
            <select class="form-select" id="status" name="status" required>
                <option value="Active">Active</option>
                <option value="Inactive">Inactive</option>
            </select>
        </div>

        

        <button type="submit" class="btn btn-success">Save</button>
        <a href="DriverManagementServlet" class="btn btn-secondary">Back</a>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
