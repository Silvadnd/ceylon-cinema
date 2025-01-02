import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ContactUsServlet")
public class ContactUsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/moviesitedb";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Retrieve form parameters
        String firstName = request.getParameter("fname");
        String lastName = request.getParameter("lname");
        String email = request.getParameter("email");
        String mobileNumber = request.getParameter("m-num");
        String message = request.getParameter("msg");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection
            conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Prepare SQL insert statement
            String sql = "INSERT INTO contact (first_name, last_name, email, mobile_number, message) VALUES (?, ?, ?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            
            // Set parameters
            pstmt.setString(1, firstName);
            pstmt.setString(2, lastName);
            pstmt.setString(3, email);
            pstmt.setString(4, mobileNumber);
            pstmt.setString(5, message);

            // Execute the insert
            int rowsAffected = pstmt.executeUpdate();

            // Redirect based on insert success
            if (rowsAffected > 0) {
                response.sendRedirect("Contact_Us.jsp?status=success");
            } else {
                response.sendRedirect("Contact_Us.jsp?status=error");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("Contact_Us.jsp?status=error");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("Contact_Us.jsp?status=error");
        } finally {
            // Close resources
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}