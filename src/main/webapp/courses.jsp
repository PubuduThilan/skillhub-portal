<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.duskdev.skillhub.model.Course" %>

<%
    List<com.duskdev.skillhub.model.Course> courses =
            (List<Course>) request.getAttribute("courses");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Course Management</title>

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
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 6px;
            font-weight: bold;
        }

        input, select {
            width: 100%;
            padding: 11px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
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

        .error {
            background: #fee2e2;
            color: #991b1b;
            padding: 10px;
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

    <h1>Course Management</h1>

    <div class="grid">

        <section class="panel">

            <h2>Add New Course</h2>

            <% if (error != null) { %>
            <div class="error">
                <%= error %>
            </div>
            <% } %>

            <form method="post"
                  action="<%= request.getContextPath() %>/portal/courses">

                <div class="form-group">
                    <label for="name">Course Name</label>

                    <input type="text"
                           id="name"
                           name="name"
                           required>
                </div>

                <div class="form-group">
                    <label for="category">Category</label>

                    <select id="category"
                            name="category"
                            required>

                        <option value="">
                            Select Category
                        </option>

                        <option value="Technology">
                            Technology
                        </option>

                        <option value="Business">
                            Business
                        </option>

                        <option value="Professional Development">
                            Professional Development
                        </option>

                    </select>
                </div>

                <div class="form-group">
                    <label for="duration">Duration</label>

                    <input type="text"
                           id="duration"
                           name="duration"
                           placeholder="Example: 3 Months"
                           required>
                </div>

                <div class="form-group">
                    <label for="trainerName">Trainer Name</label>

                    <input type="text"
                           id="trainerName"
                           name="trainerName"
                           required>
                </div>

                <button type="submit">
                    Add Course
                </button>

            </form>

        </section>

        <section class="panel">

            <h2>Available Courses</h2>

            <table>

                <thead>
                <tr>
                    <th>ID</th>
                    <th>Course</th>
                    <th>Category</th>
                    <th>Duration</th>
                    <th>Trainer</th>
                </tr>
                </thead>

                <tbody>

                <% if (courses != null && !courses.isEmpty()) { %>

                <% for (Course course : courses) { %>

                <tr>
                    <td><%= course.getId() %></td>
                    <td><%= course.getName() %></td>
                    <td><%= course.getCategory() %></td>
                    <td><%= course.getDuration() %></td>
                    <td><%= course.getTrainerName() %></td>
                </tr>

                <% } %>

                <% } else { %>

                <tr>
                    <td colspan="5">
                        No courses are available.
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