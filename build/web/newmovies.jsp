<%-- 
    Document   : newmovies
    Created on : Jan 2, 2025, 10:44:01 AM
    Author     : User
--%>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>New Movies</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #121212;
            color: white;
            margin: 0;
            padding: 20px;
        }
        
        h1 {
            text-align: center;
            color: #f0c040;
        }
        
        .movie-category {
            margin-bottom: 30px;
        }
        
        .movie-category h2 {
            color: #f0c040;
            border-bottom: 2px solid #f0c040;
            padding-bottom: 10px;
        }
        
        .movies-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
        }
        
        .movie-card {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s;
        }
        
        .movie-card:hover {
            transform: scale(1.05);
        }
        
        .movie-card img {
            width: 100%;
            height: 300px;
            object-fit: cover;
        }
        
        .movie-details {
            padding: 15px;
        }
        
        .movie-details h3 {
            margin: 0 0 10px 0;
            color: #f0c040;
        }
        
        .movie-details p {
            margin: 5px 0;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <h1>New Movies</h1>
    
    <%
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;
        
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesitedb", "root", "");
            
            // Categories
            String[] categories = {"Latest", "Adults", "Kids"};
            
            for (String category : categories) {
                stmt = conn.createStatement();
                rs = stmt.executeQuery("SELECT * FROM movies WHERE category = '" + category + "' ORDER BY upload_date DESC");
    %>
        <div class="movie-category">
            <h2><%= category %> Movies</h2>
            <div class="movies-grid">
                <% 
                    while (rs.next()) { 
                %>
                    <div class="movie-card">
                        <img src="<%= rs.getString("image_path") %>" alt="<%= rs.getString("name") %>">
                        <div class="movie-details">
                            <h3><%= rs.getString("name") %></h3>
                            <p>Duration: <%= rs.getString("duration") %></p>
                            <p><%= rs.getString("description") %></p>
                        </div>
                    </div>
                <% 
                    } 
                %>
            </div>
        </div>
    <% 
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
</body>
</html>
