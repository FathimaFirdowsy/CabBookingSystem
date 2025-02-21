<%-- 
    Document   : admin_driver_management
    Created on : Mar 7, 2025, 12:55:37 AM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page session="true" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Driver Management | Mega City Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-4">
    <h2>Driver Management</h2>
    <a href="create_driver.jsp" class="btn btn-primary mb-3">Create New Driver</a>
    
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Phone</th>
                <th>Work Type</th>
                <th>Working Area</th>
                <th>Assigned Cab ID</th>
                <th>License No</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="driver" items="${drivers}">
                <tr>
                    <td>${driver.driverID}</td>
                    <td>${driver.name}</td>
                    <td>${driver.email}</td>
                    <td>${driver.contactNo}</td>
                    <td>${driver.workType}</td>
                    <td>${driver.workingArea}</td>
                    <td>${driver.assignedCabID}</td>
                    <td>${driver.licenseNo}</td>
                    <td>${driver.status}</td>
                    <td>
                        <a href="edit_driver.jsp?id=${driver.driverID}" class="btn btn-warning btn-sm">Edit</a>
                        <a href="delete_driver.jsp?id=${driver.driverID}" class="btn btn-danger btn-sm">Delete</a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
