<%@ page import="java.sql.*" %>
<%@ page import="java.text.SimpleDateFormat" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: linear-gradient(to left, red, black);
            color: white;
        }
        h1{
            color: yellow;
            text-align: center;
        }
        
        h2{
            color: yellow;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        table, th, td {
            border: 1px solid white;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #333;
        }
        a.logout-btn {
            display: inline-block;
            margin-top: 10px;
            padding: 10px 20px;
            color: white;
            background-color: red;
            text-decoration: none;
            border-radius: 5px;
        }
        a.logout-btn:hover {
            background-color: darkred;
        }
        .container {
            padding: 20px;
        }
        .logout-container {
            display: flex;
            justify-content: flex-start;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome Admin!</h1>
        <br>
        
        <h2>Contact Submissions</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Mobile Number</th>
                    <th>Message</th>
                    <th>Submission Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    Connection conn = null;
                    Statement stmt = null;
                    ResultSet rs = null;

                    try {
                        Class.forName("com.mysql.jdbc.Driver");
                        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/moviesitedb", "root", "");
                        
                        stmt = conn.createStatement();
                        rs = stmt.executeQuery("SELECT * FROM contact ORDER BY id ASC");

                        while (rs.next()) {
                            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
                %>
                    <tr>
                        <td><%= rs.getInt("id") %></td>
                        <td><%= rs.getString("first_name") %></td>
                        <td><%= rs.getString("last_name") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("mobile_number") %></td>
                        <td><%= rs.getString("message") %></td>
                        <td><%= dateFormat.format(rs.getTimestamp("submission_date")) %></td>
                    </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close contact table resources
                        try {
                            if (rs != null) rs.close();
                            if (stmt != null) stmt.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>

         <br>
        <h2>Registered Users</h2>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Password</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet userRs = null;
                    Statement userStmt = null;

                    try {
                        // Reuse the existing connection
                        userStmt = conn.createStatement();
                        userRs = userStmt.executeQuery("SELECT * FROM users ORDER BY id ASC");

                        while (userRs.next()) {
                %>
                    <tr>
                        <td><%= userRs.getInt("id") %></td>
                        <td><%= userRs.getString("name") %></td>
                        <td><%= userRs.getString("email") %></td>
                        <td><%= userRs.getString("password") %></td>
                    </tr>
                <% 
                        }
                    } catch (Exception e) {
                        e.printStackTrace();
                    } finally {
                        // Close user table resources
                        try {
                            if (userRs != null) userRs.close();
                            if (userStmt != null) userStmt.close();
                            if (conn != null) conn.close();
                        } catch (SQLException e) {
                            e.printStackTrace();
                        }
                    }
                %>
            </tbody>
        </table>

        <div class="logout-container">
            <a href="sign_in.jsp" class="logout-btn">Logout</a>
        </div>
    </div>
</body>
</html>