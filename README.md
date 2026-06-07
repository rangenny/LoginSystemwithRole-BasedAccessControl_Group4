# 🎵 LoginSystemwithRole-BasedAccessControl_Group4

Welcome to Group 4's Music Catalog Application! [cite_start]This project demonstrates a secure Full-Stack web application using **Angular**, **Spring Boot**, and **MySQL**, featuring complete Role-Based Access Control (RBAC).

## 🔐 Test Credentials

[cite_start]Use the following accounts to test the application's role restrictions:

| Role | Username | Password | Permissions |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin` | `admin123` | [cite_start]View, Add, and Delete Music  |
| **User** | `user` | `user123` | [cite_start]View Music Only  |

---

## 🚀 Tech Stack
* [cite_start]**Frontend:** Angular, TypeScript, HTML/CSS 
* [cite_start]**Backend:** Spring Boot, Java, Spring Security 
* [cite_start]**Database:** MySQL 

## 🛠️ How to Run the Application

### 1. Database Setup
1. Ensure your local **MySQL** server is running.
2. Import the provided SQL script to create the `music_app` database, the `music` table, and the `users` table.

### 2. Start the Backend (Spring Boot)
1. Open a terminal and navigate to the `backend` folder.
2. Run the following command to start the server:
    .\mvnw spring-boot:run

### 3. Start the Frontend (Angular)
1. Open a second terminal window and navigate to the frontend folder.
2. Install dependencies (if running for the first time):
    npm install
3. Start the Angular development server:
    ng serve

### 4. View the App 

Once both servers are running, open your web browser and navigate to:
http://localhost:4200