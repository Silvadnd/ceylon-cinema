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

![Home-Night-Mode](https://github.com/user-attachments/assets/0199d369-26ea-46b8-b65d-1aa43570875b)

![About](https://github.com/user-attachments/assets/bcabb848-f639-407a-905b-99d9ad44d743)

![Contact Us page](https://github.com/user-attachments/assets/38809289-b450-4507-aa00-9d72408cb111)

![Movies](https://github.com/user-attachments/assets/86f22f01-000a-4960-b13c-a537abd78f09)

![seat-booking](https://github.com/user-attachments/assets/5c4a50c1-3f8c-4684-a78c-c006079f78ba)

![payment](https://github.com/user-attachments/assets/2c0b5fce-aa95-45d5-be46-753132676764)

![Signin](https://github.com/user-attachments/assets/1ec6e267-7c9b-4786-a265-38d067869560)

![Admin Dashboard](https://github.com/user-attachments/assets/2a61018f-f051-4f18-90b8-35833b697b77)

![show-time-selection](https://github.com/user-attachments/assets/63c5d567-adb1-4f0f-9da8-1f2e0abb6db7)


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
