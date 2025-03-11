package controller;

import java.io.IOException;
import java.sql.Connection;

import dao.DatabaseConnection;
import dao.PaymentDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet(urlPatterns = { "/PaymentServlet" })
public class PaymentServlet extends HttpServlet {
    // The rest of your servlet code...



    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	// Process the POST request for payment
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get payment details from the form
        String cardholderName = request.getParameter("cardholderName");
        String paymentAmount = request.getParameter("amount");
        String paymentMethod = request.getParameter("paymentMethod");
        String cardNumber = request.getParameter("cardNumber");
        String expiryDate = request.getParameter("expiryDate");
        String cvv = request.getParameter("cvv");
        String bookingIdStr = request.getParameter("bookingId");

        // Validate bookingId
        if (bookingIdStr == null || bookingIdStr.isEmpty()) {
            response.getWriter().write("Booking ID is missing. Payment failed.");
            return; // Return early if bookingId is invalid
        }

        int bookingId = Integer.parseInt(bookingIdStr); // Parse bookingId safely

        // Log payment details
        System.out.println("Cardholder Name: " + cardholderName);
        System.out.println("Payment Amount: " + paymentAmount);
        System.out.println("Payment Method: " + paymentMethod);
        System.out.println("Card Number: " + cardNumber);
        System.out.println("Expiry Date: " + expiryDate);
        System.out.println("CVV: " + cvv);

        // Step 1: Process the payment (mocked here for simplicity)
        boolean paymentSuccess = processPayment(paymentAmount, paymentMethod, cardNumber, expiryDate, cvv);

        if (paymentSuccess) {
            // Step 2: Insert the payment data into the database
            try (Connection conn = DatabaseConnection.getConnection()) {
                PaymentDAO paymentDAO = new PaymentDAO(conn);
                boolean paymentSaved = paymentDAO.savePayment(bookingId, cardholderName, paymentMethod, cardNumber, expiryDate, cvv, Double.parseDouble(paymentAmount));

                if (paymentSaved) {
                    // Step 3: Update booking status to 'Paid' in the database (you can implement this in the DAO)
                    response.getWriter().write("Payment Successful. Thank you for your payment!");
                } else {
                    response.getWriter().write("Failed to save payment. Please try again.");
                }
            } catch (Exception e) {
                e.printStackTrace();
                response.getWriter().write("Database error. Payment failed.");
            }
        } else {
            // Handle payment failure
            response.getWriter().write("Payment failed. Please try again.");
        }
    }

    // Mock payment processing logic (You can integrate this with a real payment gateway later)
    private boolean processPayment(String amount, String method, String cardNumber, String expiryDate, String cvv) {
        // For now, we'll assume the payment is always successful
        return true;
    }
}
