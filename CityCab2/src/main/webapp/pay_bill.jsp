<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Pay the Bill - Mega City Cab</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: auto;
            overflow: hidden;
        }
        .card {
            background: white;
            padding: 20px;
            margin: 10px 0;
            border-radius: 5px;
            box-shadow: 0px 0px 10px 0px #aaa;
            text-align: center;
        }
        .card input[type="text"], .card select {
            padding: 10px;
            margin: 10px 0;
            width: 100%;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .card button {
            background: #28a745;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .card button:hover {
            background: #218838;
        }
    </style>
</head>
<body>

    <div class="container">
        <div class="card">
            <h3>Make Payment</h3>
            <form action="PaymentServlet" method="post">
                <!-- Cardholder Name -->
                <label for="cardholderName">Cardholder Name:</label>
                <input type="text" id="cardholderName" name="cardholderName" required/>

                <!-- Payment Amount -->
                <label for="amount">Amount to Pay:</label>
                <input type="text" id="amount" name="amount" value="50" />

                <!-- Payment Method -->
                <label for="paymentMethod">Payment Method:</label>
                <select id="paymentMethod" name="paymentMethod">
                    <option value="Credit Card">Credit Card</option>
                    <option value="Debit Card">Debit Card</option>
                </select>

                <!-- Card Number -->
                <label for="cardNumber">Card Number:</label>
                <input type="text" id="cardNumber" name="cardNumber" required/>

                <!-- Expiry Date -->
                <label for="expiryDate">Expiry Date:</label>
                <input type="text" id="expiryDate" name="expiryDate" placeholder="MM/YY" required/>

                <!-- CVV -->
                <label for="cvv">CVV:</label>
                <input type="text" id="cvv" name="cvv" required/>

                <!-- Hidden booking ID -->
                <input type="hidden" name="bookingId" value="123" />  <!-- You should dynamically set the bookingId here -->

                <button type="submit">Pay Now</button>
            </form>
        </div>
    </div>

</body>
</html>
