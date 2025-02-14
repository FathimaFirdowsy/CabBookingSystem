<%-- 
    Document   : help
    Created on : Feb 8, 2025, 11:08:33 PM
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
  <title>Help | Mega Cabs</title>
  
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


<body>
    
    <!-- START nav -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="index.html">Mega<span>Cabs</span></a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="oi oi-menu"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- Left side links -->
                <ul class="navbar-nav ms-auto"> <!-- Align left side links -->
                    <li class="nav-item active"><a href="index.html" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="offers.html" class="nav-link">Offers</a></li>
                    <li class="nav-item"><a href="booking.jsp" class="nav-link">Booking</a></li>
                    <li class="nav-item"><a href="help.jsp" class="nav-link">Help</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                </ul>

                <!-- Right side links (Login button) -->
                <ul class="navbar-nav">
                    <li class="nav-item">
                        <a href="login.jsp" class="btn btn-light">Login</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END nav -->
   
    <!-- Help Section -->
  <section class="help-section mt-5">
    <div class="container">
      <div class="row">
          <div class="row text-center">
        <div class="col">
          <h1 class="display-4 mb-2">Connect with Us</h1>
           <p class="lead">We’re here to answer your questions and provide support</p>
        </div>
      </div>  
          
          
        <!-- Contact Information -->
        <div class="col-lg-5">
          <div class="contact-card">
            <h3 class="text-primary">Contact Us</h3>
            <hr>
            <div class="contact-info">
              <p><i class="fa fa-envelope"></i> ride@megacabs.com</p>
              <p><i class="fa fa-phone"></i> +94 112 588 588</p>
              <p><i class="fa fa-map-marker"></i> Mega Cabs - Headquarters, No 11 A, Gunawardena Mawatha, Wijerama, Nugegoda, Sri Lanka</p>
            </div>
          </div>
        </div>

        <!-- Query Form -->
        <div class="col-lg-7">
          <div class="contact-card">
            <h3 class="text-primary">Leave Us a Message</h3>
            <hr>
            <form action="submit_query.jsp" method="POST">
              <div class="mb-3">
                <label for="name" class="form-label">Name</label>
                <input type="text" class="form-control" id="name" name="name" placeholder="Enter your name" required>
              </div>

              <div class="mb-3">
                <label for="email" class="form-label">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="Enter your email" required>
              </div>

              <div class="mb-3">
                <label for="message" class="form-label">Message</label>
                <textarea class="form-control" id="message" name="message" rows="4" placeholder="Write your message here..." required></textarea>
              </div>

              <button type="submit" class="btn btn-submit w-100">Submit</button>
            </form>
          </div>
        </div>
      </div>

      <!-- Steps & Guidelines Section -->
      <div class="mt-5">
        <div class="steps-section">
          <h3 class="text-primary text-center">How to Book a Vehicle</h3>
          <hr>
          <div class="step">
            <i class="fa fa-user"></i>
            <p><strong>Step 1:</strong> Sign in or create an account on Mega Cabs.</p>
          </div>
          <div class="step">
            <i class="fa fa-map-marker"></i>
            <p><strong>Step 2:</strong> Enter your pickup location and destination.</p>
          </div>
          <div class="step">
            <i class="fa fa-calendar"></i>
            <p><strong>Step 3:</strong> Select the date and time for your ride.</p>
          </div>
          <div class="step">
            <i class="fa fa-car"></i>
            <p><strong>Step 4:</strong> Choose your preferred vehicle type.</p>
          </div>
          <div class="step">
            <i class="fa fa-credit-card"></i>
            <p><strong>Step 5:</strong> Confirm booking and make a payment if required.</p>
          </div>
          <div class="step">
            <i class="fa fa-check-circle"></i>
            <p><strong>Step 6:</strong> Receive a booking confirmation and track your cab in real-time.</p>
          </div>
        </div>
      </div>
    </div>
  </section>


 
  <!-- Footer Section -->
    <footer class="footer text-white">
      <div class="container">
        <div class="row justify-content-between">

          <!-- About Mega Cabs -->
          <div class="col-md-4">
            <h4>About Mega Cabs</h4>
            <p>We are a leading transportation provider offering safe, reliable, and affordable rides. Whether you're booking a ride for business or leisure, Mega Cabs ensures you a comfortable journey with professional drivers.</p>
          </div>

          <!-- Menu Links -->
          <div class="col-md-2">
            <ul class="menu list-unstyled">
              <li><a href="https://megacabs.lk/terms-and-conditions" target="_blank">T & C</a></li>
              <li><a href="https://megacabs.lk/privacy-policy" target="_blank">Privacy Policy</a></li>
              <li><a href="https://megacabs.lk/careers" target="_blank">Careers</a></li>
              <li><a href="https://megacabs.lk/contact-megacabs" target="_blank">Contact Us</a></li>
            </ul>
          </div>

          <!-- Social Media Icons -->
          <div class="col-md-2 text-center">
            <ul class="social-icons list-inline">
              <li class="list-inline-item">
                <a href="https://www.facebook.com/megacabs.lk" target="_blank"><i class="fa fa-facebook"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="https://twitter.com/MegaCabsLK" target="_blank"><i class="fa fa-twitter"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.instagram.com/megacabslk/" target="_blank"><i class="fa fa-instagram"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.linkedin.com/company/digital-lanka-pvt-ltd/" target="_blank"><i class="fa fa-linkedin"></i></a>
              </li>
              <li class="list-inline-item">
                <a href="https://www.youtube.com/SocialMegaCabs/" target="_blank"><i class="fa fa-youtube-play"></i></a>
              </li>
            </ul>
          </div>
        </div>

        <!-- Copyright -->
        <div class="text-center mt-4">
          <p>&copy; 2025 - Mega Cabs. All rights reserved.</p>
        </div>
      </div>
    </footer>   
    
  
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

  <!-- Link to Custom JavaScript -->
  <script src="assets/js/script.js"></script> 

</body>
</html>