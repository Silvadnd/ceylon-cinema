<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>PayPal Payment</title>
    <link rel="stylesheet" href="assets/css/payment.css">
    <script src="https://www.paypal.com/sdk/js?client-id=AVbbqcPs8-TQX2gwMOdOR-yFwGFQbl5MRR5-Wfk31Nf_TMxnoFW9jfrFA2VGumF_iQTeznteEC4sPhZ1&currency=USD"></script>
</head>

<style>
    /* Reset and Base Styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f4f7;
    line-height: 1.6;
    color: #333;
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    background: linear-gradient(135deg, red 0%, black 100%);
}

/* Payment Container */
.payment-container {
    background-color: white;
    border-radius: 12px;
    box-shadow: 0 15px 35px rgba(50, 50, 93, 0.1), 0 5px 15px rgba(0, 0, 0, 0.07);
    padding: 40px;
    width: 100%;
    max-width: 500px;
    animation: fadeIn 0.5s ease-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(20px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

/* Header Styling */
.payment-container h2 {
    text-align: center;
    color: #333;
    margin-bottom: 30px;
    font-size: 24px;
    position: relative;
    padding-bottom: 10px;
}

.payment-container h2::after {
    content: '';
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 60px;
    height: 3px;
    background: linear-gradient(to right, #667eea, #764ba2);
}

/* Booking Details Section */
.booking-details {
    background-color: #f9f9ff;
    border-radius: 8px;
    padding: 20px;
    margin-bottom: 25px;
    border: 1px solid #e6e6f0;
}

.booking-details p {
    display: flex;
    justify-content: space-between;
    margin-bottom: 10px;
    font-size: 16px;
}

.booking-details p strong {
    color: #555;
    min-width: 100px;
    display: inline-block;
}

.booking-details p:last-child {
    font-weight: bold;
    color: #4a4a4a;
    border-top: 1px solid #e0e0e0;
    padding-top: 10px;
}

/* PayPal Button Container */
#paypal-button-container {
    display: flex;
    justify-content: center;
    margin-top: 20px;
}

/* Responsive Adjustments */
@media screen and (max-width: 600px) {
    .payment-container {
        margin: 20px;
        padding: 25px;
        width: calc(100% - 40px);
    }

    .booking-details p {
        flex-direction: column;
    }

    .booking-details p strong {
        margin-bottom: 5px;
    }
}

/* Subtle Hover and Focus States */
.booking-details p:hover {
    background-color: #f0f0f9;
    transition: background-color 0.3s ease;
}

/* Optional: Loading State */
.loading {
    opacity: 0.6;
    pointer-events: none;
    transition: opacity 0.3s ease;
}

/* Payment Method Icons (Optional Enhancement) */
.payment-method-icons {
    display: flex;
    justify-content: center;
    margin-top: 20px;
    gap: 15px;
}

.payment-method-icons img {
    width: 40px;
    height: 40px;
    filter: grayscale(50%);
    transition: transform 0.3s ease;
}

.payment-method-icons img:hover {
    transform: scale(1.1);
    filter: grayscale(0%);
}
</style>

<body>
    <%
        // Retrieve booking details from previous page
        String selectedDate = request.getParameter("date");
        String selectedTime = request.getParameter("time");
        String selectedScreen = request.getParameter("screen");
        String selectedSeats = request.getParameter("seats");
        
        // Validate parameters
        if (selectedDate == null || selectedTime == null || selectedScreen == null || selectedSeats == null) {
            response.sendRedirect("ticket-booking.jsp");
            return;
        }
        
        // Calculate ticket price (you might want to make this dynamic)
        double ticketPrice = 4; // Base ticket price
        int seatCount = selectedSeats.split(",").length;
        double totalPrice = ticketPrice * seatCount;
    %>
    
    <div class="payment-container">
        <h2>Complete Your Booking</h2>
        <div class="booking-details">
            <p><strong>Date:</strong> <%= selectedDate %></p>
            <p><strong>Time:</strong> <%= selectedTime %></p>
            <p><strong>Screen:</strong> <%= selectedScreen %></p>
            <p><strong>Seats:</strong> <%= selectedSeats %></p>
            <p><strong>Total Price:</strong> $<%= String.format("%.2f", totalPrice) %></p>
        </div>
        
        <div id="paypal-button-container"></div>
    </div>

    <script>
        paypal.Buttons({
            createOrder: function(data, actions) {
                return actions.order.create({
                    purchase_units: [{
                        amount: {
                            value: '<%= String.format("%.2f", totalPrice) %>'
                        }
                    }]
                });
            },
            onApprove: function(data, actions) {
    return actions.order.capture().then(function(details) {
        // Send booking details to server for processing
        fetch('ProcessBookingServlet', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: 
                'date=<%= selectedDate %>&' +
                'time=<%= selectedTime %>&' +
                'screen=<%= selectedScreen %>&' +
                'seats=<%= selectedSeats %>&' +
                'totalPrice=<%= totalPrice %>&' +
                'paymentId=' + details.id
        })
        .then(response => response.json())
        .then(result => {
            if (result.status === 'success') {
                // Redirect to the confirmation page
                window.location.href = result.redirectUrl;
            } else {
                alert('Booking failed: ' + result.message);
            }
        });
    });
}
        }).render('#paypal-button-container');
    </script>
</body>
</html>