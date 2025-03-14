<%-- 
    Document   : login_success
    Created on : Feb 21, 2025, 11:34:32 PM
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
  <title>Welcome Home | Mega Cabs</title>
  
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
                <span class="navbar-toggler-icon"></span> Menu
            </button>

            <div class="collapse navbar-collapse" id="navbarNav">
                <!-- Left side links -->
                <ul class="navbar-nav ms-auto"> <!-- Align left side links -->
                    <li class="nav-item active"><a href="index.jsp" class="nav-link">Home</a></li>
                    <li class="nav-item"><a href="offers.html" class="nav-link">Offers</a></li>
                    <% if (userId != null) { %>
                    <li class="nav-item"><a href="booking.jsp" class="nav-link">Booking</a></li>
                    <% } %>
                    <li class="nav-item"><a href="help.jsp" class="nav-link">Help</a></li>
                    <li class="nav-item"><a href="about.html" class="nav-link">About</a></li>
                </ul>

                
                
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
    <section class="hero-section" style="background-image: url('assets/images/bg_1.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text justify-content-center align-items-center">
          <div class="col-lg-8 ftco-animate">
            <div class="text w-100 text-center mb-md-5 pb-md-5">
                <h1 class="mb-4" style="font-size: 54px; margin-top: 100px;">Welcome to Mega Cabs</h1>
              <p style="font-size: 26px;">Your reliable ride to anywhere!</p>

              <div class="subheading">How to book a cab?</div>

              <!-- Button to FAQ -->
              <a href="#faq" class="btn btn-primary mt-4">Check our FAQ</a>
            </div>
          </div>
        </div>
      </div>
    </section>



    <!-- Features Section -->
    <section class="features py-5">
      <div class="container">
        <div class="row text-center">
          <div class="col-md-4">
            <div class="feature-box">
              <img src="assets/images/2.jpg" alt="Cab" class="img-fluid">
              <h3>Safe & Reliable</h3>
              <p>Our drivers ensure your safety and comfort.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="feature-box">
              <img src="assets/images/3.jpg" alt="Cab" class="img-fluid">
              <h3>Affordable Rates</h3>
              <p>Best fares for your travels, without hidden charges.</p>
            </div>
          </div>
          <div class="col-md-4">
            <div class="feature-box">
              <img src="assets/images/1.jpeg" alt="Cab" class="img-fluid">
              <h3>24/7 Availability</h3>
              <p>We are always here, anytime you need us.</p>
            </div>
          </div>
        </div>
      </div>
    </section>

   <!-- Book Now Section -->
    <section id="book-now" class="book-now text-center py-5">
      <div class="container">
        <h2 class="mb-4">Book Your Ride Now</h2>
        <p class="mb-5">Fill in your details below to book your next ride.</p>
        <form action="<%= (userId == null) ? "login.jsp" : "booking.jsp" %>" method="GET"> <!-- Redirect to login page -->
          <input type="text" class="form-control mb-3 form-input" placeholder="Your Name">
          <input type="text" class="form-control mb-3 form-input" placeholder="Pick-Up Location">
          <input type="text" class="form-control mb-3 form-input" placeholder="Drop-Off Location">
          <button type="submit" class="btn btn-primary btn-lg">Book Now</button>
        </form>
      </div>
    </section>

    <!-- FAQ Section -->
    <section id="faq" class="faq bg-dark text-white py-5">
        <div class="container">
            <h2 class="text-center mb-4">FAQs</h2>
                <p class="text-center mb-5">
                    <a href="help.html" class="text-white">Discover more information about Mega Cabs</a>
                </p>

            <div class="accordion" id="faqAccordion">
                <!-- Question 1 -->
                <div class="card">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn btn-link text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                                How do I book a ride?
                            </button>
                        </h5>
                    </div>
                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                        <div class="card-body">
                            First of all you should register into our system and then login to book a ride.
                        </div>
                    </div>
                </div>

                <!-- Question 2 -->
                <div class="card">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn btn-link text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                What payment methods do you accept?
                            </button>
                        </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                        <div class="card-body">
                            We accept cash payment, credit, debit card payments as well as online payments.
                        </div>
                    </div>
                </div>

                <!-- Question 3 -->
                <div class="card">
                    <div class="card-header" id="headingThree">
                        <h5 class="mb-0">
                            <button class="btn btn-link text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                How do I track my ride after booking?
                            </button>
                        </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                        <div class="card-body">
                            You can track your ride by entering the booking number provided when booking a cab.
                        </div>
                    </div>
                </div>

                <!-- Question 4 -->
                <div class="card">
                    <div class="card-header" id="headingFour">
                        <h5 class="mb-0">
                            <button class="btn btn-link text-white" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                Can I cancel or modify my booking?
                            </button>
                        </h5>
                    </div>
                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                        <div class="card-body">
                            Yes, you can cancel your bookings but you can't change it once the booking is confirmed.
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    
    <!-- Driver Section -->
    <section class="driver-section driver-intro" style="background-image: url('images/1.jpeg');">
        <div class="overlay"></div>
            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <div class="col-md-8 text-center heading-section heading-section-white ftco-animate">
                        <h2 class="mb-4">Do You Want To Earn With Us? Become a Driver Today!</h2>
                            <a href="Admin/driver_register.jsp" class="btn btn-outline-light btn-lg">Become A Driver</a>
                    </div>
                </div>
            </div>
    </section>

    <!-- Testimonial Section -->
    <section id="testimonials" class="testimonials py-5">
        <div class="container">
            <div class="row">
                <div class="col text-center">
                    <h2 class="mb-4">What Our Clients Say</h2>
                    <div id="testimonial-carousel" class="owl-carousel owl-theme">
                        <!-- Testimonial 1 -->
                        <div class="item">
                            <div class="testimonial-content">
                                <p class="testimonial-text">"This is by far the best service I have ever used! The booking process was smooth, and the driver was so friendly. Highly recommend!"</p>
                                <p class="testimonial-author">John Doe</p>
                                <p class="testimonial-role">CEO, Brandex Corp</p>
                            </div>
                        </div>
                        <!-- Testimonial 2 -->
                        <div class="item">
                            <div class="testimonial-content">
                                <p class="testimonial-text">"Amazing experience! The ride was comfortable, and the driver was punctual. Will definitely book again."</p>
                                <p class="testimonial-author">Jane Smith</p>
                                <p class="testimonial-role">Marketing Director</p>
                            </div>
                        </div>
                        <!-- Testimonial 3 -->
                        <div class="item">
                            <div class="testimonial-content">
                                <p class="testimonial-text">"I loved the seamless booking experience and the vehicle was in great condition. Thanks for the reliable service!"</p>
                                <p class="testimonial-author">Michael Johnson</p>
                                <p class="testimonial-role">Entrepreneur</p>
                            </div>
                        </div>
                        <!-- Testimonial 4 -->
                        <div class="item">
                            <div class="testimonial-content">
                                <p class="testimonial-text">"Efficient and easy! The service exceeded my expectations. Great team, great drivers, I will use it again!"</p>
                                <p class="testimonial-author">Emily Davis</p>
                                <p class="testimonial-role">Freelancer</p>
                            </div>
                        </div>
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

                      
    

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
  
<!-- Link to Custom JavaScript -->
<script src="assets/js/script.js"></script> 

<!-- Owl Carousel JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.4/owl.carousel.min.js"></script>

<!-- Initialize Owl Carousel -->
<script>
    $(document).ready(function(){
        $("#testimonial-carousel").owlCarousel({
            items: 1,
            loop: true,
            margin: 10,
            nav: false,
            dots: true,
            autoplay: true,
            autoplayTimeout: 3000,
            autoplayHoverPause: true
        });
    });
    
    
    document.addEventListener("DOMContentLoaded", function () {
    fetchUserDetails();
});

function fetchUserDetails() {
    fetch('GetUserDetailsServlet') // Calls the servlet to fetch user details
        .then(response => response.json())
        .then(data => {
            if (data.error) {
                console.error('Error fetching user details:', data.error);
                // Handle errors here (optional)
            } else {
                // Populate the modal with user details
                document.getElementById('userEmail').textContent = data.email || 'N/A';
                document.getElementById('userContact').textContent = data.contact || 'N/A';
                document.getElementById('userAddress').textContent = data.address || 'N/A';
            }
        })
        .catch(error => {
            console.error('Error fetching user details:', error);
            // Optional: Show a message in the modal or elsewhere
        });
}



</script>

</body>
</html>
