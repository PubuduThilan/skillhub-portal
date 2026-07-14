# SkillHub Training Portal

SkillHub Training Portal is a Java web application developed to manage training academy operations such as courses, students, trainers, enrollments, and attendance. The system demonstrates core Jakarta Servlet and JSP concepts using session-based authentication, role-based authorization, filters, listeners, `ServletContext`, `RequestDispatcher`, and in-memory data structures.

## Features

- Admin and student login
- Session-based authentication
- Role-based authorization
- Admin dashboard with system statistics
- Course management
- Student management
- Trainer management
- Student course enrollments
- Attendance recording
- Duplicate data validation
- Access-denied handling
- Logout and session invalidation
- Responsive Bootstrap user interface
- Embedded Apache Tomcat server
- WAR packaging with Maven

## User Roles

### Administrator

Administrators can:

- View the administration dashboard
- Add and view courses
- Add and view students
- Add and view trainers
- Create student enrollments
- Record attendance
- View system totals

### Student

Students can:

- Log in securely
- View the student dashboard
- Access permitted student information
- Receive an access-denied response when attempting to open administrator-only pages

## Demo Accounts

### Administrator

```text
Email: admin@skillhub.com
Password: admin
```

### Student

```text
Email: student@skillhub.com
Password: student
```

> These credentials are demonstration accounts stored in memory and should not be used in a production system.

## Technologies

- Java 17
- Jakarta Servlet API
- JSP
- Apache Tomcat 10.1
- Maven
- Bootstrap
- HTML and CSS
- Java Collections Framework

## Application Architecture

The project follows a simple MVC-style structure:

- **Model classes** represent users, courses, students, trainers, enrollments, and attendance records.
- **Servlets** process requests and contain application logic.
- **JSP pages** display the user interface.
- **Filters** provide authentication and authorization.
- **ServletContextListener** initializes shared in-memory application data.
- **ServletContext** stores application-wide lists.
- **HttpSession** stores authenticated user information.

## Project Structure

```text
SkillHubPortal/
├── src/
│   └── main/
│       ├── java/
│       │   ├── Main.java
│       │   └── com/duskdev/skillhub/
│       │       ├── filter/
│       │       ├── listener/
│       │       ├── model/
│       │       └── servlet/
│       └── webapp/
│           ├── assets/
│           ├── WEB-INF/
│           │   └── web.xml
│           └── *.jsp
├── pom.xml
└── README.md
```

## Running the Project

### Requirements

Install the following:

- JDK 17 or later
- Maven
- IntelliJ IDEA, Eclipse, NetBeans, or another Java IDE

### Run with Embedded Tomcat

1. Clone the repository.

```bash
git clone https://github.com/your-username/SkillHubPortal.git
```

2. Open the project folder.

```bash
cd SkillHubPortal
```

3. Download Maven dependencies and build the project.

```bash
mvn clean package
```

4. Run the `Main.java` class from the IDE.

5. Open the application in a browser.

```text
http://localhost:8080/SkillHub/login
```

## Build the WAR File

Run:

```bash
mvn clean package
```

The generated WAR file will be available inside the `target` directory.

```text
target/SkillHub.war
```

The WAR file can be deployed to a compatible Apache Tomcat server.

## Main Routes

```text
/SkillHub/login
/SkillHub/logout
/SkillHub/portal/dashboard
/SkillHub/portal/courses
/SkillHub/portal/students
/SkillHub/portal/trainers
/SkillHub/portal/enrollments
/SkillHub/portal/attendance
```

## Data Storage

This project does not use a database. Data is stored in synchronized in-memory Java lists using `ServletContext`.

Because the data is stored in memory:

- Data is reset when the server restarts.
- The system is intended for learning and demonstration purposes.
- A production version should use a persistent database such as MySQL or PostgreSQL.

## Security Implementation

The application includes:

- Session-based login
- Authentication filter for protected routes
- Authorization filter for administrator-only routes
- HTTP-only session cookies
- Session timeout
- Logout with session invalidation
- Server-side input validation

For production use, passwords should be hashed and stored in a secure database.

## Future Improvements

- MySQL or PostgreSQL database integration
- Password hashing
- Course editing and deletion
- Student profile pages
- Attendance reports
- Search and pagination
- Email notifications
- REST API support
- Automated tests
- Cloud deployment

## Academic Purpose

This project was developed as part of a Web Component Development assessment to demonstrate practical knowledge of Java web technologies, including Servlets, JSP, sessions, filters, listeners, deployment descriptors, and WAR deployment.

## Author

**Pubudu Thilan**

GitHub: [@PubuduThilan](https://github.com/pubuduthilan)
