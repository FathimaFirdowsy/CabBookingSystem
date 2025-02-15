<%-- 
    Document   : booking
    Created on : Feb 8, 2025, 11:08:26 PM
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
  <title>Booking | Mega Cabs</title>
  
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
                        <a href="track_booking.jsp" class="btn btn-light">Check Your Booking?</a>
                    </li>
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
                <h1 class="mb-4" style="font-size: 50px">Your Journey with Kangaroo Cabs Starts Here</h1>
              <p style="font-size: 24px;">Your safety and comfort is our concern</p>
            </div>
          </div>
        </div>
      </div>
    </section>

    <!-- Booking Section -->
    <section class="booking-section">
        <div class="container">
            <div class="row">
                <!-- Cab Selection -->
                <div class="col-md-6">
                    <h3>Select a Vehicle</h3>
                    <div class="cab-list row" id="cabList">
                        <!-- Cabs will be loaded dynamically here -->
                    </div>
                </div>

                <!-- Booking Form -->
                <div class="col-md-6">
                    <form id="bookingForm">
                        <div class="mb-3">
                            <label for="pickup" class="form-label">Pickup Location</label>
                            <input type="text" class="form-control" id="pickup" placeholder="Enter Pickup Location" required>
                        </div>
                    <h3>Book Your Ride</h3>

                        <div class="mb-3">
                            <label for="drop" class="form-label">Drop Location</label>
                            <input type="text" class="form-control" id="drop" placeholder="Enter Drop Location" required>
                        </div>

                        <div class="mb-3">
                            <label for="datetime" class="form-label">Date & Time</label>
                            <input type="datetime-local" class="form-control" id="datetime" required>
                        </div>

                        <div class="mb-3">
                            <label for="offer" class="form-label">Offer Code (Optional)</label>
                            <input type="text" class="form-control" id="offer" placeholder="Enter Offer Code">
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Book Now</button>
                    </form>
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
    
<script>
document.addEventListener("DOMContentLoaded", function () {
    const cabData = [
        { id: 1, model: "Toyota Prius", icon: "fa-car", description: "Hybrid, 4 seats, AC" },
        { id: 2, model: "Suzuki Alto", icon: "fa-taxi", description: "Compact, 4 seats, Budget" },
        { id: 3, model: "Nissan Serena", icon: "fa-bus", description: "Minivan, 7 seats, Family" },
        { id: 4, model: "BMW 5 Series", icon: "fa-star", description: "Luxury, 4 seats, Premium" }
    ];

    const cabListContainer = document.getElementById("cabList");

    cabData.forEach(cab => {
        const cabElement = document.createElement("div");
        cabElement.classList.add("col-md-3", "cab-card");
        cabElement.innerHTML = `
            <i class="fa ${cab.icon} fa-3x"></i>
            <h5>${cab.model}</h5>
            <p>${cab.description}</p>
        `;
        cabElement.addEventListener("click", () => selectCab(cab.model));
        cabListContainer.appendChild(cabElement);
    });

    function selectCab(model) {
        alert(`You selected ${model}`);
    }
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
