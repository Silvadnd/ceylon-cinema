import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/ProcessBookingServlet")
public class ProcessBookingServlet extends HttpServlet {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/moviesitedb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        response.setContentType("application/json");
        
        // Retrieve booking parameters
        String date = request.getParameter("date");
        String time = request.getParameter("time");
        String screen = request.getParameter("screen");
        String seats = request.getParameter("seats");
        double totalPrice = Double.parseDouble(request.getParameter("totalPrice"));
        String paymentId = request.getParameter("paymentId");
        
        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish database connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                // Prepare SQL statement
                String sql = "INSERT INTO bookings " +
                    "(booking_date, booking_time, screen, seats, total_price, payment_id) " +
                    "VALUES (?, ?, ?, ?, ?, ?)";
                
                try (PreparedStatement pstmt = conn.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
                    pstmt.setString(1, date);
                    pstmt.setString(2, time);
                    pstmt.setString(3, screen);
                    pstmt.setString(4, seats);
                    pstmt.setDouble(5, totalPrice);
                    pstmt.setString(6, paymentId);
                    
                    int affectedRows = pstmt.executeUpdate();
                    
                    if (affectedRows > 0) {
                        // Get the generated booking ID
                        ResultSet generatedKeys = pstmt.getGeneratedKeys();
                        int bookingId = -1;
                        if (generatedKeys.next()) {
                            bookingId = generatedKeys.getInt(1);
                        }

                        // Get email from PayPal transaction
                        String userEmail = extractEmailFromPayPalDetails(paymentId);

                        // Prepare booking details for email
                        String bookingReference = "MV" + bookingId;
                        String bookingDetails = String.format(
                            "Booking Reference: %s\n" +
                            "Date: %s\n" +
                            "Time: %s\n" +
                            "Screen: %s\n" +
                            "Seats: %s\n" +
                            "Total Price: $%.2f",
                            bookingReference, date, time, screen, seats, totalPrice
                        );

                        // Send confirmation email
                        EmailService.sendConfirmationEmail(userEmail, bookingDetails);

                        // Create a session to pass booking details
                        HttpSession session = request.getSession();
                        session.setAttribute("bookingDate", date);
                        session.setAttribute("bookingTime", time);
                        session.setAttribute("bookingScreen", screen);
                        session.setAttribute("bookingSeats", seats);
                        session.setAttribute("bookingTotalPrice", totalPrice);
                        session.setAttribute("bookingPaymentId", paymentId);
                        session.setAttribute("bookingReference", bookingReference);

                        // Prepare response
                        response.getWriter().write("{\"status\": \"success\", \"redirectUrl\": \"confirmation.jsp\"}");
                    } else {
                        // Booking failed
                        response.getWriter().write("{\"status\": \"error\", \"message\": \"Booking insertion failed\"}");
                    }
                }
            }
        } catch (Exception e) {
            // Log the error and send error response
            e.printStackTrace();
            response.getWriter().write("{\"status\": \"error\", \"message\": \"" + e.getMessage() + "\"}");
        }
    }

    // Method to extract email from PayPal transaction
    private String extractEmailFromPayPalDetails(String paymentId) {
        // IMPORTANT: This is a placeholder method
        // In a real-world scenario, you would:
        // 1. Use PayPal's API to retrieve transaction details
        // 2. Extract the email associated with the PayPal account
        // 3. Handle potential API errors and exceptions
        
        // Temporary implementation - replace with actual PayPal API call
        return "ceyloncinema24@gmail.com";
    }

    // Add a doGet method to handle direct access to the confirmation page
    protected void doGet(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Redirect to home page if accessed directly
        response.sendRedirect("index.jsp");
    }
}