<%-- 
    Document   : viewCabs
    Created on : Mar 4, 2025, 11:11:12 PM
    Author     : USER
--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cab Selection</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
    <style>
        .card-body {
            padding: 15px;
        }

        .card-title {
            font-size: 1.25rem;
            font-weight: bold;
        }

        .card {
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 10px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .row {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>

    <section class="booking-section">
        <div class="container">
            <div class="row">
                <!-- Cab Selection -->
                <div class="col-md-6">
                    <h3>Select a Cab</h3>
                    <div class="row" id="cabList">
                        <!-- Hardcoded Cab 1 -->
                        <div class="card shadow-sm border-0">
                            <img src="https://via.placeholder.com/150" alt="Toyota Highlander" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                            <div class="card-body text-center">
                                <h5 class="card-title fw-bold">Toyota Highlander</h5>
                                <p class="mb-1"><strong>Type:</strong> Sedan</p>
                                <p class="mb-1"><strong>Seats:</strong> 4</p>
                                <p class="text-muted">Spacious and comfortable for long trips.</p>
                                <button class="btn btn-primary w-100 mt-2" onclick="selectCab(1)">Select</button>
                            </div>
                        </div>

                        <!-- Hardcoded Cab 2 -->
                        <div class="card shadow-sm border-0">
                            <img src="https://via.placeholder.com/150" alt="Toyota Prius" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                            <div class="card-body text-center">
                                <h5 class="card-title fw-bold">Toyota Prius</h5>
                                <p class="mb-1"><strong>Type:</strong> Economy</p>
                                <p class="mb-1"><strong>Seats:</strong> 4</p>
                                <p class="text-muted">A fuel-efficient hybrid car, perfect for budget-friendly city rides.</p>
                                <button class="btn btn-primary w-100 mt-2" onclick="selectCab(2)">Select</button>
                            </div>
                        </div>

                        <!-- Hardcoded Cab 3 -->
                        <div class="card shadow-sm border-0">
                            <img src="https://via.placeholder.com/150" alt="Mercedes-Benz" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
                            <div class="card-body text-center">
                                <h5 class="card-title fw-bold">Mercedes-Benz</h5>
                                <p class="mb-1"><strong>Type:</strong> Luxury</p>
                                <p class="mb-1"><strong>Seats:</strong> 4</p>
                                <p class="text-muted">A high-end premium ride with top-class comfort and amenities.</p>
                                <button class="btn btn-primary w-100 mt-2" onclick="selectCab(3)">Select</button>
                            </div>
                        </div>

                        <!-- Hardcoded Cab 4 -->
                        <div class="card shadow-sm border-0">
                            <img src="https://via.placeholder.com/150" alt="Toyota Sienna" class="card-img-top" style="height: 180px; object-fit: contain; width: 100%;">
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
        </div>
    </section>

    <script>
        // Function to store selected CabID for use in BookingConfirmationServlet
        function selectCab(cabID) {
            // Save the selected CabID in sessionStorage
            sessionStorage.setItem("selectedCabID", cabID);
            alert("You selected Cab ID: " + cabID); // Show selected CabID
        }
    </script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
