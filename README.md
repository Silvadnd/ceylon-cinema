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
![About](https://github.com/user-attachments/assets/d4571b64-27cc-4685-b4bc-5b4af91fbdeb)

![Admin Dashboard](https://github.com/user-attachments/assets/06b8abc4-2d9c-49b5-b1a4-07fedc55ef01)

![Movies](https://github.com/user-attachments/assets/bfe74e49-b2eb-4b7d-b93f-c3790dcfb7bc)

![Contact Us page](https://github.com/user-attachments/assets/88619cf7-295e-4a98-9bf0-6394379f432e)

![e-ticket](https://github.com/user-attachments/assets/9cad1cf2-d656-4445-bb4b-f587b645bcfd)

![Movies](https://github.com/user-attachments/assets/68a66fb9-330f-4e82-8cfc-85e8bdc375bc)


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
