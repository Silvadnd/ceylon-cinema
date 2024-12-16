import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String name = request.getParameter("sign-up-name");
        String email = request.getParameter("sign-up-email");
        String password = request.getParameter("sign-up-passwd");

        try {
            // Connect to the MySQL database
            Class.forName("com.mysql.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesitedb", "root", "");

            // Insert the new user into the database
            PreparedStatement stmt = con.prepareStatement("INSERT INTO users (name, email, password) VALUES (?, ?, ?)");
            stmt.setString(1, name);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.executeUpdate();

            con.close();

            // Redirect to the sign-in page
            response.sendRedirect("sign_in.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}