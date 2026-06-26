# 🩸 Blood Bank Management System

A web-based Blood Bank Management System developed using Java Server Pages (JSP), JDBC, MySQL, HTML, CSS, and Apache Tomcat. The application streamlines blood donor registration, user authentication, and blood donor search based on blood groups, providing a simple and efficient platform for blood donation management.

## 📌 Project Overview

The Blood Bank Management System is designed to facilitate the management of blood donor information. Users can create an account, securely log in, register as blood donors, and search for available donors by blood group. The system uses MySQL as the backend database and JDBC for database connectivity while Apache Tomcat serves as the application server.

## ✨ Features

- User Registration
- Secure User Login Authentication
- Session Management
- Blood Donor Registration
- Search Donors by Blood Group
- View Donor Information
- Logout Functionality
- Responsive User Interface
- MySQL Database Integration
- JDBC-Based Database Connectivity

## 🛠️ Technology Stack

| Technology | Purpose |
|------------|---------|
| Java | Backend Programming |
| JSP | Dynamic Web Pages |
| JDBC | Database Connectivity |
| MySQL | Database |
| HTML5 | Web Structure |
| CSS3 | Styling |
| Apache Tomcat | Web Server |
| Eclipse IDE | Development Environment |

## 📂 Project Structure

```
BloodBankManagementSystem/
│
├── src/
│   └── main/
│       └── webapp/
│           ├── META-INF/
│           ├── WEB-INF/
│           ├── login.jsp
│           ├── register.jsp
│           ├── request.jsp
│           ├── logout.jsp
│           ├── index.html
│           ├── login.html
│           ├── register.html
│           ├── bloodRequest.html
│           ├── styles.css
│           └── images
│
└── README.md
```

## ⚙️ Functional Modules

### User Authentication
- User Registration
- User Login
- Session Handling
- Logout

### Donor Management
- Register Blood Donor
- Store Donor Details
- Search Donors by Blood Group
- Display Matching Donors

## 🗄️ Database

**Database Name**

```
BloodBank
```

**Main Table**

```
register
```

The application stores:

- Name
- Username
- Password
- Gender
- Blood Group
- Address
- Phone Number

## 🚀 How to Run

### Prerequisites

- Java JDK 17 or above
- Eclipse IDE Enterprise Edition
- Apache Tomcat 11
- MySQL Server
- MySQL Connector/J

### Steps

1. Clone the repository.
2. Import the project into Eclipse.
3. Configure Apache Tomcat.
4. Create the MySQL database.
5. Execute the SQL script to create the required table.
6. Configure database credentials.
7. Start the Tomcat server.
8. Open the application in your browser.

```
http://localhost:8080/BloodBankManagementSystem
```

## 📸 Application Modules

- Home Page
- Login Page
- Registration Page
- Blood Request Page
- Donor Search Results
- Logout

## 🔒 Security

- JDBC Prepared Statements to prevent SQL Injection
- Session-based Authentication
- Server-side Database Validation

## 🎯 Future Enhancements

- Password Encryption (BCrypt)
- Admin Dashboard
- Email Notifications
- Blood Stock Management
- Hospital Management Module
- Online Blood Request Tracking
- REST API Integration
- Maven Project Structure
- Cloud Database Support
- Docker Deployment

## 👨‍💻 Author

**Koppisetti Naveen**

Computer Science Engineering Graduate (2026)

GitHub:
https://github.com/NaveenKoppisetti

---

⭐ If you found this project useful, consider giving it a star on GitHub.
