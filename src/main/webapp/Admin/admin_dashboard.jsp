<%-- 
    Document   : admin_dashboard
    Created on : Mar 3, 2025, 10:46:06 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="jakarta.servlet.http.HttpSession"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../assets/images/cab_icon.png" />
    <title>Admin Dashboard | Mega City Cab</title>
    
    <!-- ✅ Load Bootstrap from Vendor Folder Correctly -->
    <link rel="stylesheet" href="../vendor/bootstrap-5.3.3-dist/css/bootstrap.min.css">
    
    <!-- ✅ Latest FontAwesome 6 (Icons will work) -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    
    <!-- ✅ Custom CSS -->
    <link rel="stylesheet" href="../assets/css/admin.css">

    <!-- ✅ Google Font - Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    
</head>
<body>

    <!-- Sidebar -->
    <div class="d-flex" id="wrapper">
        <nav class="bg-dark text-white sidebar">
            <div class="sidebar-header text-center py-4">
                <h4>Mega City Cab</h4>
            </div>
            <ul class="list-unstyled components">
                <li><a href="admin_driver_management.jsp" onclick="loadContent('driverManagement')"><i class="fa-solid fa-user-tie"></i> Driver Management</a></li>
                <li><a href="#" onclick="loadContent('userManagement')"><i class="fa-solid fa-users"></i> User Management</a></li>
                <li><a href="#" onclick="loadContent('bookingManagement')"><i class="fa-solid fa-taxi"></i> Booking Management</a></li>
                <li><a href="#" onclick="loadContent('customerReviews')"><i class="fa-solid fa-star"></i> Customer Reviews</a></li>
                <li><a href="#" onclick="loadContent('queryManagement')"><i class="fa-solid fa-envelope"></i> Query Management</a></li>
                <li><a href="#" onclick="loadContent('customerPayments')"><i class="fa-solid fa-money-bill-wave"></i> Customer Payments</a></li>
                <li><a href="#" onclick="openProfileModal()"><i class="fa-solid fa-user-circle"></i> Profile</a></li>
                <li><a href="admin_login.jsp"><i class="fa-solid fa-sign-out-alt"></i> Logout</a></li>
            </ul>

        </nav>

        <!-- Main Content -->
        <div id="page-content-wrapper">
            <nav class="navbar navbar-expand-lg navbar-light bg-light border-bottom px-3">
                <button class="btn btn-dark" id="menu-toggle">☰</button>
                <span class="ms-auto">Welcome, Admin</span>
            </nav>

            <div class="container-fluid mt-4">
                <div id="main-content">
                    <h2 class="text-center">Admin Dashboard</h2>
                    <p class="text-center">Select a section from the sidebar to manage</p>
                </div>
            </div>
        </div>
    </div>

    <!-- Profile Modal -->
    <div class="modal fade" id="profileModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Admin Profile</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p><strong>Name:</strong> Admin</p>
                    <p><strong>Email:</strong> admin@megacitycab.com</p>
                    <p><strong>Role:</strong> System Administrator</p>
                </div>
            </div>
        </div>
    </div>

    <!-- ✅ Bootstrap JS (Ensure Proper Loading) -->
    <script src="../vendor/bootstrap-5.3.3-dist/js/bootstrap.bundle.min.js"></script>

    <!-- ✅ Custom JS -->
    <script>
        document.getElementById("menu-toggle").addEventListener("click", function () {
            document.querySelector(".sidebar").classList.toggle("d-none");
        });

                function loadContent(section) {
            // Ensure the section is properly formatted
            const formattedSection = section.replace(/([A-Z])/g, ' $1'); // Adds spaces before uppercase letters

            // Update the inner HTML with dynamic content
            document.getElementById("main-content").innerHTML = `
                <h2 class="text-center">${formattedSection}</h2>
                <p class="text-center">Content for ${formattedSection} will be loaded dynamically.</p>
            `;
        }

        // Open Profile Modal
        function openProfileModal() {
            new bootstrap.Modal(document.getElementById('profileModal')).show();
        }
        
        
         // Ensure user is authenticated
        window.onload = function() {
            fetch("${pageContext.request.contextPath}/AdminDashboardServlet")
                .then(response => response.json())
                .then(data => {
                    if (!data.authenticated) {
                        // Redirect to login if not authenticated
                        window.location.href = "/admin_login.jsp"; // Update path to your login page
                    }
                })
                .catch(error => {
                    console.error("Error verifying admin:", error);
                    window.location.href = "/admin_login.jsp";
                });
        };
        
    </script>

</body>
</html>
