<%-- 
    Document   : add_cab
    Created on : Feb 26, 2025, 9:31:36 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <title>Add New Cab</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2 class="mb-4">Add New Cab</h2>
    <form action="AddCabServlet" method="post" enctype="multipart/form-data">
        <div class="mb-3">
            <label class="form-label">Cab Type</label>
            <input type="text" name="cabType" class="form-control" required>
        </div>
        
        <div class="mb-3">
            <label class="form-label">Model</label>
            <input type="text" name="model" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Seats</label>
            <input type="number" name="seats" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Fare Per Km</label>
            <input type="number" step="0.01" name="farePerKm" class="form-control" required>
        </div>

        <div class="mb-3">
            <label class="form-label">Description</label>
            <textarea name="description" class="form-control" required></textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Cab Image</label>
            <input type="file" name="cabImage" class="form-control" required>
        </div>

        <button type="submit" class="btn btn-primary">Add Cab</button>
    </form>
</div>
</body>
</html>
