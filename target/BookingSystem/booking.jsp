<%-- 
    Document   : booking
    Created on : Feb 8, 2025, 11:08:26 PM
    Author     : Admin
--%>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="jakarta.servlet.http.HttpSession"%>
<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %> 

<%
   
    Integer userId = (Integer) session.getAttribute("userId"); // Retrieve UserID from the session
    String username = (String) session.getAttribute("username"); // Retrieve Username from the session
%>


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
            <a class="navbar-brand" href="index.jsp">Mega<span>Cabs</span></a>
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
                <h1 class="mb-4" style="font-size: 50px">Your Journey with Mega Cabs Starts Here</h1>
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
                    <h3>Select a Cab</h3>
                    <div class="row" id="cabList">
                        <!-- Cabs -->
                        <div class="col-lg-6 mb-4">
                            <div class="card shadow-sm border-0">
                                <img src="assets/images/cab1.jpg" alt="Toyota Highlander" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                                <div class="card-body text-center">
                                    <h5 class="card-title fw-bold">Suzuki</h5>
                                    <p class="mb-1"><strong>Type:</strong> Sedan</p>
                                    <p class="mb-1"><strong>Seats:</strong> 4</p>
                                    <p class="text-muted">Spacious and comfortable for long trips.</p>
                                    <button class="btn btn-primary w-100 mt-2" onclick="selectCab(1)">Select</button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mb-4">
                            <div class="card shadow-sm border-0">
                                <img src="assets/images/cab2.jpg" alt="Toyota Prius" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                                <div class="card-body text-center">
                                    <h5 class="card-title fw-bold">Toyota Prius</h5>
                                    <p class="mb-1"><strong>Type:</strong> Economy</p>
                                    <p class="mb-1"><strong>Seats:</strong> 4</p>
                                    <p class="text-muted">Perfect for budget-friendly city rides.</p>
                                    <button class="btn btn-primary w-100 mt-2" onclick="selectCab(2)">Select</button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mb-4">
                            <div class="card shadow-sm border-0">
                                <img src="assets/images/cab4.jpg" alt="Mercedes-Benz" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                                <div class="card-body text-center">
                                    <h5 class="card-title fw-bold">Mercedes-Benz</h5>
                                    <p class="mb-1"><strong>Type:</strong> Luxury</p>
                                    <p class="mb-1"><strong>Seats:</strong> 4</p>
                                    <p class="text-muted">A high-end ride with top-class comfort and amenities.</p>
                                    <button class="btn btn-primary w-100 mt-2" onclick="selectCab(3)">Select</button>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-6 mb-4">
                            <div class="card shadow-sm border-0">
                                <img src="assets/images/cab5.jpg" alt="Toyota Sienna" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                                <div class="card-body text-center">
                                    <h5 class="card-title fw-bold">Toyota Sienna</h5>
                                    <p class="mb-1"><strong>Type:</strong> Mini Van</p>
                                    <p class="mb-1"><strong>Seats:</strong> 6</p>
                                    <p class="text-muted">Spacious and comfortable, perfect for group or family trips.</p>
                                    <button class="btn btn-primary w-100 mt-2" onclick="selectCab(4)">Select</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Booking Form -->
                <div class="col-md-6">
                    <form id="bookingForm">
                            <input type="hidden" id="userId" value="<%= userId != null ? userId : "" %>">
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

    <!-- Booking Modal -->
<div class="modal fade" id="bookingModal" tabindex="-1" aria-labelledby="bookingModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="bookingModalLabel">Booking Status</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body text-center" id="modalBody">
        <!-- Searching Animation -->
        <div id="searchingSection">
          <i class="fa fa-spinner fa-spin fa-3x"></i>
          <p class="mt-3">Searching for a cab...</p>
        </div>
        
        <!-- Booking Details Section (Initially Hidden) -->
        <div id="bookingDetails" class="d-none">
          <h5>Booking Confirmed!</h5>
          <p><strong>Booking ID:</strong> <span id="bookingId">123456</span> <button class="btn btn-sm btn-outline-primary" onclick="copyBookingId()">Copy</button></p>
          <p><strong>Cab Name:</strong> <span id="cabName"></span></p>
          <p><strong>Driver Name:</strong> <span id="driverName"></span></p>
          <p><strong>License Number:</strong> <span id="licenseNumber"></span></p>
          <p><strong>Fare:</strong> <span id="fare"></span></p>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>



 
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
  
  <!-- JavaScript & Bootstrap -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>

  <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>

  <!-- Link to Custom JavaScript -->
  <script src="assets/js/script.js"></script> 

  
<script>
 let selectedCabID = null;

// JavaScript to retrieve the user ID (from the hidden input or directly from the session)
var userId = document.getElementById("userId").value;

// Function to handle cab selection
function selectCab(cabID) {
    selectedCabID = cabID;
    alert("Cab ID " + cabID + " selected!");
}

// Form submission for booking
document.getElementById("bookingForm").addEventListener("submit", function(event) {
    event.preventDefault(); // Prevent default form submission

    // Check if cab is selected
    if (selectedCabID == null) {
        alert("Please select a cab first!");
        return;
    }

    // Ensure that userId is not null or undefined
    if (userId == null || userId === "") {
        alert("User not logged in!");
        return;  // Stop the form submission
    }

    // Create a FormData object
    const formData = new FormData(this);
    formData.append("userId", userId);  // Add userId to the form data
    formData.append("cabID", selectedCabID);  // Add cabID to the form data

    // Check if offer is provided, and append it only if it's not null or empty
    const offer = document.getElementById("offer").value;
    if (offer && offer.trim() !== "") {
        formData.append("offer", offer);  // Add offer to the form data if present
    } else {
        formData.append("offer", "");  // Ensure offer is appended, even if empty
    }

    // Send the booking data to the backend for processing (before showing the modal)
    fetch("BookingConfirmationServlet", {
        method: "POST",
         headers: {
        'Content-Type': 'application/x-www-form-urlencoded'  // Ensure it's not multipart/form-data
    },
        body: formData
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();  // Parse JSON response
    })
    .then(data => {
        if (data.status === "success") {
            // After receiving bookingConfirmId, open modal with booking details
            const bookingConfirmId = data.bookingConfirmId;
            openBookingModal(bookingConfirmId);  // Open modal and fetch further details for the booking
        } else {
            alert("There was an issue processing your booking. Please try again.");
        }
    })
    .catch(error => {
        console.error("Error during booking:", error);
        // Show a user-friendly error message
        alert("There was an error processing your booking. Please try again later.");
    });
});

// Function to open the booking modal with the booking details
function openBookingModal(bookingConfirmId) {
    // Send the bookingConfirmId to fetch further details from BookingServlet
    fetch("BookingServlet", {
        method: "POST",
        body: JSON.stringify({ bookingConfirmId: bookingConfirmId }),
        headers: {
            'Content-Type': 'application/json'
        }
    })
    .then(response => {
        if (!response.ok) {
            throw new Error(`HTTP error! Status: ${response.status}`);
        }
        return response.json();
    })
    .then(data => {
        // Show the modal after the data has been processed
        if (data.status === "success") {
            var bookingModal = new bootstrap.Modal(document.getElementById("bookingModal"));
            bookingModal.show();

            // Update modal with booking details (you can customize this based on your backend response)
            document.getElementById("bookingId").textContent = data.bookingId || "N/A";  // Assuming backend sends this info
            document.getElementById("cabName").textContent = data.cabName || "N/A";
            document.getElementById("driverName").textContent = data.driverName || "N/A";
            document.getElementById("licenseNumber").textContent = data.licenseNumber || "N/A";
            document.getElementById("fare").textContent = data.fare || "N/A";

            // Hide the searching animation and show booking details
            document.getElementById("searchingSection").classList.add("d-none");
            document.getElementById("bookingDetails").classList.remove("d-none");
        } else {
            alert("No booking details found. Please try again later.");
        }
    })
    .catch(error => {
        console.error("Error during fetching booking details:", error);
        // Show a user-friendly error message
        alert("There was an error fetching the booking details. Please try again later.");
    });
}

// Function to copy booking ID
function copyBookingId() {
    var bookingIdText = document.getElementById("bookingId").textContent;
    navigator.clipboard.writeText(bookingIdText).then(() => {
        alert("Booking ID copied to clipboard!");
    }).catch(error => {
        console.error("Error copying booking ID:", error);
        alert("There was an error copying the Booking ID.");
    });
}


</script>



<style>
  .modal-body p {
    font-size: 18px;
  }
  .fa-spinner {
    color: #007bff;
  }
</style>

 
</body>
</html>
