
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

![Signin](https://github.com/user-attachments/assets/f3057a9f-a58f-4a0c-9cf1-e637a3309870)
<br>
![Signup](https://github.com/user-attachments/assets/947b42ac-828c-48ee-8598-18de3309166d)
<br>
![Home-Night-Mode](https://github.com/user-attachments/assets/b95d7bd3-ca9b-43c1-92ce-03dd46f3a9a8)
<br>
![Home-Light-Mode](https://github.com/user-attachments/assets/e76451a9-6936-4cf8-8754-513cab17aea8)
<br>
![About](https://github.com/user-attachments/assets/5281f041-2ad0-43e4-9bc3-0a191a4838c5)
<br>
![Contact Us page](https://github.com/user-attachments/assets/a245103f-56c7-4ff0-8c09-cd66071e047e)
<br>
![Movies](https://github.com/user-attachments/assets/0b8f1095-2303-4de8-ba0d-4737a8120765)
<br>
![show-time-selection](https://github.com/user-attachments/assets/a6cd4473-45ea-41ed-bf7f-003592705579)
<br>
![seat-booking](https://github.com/user-attachments/assets/ed49a08e-867a-4557-89a1-1a0c7159c37e)
<br>
![payment](https://github.com/user-attachments/assets/28043abe-12c3-456c-a8f1-042f618bb0fe)
<br>
![e-ticket](https://github.com/user-attachments/assets/7fb10987-b0bd-4a07-bbc8-8901898c8176)
<br>
![Admin Dashboard](https://github.com/user-attachments/assets/e12caabc-f857-4454-bed6-47ddfafd668a)



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
