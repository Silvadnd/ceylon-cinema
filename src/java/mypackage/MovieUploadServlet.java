import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/upload-movie")
@MultipartConfig(
    fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
    maxFileSize = 1024 * 1024 * 10,        // 10MB
    maxRequestSize = 1024 * 1024 * 50      // 50MB
)
public class MovieUploadServlet extends HttpServlet {
    private static final String UPLOAD_DIRECTORY = "movie-images";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        // Create session to manage status messages
        HttpSession session = request.getSession();
        
        try {
            // Collect form data
            String movieName = request.getParameter("movie_name");
            String movieDuration = request.getParameter("movie_duration");
            String movieDescription = request.getParameter("movie_description");
            String movieCategory = request.getParameter("movie_category");
            
            // Handle file upload
            Part filePart = request.getPart("movie_image");
            String fileName = extractFileName(filePart);
            
            // Get the real path to the web application
            String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;
            
            // Create directory if it doesn't exist
            File uploadDir = new File(uploadPath);
            if (!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            
            // Generate unique filename
            String uniqueFileName = System.currentTimeMillis() + "_" + fileName;
            String filePath = uploadPath + File.separator + uniqueFileName;
            
            // Copy uploaded file
            Files.copy(
                filePart.getInputStream(), 
                Paths.get(filePath), 
                StandardCopyOption.REPLACE_EXISTING
            );
            
            // Database connection and insertion
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/moviesitedb", "root", ""
            );
            
            String sql = "INSERT INTO movies (name, duration, description, image_path, category) " +
                         "VALUES (?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, movieName);
            pstmt.setString(2, movieDuration);
            pstmt.setString(3, movieDescription);
            pstmt.setString(4, UPLOAD_DIRECTORY + "/" + uniqueFileName);
            pstmt.setString(5, movieCategory);
            
            // Execute insert
            pstmt.executeUpdate();
            
            // Close database resources
            pstmt.close();
            conn.close();
            
            // Set success status
            session.setAttribute("upload_status", "success");
            
        } catch (Exception e) {
            // Log the full error
            e.printStackTrace();
            
            // Set error status
            session.setAttribute("upload_status", "error");
            
        } finally {
            // Always redirect to admin page
            response.sendRedirect("admin.jsp");
        }
    }
    
    private String extractFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }
}