<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="assets/css/confirmation.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .confirmation-container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            padding: 30px;
            max-width: 600px;
            width: 100%;
        }

        .confirmation-header {
            text-align: center;
            margin-bottom: 20px;
        }

        .confirmation-header h1 {
            color: #4CAF50;
            margin-bottom: 10px;
        }

        .ticket-details {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }

        .ticket-section, .payment-section {
            width: 48%;
        }

        .detail-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .detail-label {
            color: #666;
            font-weight: bold;
        }

        .detail-value {
            color: #333;
        }

        .detail-row.total {
            font-size: 1.1em;
            border-top: 2px solid #4CAF50;
            margin-top: 10px;
        }

        .confirmation-actions {
            text-align: center;
            margin-top: 20px;
        }

        .buttons {
            display: flex;
            justify-content: center;
            gap: 15px;
        }

        .btn {
            display: inline-block;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn-primary {
            background-color: #4CAF50;
            color: white;
        }

        .btn-secondary {
            background-color: #2196F3;
            color: white;
        }

        .ticket-footer {
            text-align: center;
            margin-top: 20px;
            font-size: 0.9em;
            color: #666;
        }

        /* Print-specific styles */
        @media print {
            body {
                background-color: white;
            }

            .confirmation-container {
                box-shadow: none;
                padding: 0;
            }

            
            .buttons {
                display: none !important;
            }

            .confirmation-actions p {
                margin-bottom: 20px;
            }
        }
    </style>
</head>

<body>
    <%
        // Retrieve booking details from session
        String date = (String) session.getAttribute("bookingDate");
        String time = (String) session.getAttribute("bookingTime");
        String screen = (String) session.getAttribute("bookingScreen");
        String seats = (String) session.getAttribute("bookingSeats");
        Double totalPrice = (Double) session.getAttribute("bookingTotalPrice");
        String paymentId = (String) session.getAttribute("bookingPaymentId");
        String bookingReference = (String) session.getAttribute("bookingReference");

        // If no session attributes, redirect to home page
        if (date == null || time == null) {
            response.sendRedirect("index.jsp");
            return;
        }

        // Clear session attributes after retrieval
        session.removeAttribute("bookingDate");
        session.removeAttribute("bookingTime");
        session.removeAttribute("bookingScreen");
        session.removeAttribute("bookingSeats");
        session.removeAttribute("bookingTotalPrice");
        session.removeAttribute("bookingPaymentId");
        session.removeAttribute("bookingReference");
    %>

    <div class="confirmation-container">
        <div class="confirmation-header">
            <h1>Booking Confirmed!</h1>
            <p>Thank You for Your Purchase</p>
        </div>
        <br><br>

        <div class="ticket-details">
            <div class="ticket-section">
                <h2>Booking Details</h2>
                <div class="detail-row">
                    <span class="detail-label">Booking Reference:</span>
                    <span class="detail-value"><%= bookingReference %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Date:</span>
                    <span class="detail-value"><%= date %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Time:</span>
                    <span class="detail-value"><%= time %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Screen:</span>
                    <span class="detail-value"><%= screen %></span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Seats:</span>
                    <span class="detail-value"><%= seats %></span>
                </div>
            </div>

            <div class="payment-section">
                <h2>Payment Information</h2>
                <div class="detail-row">
                    <span class="detail-label">Payment Method:</span>
                    <span class="detail-value">PayPal</span>
                </div>
                <div class="detail-row">
                    <span class="detail-label">Payment ID:</span>
                    <span class="detail-value"><%= paymentId %></span>
                </div>
                <div class="detail-row total">
                    <span class="detail-label">Total Amount:</span>
                    <span class="detail-value">$<%= String.format("%.2f", totalPrice) %></span>
                </div>
            </div>
        </div>
                
        <br><br>
        <div class="confirmation-actions">
            <p>A confirmation E-mail has been Sent to Your Registered E-mail Address.</p>
            
        <br>
        <div class="ticket-footer">
            <p>Terms & Conditions apply. No refunds or exchanges.</p>
            <p>Enjoy Your movie!</p>
            <a class="navbar-brand" href="#index.jsp">
                <img src="assets/images/logo.png" alt="Your logo" title="Your logo" style="height:80px;" />
            </a>
        </div>
        
        <div class="buttons">
                <!-- <a href="http://localhost:8080/Movie_Site/index.jsp" class="btn btn-primary">Back to Home</a> -->
                <a href="#" onclick="window.print();" class="btn btn-secondary">Print Ticket</a>
            </div>
        </div>
    </div>
</body>
</html>