<%-- 
    Document   : driver_login
    Created on : Feb 15, 2025, 8:54:44 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../assets/images/cab_icon.png" />
    <title>Driver Login | Mega City Cab</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <!-- ✅ Latest FontAwesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- ✅ Font Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/admin.css"> <!-- External CSS file -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body class="driver-login-bg">

    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card driver-login-card">
            <div class="card-body">
                <h2 class="text-center mb-4">Driver Login</h2>
                
                <form>
                    <div class="mb-3">
                        <label for="driverEmail" class="form-label">Email</label>
                        <input type="email" class="form-control" id="driverEmail" placeholder="Enter your Email" required>
                    </div>
                    
                    <div class="mb-3 position-relative">
                        <label for="driverPassword" class="form-label">Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="driverPassword" placeholder="Enter your password" required>
                            <button type="button" class="btn btn-outline-secondary" id="toggleDriverPassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <div class="form-check">
                            <input type="checkbox" class="form-check-input" id="rememberDriver">
                            <label class="form-check-label" for="rememberDriver">Remember me</label>
                        </div>
                        <a href="#" class="text-decoration-none">Forgot Password?</a>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Login</button>
                    
                    <p class="text-center mt-3">Don't have an account? <a href="driver_register.jsp">Sign up</a></p>
                    
                </form>
            </div>
        </div>
    </div>

    <script>
        // Show/Hide Password Toggle
        document.getElementById("toggleDriverPassword").addEventListener("click", function () {
            const passwordField = document.getElementById("driverPassword");
            const icon = this.querySelector("i");

            if (passwordField.type === "password") {
                passwordField.type = "text";
                icon.classList.remove("bi-eye");
                icon.classList.add("bi-eye-slash");
            } else {
                passwordField.type = "password";
                icon.classList.remove("bi-eye-slash");
                icon.classList.add("bi-eye");
            }
        });
    </script>

     <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.js"></script>
    
</body>
</html>

