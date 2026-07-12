<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.duskdev.skillhub.model.Student" %>
<%@ page import="com.duskdev.skillhub.model.Course" %>
<%@ page import="com.duskdev.skillhub.model.Enrollment" %>

<%
    List<com.duskdev.skillhub.model.Student> students =
            (List<Student>) request.getAttribute("students");

    List<Course> courses =
            (List<Course>) request.getAttribute("courses");

    List<Enrollment> enrollments =
            (List<Enrollment>) request.getAttribute("enrollments");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Enrollment Management</title>

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            background: #f8fafc;
            color: #0f172a;
        }

        .navbar {
            padding: 18px 30px;
            background: #0f172a;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 18px;
        }

        .container {
            max-width: 1200px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: 360px 1fr;
            gap: 25px;
        }

        .panel {
            background: white;
            padding: 24px;
            border-radius: 14px;
            box-shadow: 0 8px 24px rgba(0, 0, 0, 0.06);
        }

        .form-group {
            margin-bottom: 16px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            font-weight: bold;
        }

        select {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            background: white;
        }

        button {
            width: 100%;
            padding: 12px;
            background: #2563eb;
            color: white;
            border: none;
            border-radius: 8px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            text-align: left;
            padding: 13px;
            border-bottom: 1px solid #e2e8f0;
        }

        th {
            background: #eff6ff;
        }

        .status {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 20px;
            background: #dcfce7;
            color: #166534;
            font-size: 12px;
            font-weight: bold;
        }

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 11px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        .notice {
            background: #fef3c7;
            color: #92400e;
            padding: 11px;
            border-radius: 8px;
            margin-bottom: 15px;
        }

        @media (max-width: 850px) {
            .grid {
                grid-template-columns: 1fr;
            }
        }
    </style>
</head>

<body>

<nav class="navbar">

    <div>
        <strong>SkillHub</strong>
    </div>

    <div>
        <a href="<%= request.getContextPath() %>/portal/dashboard">
            Dashboard
        </a>

        <a href="<%= request.getContextPath() %>/portal/courses">
            Courses
        </a>

        <a href="<%= request.getContextPath() %>/portal/students">
            Students
        </a>

        <a href="<%= request.getContextPath() %>/portal/trainers">
            Trainers
        </a>

        <a href="<%= request.getContextPath() %>/portal/enrollments">
            Enrollments
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>
    </div>

</nav>

<main class="container">

    <h1>Enrollment Management</h1>

    <div class="grid">

        <section class="panel">

            <h2>Enroll Student</h2>

            <% if (error != null) { %>

            <div class="error">
                <%= error %>
            </div>

            <% } %>

            <% if (students == null || students.isEmpty()
                    || courses == null || courses.isEmpty()) { %>

            <div class="notice">
                At least one student and one course are required
                before creating an enrollment.
            </div>

            <% } %>

            <form method="post"
                  action="<%= request.getContextPath() %>/portal/enrollments">

                <div class="form-group">

                    <label for="studentId">
                        Select Student
                    </label>

                    <select id="studentId"
                            name="studentId"
                            required>

                        <option value="">
                            Select Student
                        </option>

                        <% if (students != null) { %>

                        <% for (Student student : students) { %>

                        <option value="<%= student.getId() %>">
                            <%= student.getFullName() %>
                            -
                            <%= student.getEmail() %>
                        </option>

                        <% } %>

                        <% } %>

                    </select>

                </div>

                <div class="form-group">

                    <label for="courseId">
                        Select Course
                    </label>

                    <select id="courseId"
                            name="courseId"
                            required>

                        <option value="">
                            Select Course
                        </option>

                        <% if (courses != null) { %>

                        <% for (Course course : courses) { %>

                        <option value="<%= course.getId() %>">
                            <%= course.getName() %>
                            -
                            <%= course.getDuration() %>
                        </option>

                        <% } %>

                        <% } %>

                    </select>

                </div>

                <button type="submit"
                        <%= students == null || students.isEmpty()
                                || courses == null || courses.isEmpty()
                                ? "disabled" : "" %>>

                    Create Enrollment

                </button>

            </form>

        </section>

        <section class="panel">

            <h2>Student Enrollments</h2>

            <table>

                <thead>
                <tr>
                    <th>ID</th>
                    <th>Student</th>
                    <th>Course</th>
                    <th>Date</th>
                    <th>Status</th>
                </tr>
                </thead>

                <tbody>

                <% if (enrollments != null
                        && !enrollments.isEmpty()) { %>

                <% for (Enrollment enrollment : enrollments) { %>

                <tr>
                    <td>
                        <%= enrollment.getId() %>
                    </td>

                    <td>
                        <%= enrollment.getStudentName() %>
                    </td>

                    <td>
                        <%= enrollment.getCourseName() %>
                    </td>

                    <td>
                        <%= enrollment.getEnrollmentDate() %>
                    </td>

                    <td>
                                <span class="status">
                                    <%= enrollment.getStatus() %>
                                </span>
                    </td>
                </tr>

                <% } %>

                <% } else { %>

                <tr>
                    <td colspan="5">
                        No enrollments are available.
                    </td>
                </tr>

                <% } %>

                </tbody>

            </table>

        </section>

    </div>

</main>

</body>
</html>