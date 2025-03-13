<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pay the Bill - Mega City Cab</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">

    <!-- FontAwesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">

    <style>
        body {
            font-family: 'Poppins', sans-serif;
            background: url('css/images/image15.jpg') no-repeat center center fixed;
            background-size: cover;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .payment-container {
            max-width: 400px;
            width: 100%;
            background: rgba(255, 255, 255, 0.9);
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
            text-align: center;
        }

        .payment-container h3 {
            color: #333;
            font-weight: bold;
        }

        .form-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .form-control {
            height: 45px;
            font-size: 16px;
            border-radius: 8px;
        }

        .input-group-text {
            background-color: #f8f9fa;
            border-right: none;
            font-size: 18px;
        }

        .btn-pay {
            background: #28a745;
            color: white;
            font-size: 18px;
            padding: 12px;
            border-radius: 8px;
            border: none;
            width: 100%;
            transition: 0.3s;
        }

        .btn-pay:hover {
            background: #218838;
        }
    </style>
</head>
<body>

    <div class="payment-container">
        <h3><i class="fas fa-credit-card"></i> Make Payment</h3>
        <form action="PaymentServlet" method="post">
            
            <!-- Cardholder Name -->
            <div class="form-group">
                <label for="cardholderName">Cardholder Name:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-user"></i></span>
                    <input type="text" id="cardholderName" name="cardholderName" class="form-control" required />
                </div>
            </div>

            <!-- Trip Distance -->
            <div class="form-group">
                <label for="tripDistance">Trip Distance (km):</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-road"></i></span>
                    <input type="number" id="tripDistance" name="tripDistance" class="form-control" min="1" required oninput="calculateFare()" placeholder="Enter distance in km" />
                </div>
            </div>

            <!-- Payment Amount -->
            <div class="form-group">
                <label for="amount">Amount to Pay (RM):</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-rupees-sign"></i></span>
                    <input type="text" id="amount" name="amount" class="form-control" required readonly />
                </div>
            </div>

            <!-- Payment Method -->
            <div class="form-group">
                <label for="paymentMethod">Payment Method:</label>
                <select id="paymentMethod" name="paymentMethod" class="form-control">
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                </select>
            </div>

            <!-- Card Number -->
            <div class="form-group">
                <label for="cardNumber">Card Number:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-credit-card"></i></span>
                    <input type="text" id="cardNumber" name="cardNumber" class="form-control" required placeholder="xxxx xxxx xxxx xxxx" />
                </div>
            </div>

            <!-- Expiry Date -->
            <div class="form-group">
                <label for="expiryDate">Expiry Date:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-calendar"></i></span>
                    <input type="text" id="expiryDate" name="expiryDate" class="form-control" placeholder="MM/YY" required />
                </div>
            </div>

            <!-- CVV -->
            <div class="form-group">
                <label for="cvv">CVV:</label>
                <div class="input-group">
                    <span class="input-group-text"><i class="fas fa-lock"></i></span>
                    <input type="text" id="cvv" name="cvv" class="form-control" required placeholder="XXX" />
                </div>
            </div>

            <!-- Hidden booking ID -->
            <input type="hidden" name="bookingId" value="123" />

            <!-- Pay Button -->
            <button type="submit" class="btn btn-pay"><i class="fas fa-check-circle"></i> Pay Now</button>
        </form>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        function calculateFare() {
            let distance = document.getElementById("tripDistance").value;
            let ratePerKm = 2.50; // You can change the fare rate here (e.g., RM2.50 per km)
            
            if (distance) {
                let totalFare = (distance * ratePerKm).toFixed(2); // Calculate fare and round to 2 decimal places
                document.getElementById("amount").value = totalFare;
            } else {
                document.getElementById("amount").value = "";
            }
        }
    </script>

</body>
</html>
