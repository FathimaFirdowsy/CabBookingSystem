<%-- 
    Document   : track_booking
    Created on : Feb 14, 2025, 10:54:21 PM
    Author     : USER
--%>

<%
    String username = (String) session.getAttribute("username");
    Integer userId = (Integer) session.getAttribute("userId");

%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  
  <!-- Favicon -->
  <link rel="icon" type="image/png" href="assets/images/cab_icon.png" />
  <title>Track Your Booking | Mega Cabs</title>
  
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
                    <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="offers.html" class="nav-link">Offers</a></li>
                    <li class="nav-item"><a href="booking.jsp" class="nav-link">Booking</a></li>
                    <li class="nav-item"><a href="help.jsp" class="nav-link">Help</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                </ul>

                <!-- Right side links (Login button) -->
                 <ul class="navbar-nav">
                    <% if (userId == null) { %>
                        <!-- If user is not logged in, show Login button -->
                        <li class="nav-item">
                            <a href="login.jsp" class="btn btn-light">Login</a>
                        </li>
                    <% } else { %>
                        <!-- If user is logged in, show My Account button -->
                        <li class="nav-item">
                            <button class="btn btn-light" data-bs-toggle="modal" data-bs-target="#accountModal">My Account</button>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>
    <!-- END nav -->
   
    
        <!-- Hero Section -->
    <section class="hero-section" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 ftco-animate">
            <div class="text w-100 text-center mb-md-5 pb-md-5">
              <h1 class="mb-4" style="font-size: 50px">Track Your Booked Vehicle</h1>
              <p style="font-size: 24px;">Enter your Booking ID to get real-time vehicle tracking details.</p>

              <!-- Search Bar -->
              <div class="search-container mt-4">
                <div class="input-group">
                  <input type="text" id="bookingIdInput" class="form-control" placeholder="Enter Booking ID" aria-label="Booking ID">
                  <button class="btn btn-primary" id="trackBtn">Track</button>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Tracking Results Section -->
    <section id="trackingResults" class="tracking-results-section">
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-8">
            <div class="card tracking-card">
              <div class="card-body">
                <h3 class="card-title text-center">Vehicle Details</h3>
                <div id="resultContent" class="text-center">
                  <p>Enter a valid Booking ID above to track your ride.</p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>

    
     <!-- Booking History Section -->
    <section id="bookingHistory" class="booking-history-section mt-5">
      <div class="container">
        <h3 class="text-center">Your Booking History</h3>
        <div class="table-responsive">
          <table class="table table-striped">
            <thead>
              <tr>
                <th>Booking ID</th>
                <th>Date</th>
                <th>Pickup Location</th>
                <th>Drop Location</th>
                <th>Ride Fare</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody id="bookingHistoryTable">
              <tr><td colspan="5" class="text-center">Loading booking history...</td></tr>
            </tbody>
          </table>
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
    
    
          <!-- User Account Modal -->
<div class="modal fade" id="accountModal" tabindex="-1" aria-labelledby="accountModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="accountModalLabel">My Account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <!-- Displaying Username and UserId from session -->
                <p><strong>Username:</strong> <%= username %></p>
                <p><strong>User ID:</strong> <%= userId %></p>
                
                <p><strong>Email:</strong> <span id="userEmail">Loading...</span></p>
                <p><strong>Contact Number:</strong> <span id="userContact">Loading...</span></p>
                <p><strong>Address:</strong> <span id="userAddress">Loading...</span></p>
            </div>
            <div class="modal-footer">
                <a href="${pageContext.request.contextPath}/LogoutServlet" class="btn btn-danger">Logout</a>
            </div>
        </div>
    </div>
</div>
    
    

    <script>
      document.addEventListener("DOMContentLoaded", function() {
        fetch("/api/getBookingHistory")
          .then(response => response.json())
          .then(data => {
            let tableBody = document.getElementById("bookingHistoryTable");
            tableBody.innerHTML = "";
            data.forEach(booking => {
              let row = `<tr>
                <td>${booking.id}</td>
                <td>${booking.date}</td>
                <td>${booking.pickup}</td>
                <td>${booking.drop}</td>
                <td>${booking.fare}</td>
                <td>${booking.status}</td>
              </tr>`;
              tableBody.innerHTML += row;
            });
          })
          .catch(error => console.error("Error loading booking history:", error));
      });
    </script>
    
    
    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
  <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
  
  <!-- JavaScript & Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

  <!-- Link to Custom JavaScript -->
  <script src="assets/js/script.js"></script>   
    
</body>

</html>

