import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class SignInServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String email = request.getParameter("sign-in-email");
        String password = request.getParameter("sign-in-passwd");

        try {
            // Connect to the MySQL database
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesitedb", "root", "");

            // Check if the user is an admin
            PreparedStatement stmt = con.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
            stmt.setString(1, email);
            stmt.setString(2, password);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                if (email.equals("admin@gmail.com") && password.equals("12345")) {
                    // Admin login, redirect to admin.jsp
                    response.sendRedirect("admin.jsp");
                } else {
                    // Normal user login, redirect to index.jsp
                    HttpSession session = request.getSession();
                    session.setAttribute("user", rs.getString("name"));
                    response.sendRedirect("index.jsp");
                }
            } else {
                // Invalid credentials, show an error message
                response.sendRedirect("sign_in.jsp?error=true");
            }

            con.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}