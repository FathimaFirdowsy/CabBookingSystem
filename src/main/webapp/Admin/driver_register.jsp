<%-- 
    Document   : driver_register
    Created on : Feb 15, 2025, 11:34:50 PM
    Author     : USER
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/png" href="../assets/images/cab_icon.png" />
    <title>Driver Registration | Mega City Cab</title>
    
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <!-- ✅ Latest FontAwesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <!-- ✅ Font Poppins -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="../assets/css/admin.css"> <!-- External CSS file -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    
</head>

<body class="driver-register-bg">

    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card driver-register-card">
            <div class="card-body">
                <h2 class="text-center mb-4">Driver Registration</h2>
                
                <form id="driverRegisterForm">
                    <div class="mb-3">
                        <label for="name" class="form-label">Full Name</label>
                        <input type="text" class="form-control" id="name" placeholder="Enter your full name" required>
                    </div>

                    <div class="mb-3">
                        <label for="email" class="form-label">Email</label>
                        <input type="email" class="form-control" id="email" placeholder="Enter your email" required>
                    </div>

                    <div class="mb-3">
                        <label for="password" class="form-label">Password</label>
                        <div class="input-group">
                            <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
                            <button type="button" class="btn btn-outline-secondary" id="togglePassword">
                                <i class="bi bi-eye"></i>
                            </button>
                        </div>
                    </div>
                    
                    <div class="mb-3">
                        <label for="contact" class="form-label">Contact Number</label>
                        <input type="text" class="form-control" id="contact" placeholder="Enter your contact number" required>
                    </div>

                    <div class="mb-3">
                        <label for="workType" class="form-label">Work Type</label>
                        <select class="form-select" id="workType" required>
                            <option value="" disabled selected>Select Work Type</option>
                            <option value="Full-Time">Full-Time</option>
                            <option value="Part-Time">Part-Time</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="workingArea" class="form-label">Working Area</label>
                        <select class="form-select" id="workingArea" required>
                            <option value="" disabled selected>Select Working Area</option>
                            <option value="Dehiwala">Dehiwala</option>
                            <option value="Mount-Lavinia">Mount-Lavinia</option>
                            <option value="Kollupitiya">Kollupitiya</option>
                            <option value="Bambalapitiya">Bambalapitiya</option>
                            <option value="Wellawatta">Wellawatta</option>
                            <option value="Galle Face">Galle Face</option>
                            <option value="Maradana">Maradana</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="cabType" class="form-label">Cab Selection</label>
                        <select class="form-select" id="cabType" required>
                            <option value="" disabled selected>Select Your Cab</option>
                            <option value="Toyota Prius">Toyota Prius</option>
                            <option value="Honda Fit">Honda Fit</option>
                            <option value="Suzuki WagonR">Suzuki WagonR</option>
                            <option value="Nissan Leaf">Nissan Leaf</option>
                        </select>
                    </div>

                    <div class="mb-3">
                        <label for="licenseNo" class="form-label">License Number</label>
                        <input type="text" class="form-control" id="licenseNo" placeholder="Enter your license number" required>
                    </div>

                    <button type="submit" class="btn btn-primary w-100">Register</button>

                    <p class="text-center mt-3">Already have an account? <a href="driver_login.jsp">Sign in</a></p>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Show/Hide Password Toggle
        document.getElementById("togglePassword").addEventListener("click", function () {
            const passwordField = document.getElementById("password");
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

        // Handle Form Submission (For Future Backend Integration)
        document.getElementById("driverRegisterForm").addEventListener("submit", function(event) {
            event.preventDefault();
            alert("Driver Registration Submitted!");
        });
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-icons/1.10.5/font/bootstrap-icons.min.js"></script>

</body>
</html>

