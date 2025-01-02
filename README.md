# 🎥 Movie Website 🌐

## 📌 Project Description

This project is a **dynamic Movie Website** built using **JSP**, **Servlets**, and **MySQL**. It allows users to browse, search, and view details of movies, while administrators can manage the database of movies seamlessly. This web application demonstrates a clean MVC architecture and a robust back-end system.

## 🛠️ Features

### User Features
- 🎬 Browse a list of movies
- 🔍 Search for movies by title or genre
- 📑 View detailed information about each movie (e.g., synopsis, release date, genre, etc.)

### Admin Features
- ➕ Add new movies to the database
- ✏️ Update movie details
- ❌ Delete movies from the database

## 📂 Folder Structure

```
MovieWebsite/
├── src/
│   ├── com.project.controllers/      # Servlet controllers
│   ├── com.project.models/           # DAO and business logic classes
│   └── com.project.utils/            # Utility classes (e.g., database connection)
├── web/
│   ├── WEB-INF/
│   │   ├── web.xml                   # Deployment descriptor
│   │   └── views/                    # JSP files for user interface
│   └── assets/                       # Static files (CSS, JS, images)
├── sql/
│   └── movie_database.sql            # SQL script to initialize the database
└── README.md
```

## 🛑 Prerequisites

Before you begin, ensure you have the following installed:

- **Java Development Kit (JDK)**
- **Apache Tomcat** (or any other Java EE-compliant server)
- **MySQL Server**
- **Maven** (optional, for dependency management)

## 🚀 Installation and Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/yourusername/movie-website.git
   cd movie-website
   ```

2. **Set up the database:**
   - Import the `sql/movie_database.sql` file into your MySQL server.
   - Update the database configuration in `com.project.utils.DBConnection.java`:
     ```java
     private static final String URL = "jdbc:mysql://localhost:3306/movie_database";
     private static final String USER = "your_username";
     private static final String PASSWORD = "your_password";
     ```

3. **Deploy the application:**
   - Copy the project WAR file to your server's `webapps` directory.
   - Start the Apache Tomcat server.

4. **Access the application:**
   Open your browser and navigate to `http://localhost:8080/movie-website`.

## ⚙️ Technologies Used

- **Frontend:** JSP, HTML, CSS, JavaScript
- **Backend:** Java Servlets, JSP
- **Database:** MySQL
- **Server:** Apache Tomcat

## 📷 Screenshots

### 🎭 Movie List Page

![Signin](https://github.com/user-attachments/assets/502dc212-99de-4559-b1f8-fc63bdf3b49d)
![About](https://github.com/user-attachments/assets/cb36c1e5-dcd9-4830-b6fa-eef772a2241f)
![WhatsApp Image 2025-01-02 at 12 52 49_daf94b75](https://github.com/user-attachments/assets/afb56e16-a826-4f5a-8187-ec863808fc0f)
![payment](https://github.com/user-attachments/assets/0f5effa0-5db2-488c-aead-d780ef565fd1)
![show-time-selection](https://github.com/user-attachments/assets/d423d3f3-39a6-4e2d-b8c2-ca84909c4dfb)
![seat-booking](https://github.com/user-attachments/assets/59422f2c-5f20-4878-83ff-c7d0111d3155)
![Home-Light-Mode](https://github.com/user-attachments/assets/d5929568-745a-4656-b38e-a47ba2e98503)
![Movies](https://github.com/user-attachments/assets/e597dc0e-396b-46ea-bd51-9e2982a51bfe)

## 💡 Future Enhancements

- 🌟 Add user authentication for personalized experiences
- 🎞️ Enable movie trailer previews
- 📈 Add analytics for admin users to track popular movies

## 🤝 Contributing

Contributions are welcome! Feel free to open issues or submit pull requests to improve the project.

## 📜 License

This project is licensed under the MIT License. See the [LICENSE](https://codeshow-lapz.web.app) file for details.

---

### 📬 Contact

If you have any questions or suggestions, feel free to reach out:

- **Web:** www.cyloncinema.com

Enjoy building your Movie Website! 🍿
