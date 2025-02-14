<%-- 
    Document   : login
    Created on : Feb 8, 2025, 11:07:53 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <!-- Favicon -->
  <link rel="icon" type="image/png" href="assets/images/cab_icon.png" />
  <title>Login | Mega Cabs</title>
  
  <!-- CDN link Bootstrap 5.3.3 CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <!-- Font Poppins -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap" rel="stylesheet">
  <!-- Owl Carousel CSS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.carousel.min.css" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/assets/owl.theme.default.min.css" />
  <link rel="stylesheet" href="vendor/bootstrap-5.3.3-dist/css/bootstrap.rtl.min.css" type="text/css"/>
  <link rel="stylesheet" href="vendor/bootstrap-5.3.3-dist/css/bootstrap.css" type="text/css">
  <link rel="stylesheet" href="vendor/bootstrap-5.3.3-dist/css/bootstrap-utilities.min.css" type="text/css"/>
  <link rel="stylesheet" href="vendor/bootstrap-5.3.3-dist/css/bootstrap-utilities.css" type="text/css">
  <!-- Custom style sheet -->
  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body style="background-image: url('assets/images/login_bg.jpg'); background-size: 250vh; background-position: center;">
    <!-- Login Section -->
    <section class="login-section py-5">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-6 col-12">
                    <div class="card shadow-lg">
                        <div class="card-body p-4">
                            <h3 class="card-title text-center mb-4">Login to Mega Cabs</h3>
                            
                            <!-- Login Form -->
                            <form action="#" method="POST">
                                <div class="mb-3">
                                    <label for="username" class="form-label">Username</label>
                                    <input type="text" class="form-control" id="username" placeholder="Enter your username" required>
                                </div>
                                
                                <div class="mb-3">
                                    <label for="password" class="form-label">Password</label>
                                    <input type="password" class="form-control" id="password" placeholder="Enter your password" required>
                                </div>
                                
                                <div class="mb-3 form-check">
                                    <input type="checkbox" class="form-check-input" id="showPassword">
                                    <label class="form-check-label" for="showPassword">Show Password</label>
                                </div>

                                <div class="d-flex justify-content-between">
                                    <a href="#" class="text-primary">Forgot Password?</a>
                                    <a href="register.jsp" class="text-primary">Don't have an account? Sign Up</a>
                                </div>
                                
                                <div class="text-center mt-4">
                                    <button type="submit" class="btn btn-primary w-100">Login</button>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

  <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  
<!-- Link to Custom JavaScript -->
<script src="assets/js/script.js"></script> 
    
    <!-- Custom JS for show password functionality -->
    <script>
        document.getElementById('showPassword').addEventListener('change', function() {
            const passwordField = document.getElementById('password');
            if (this.checked) {
                passwordField.type = 'text';
            } else {
                passwordField.type = 'password';
            }
        });
    </script>
</body>
</html>

