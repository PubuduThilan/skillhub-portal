<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.duskdev.skillhub.model.Trainer" %>

<%
    List<com.duskdev.skillhub.model.Trainer> trainers =
            (List<Trainer>) request.getAttribute("trainers");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Trainer Management</title>

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

    <h1>Trainer Management</h1>

    <div class="grid">

        <section class="panel">

            <h2>Add New Trainer</h2>

            <% if (error != null) { %>

            <div class="error">
                <%= error %>
            </div>

            <% } %>

            <form method="post"
                  action="<%= request.getContextPath() %>/portal/trainers">

                <div class="form-group">

                    <label for="fullName">
                        Full Name
                    </label>

                    <input type="text"
                           id="fullName"
                           name="fullName"
                           required>

                </div>

                <div class="form-group">

                    <label for="email">
                        Email Address
                    </label>

                    <input type="email"
                           id="email"
                           name="email"
                           required>

                </div>

                <div class="form-group">

                    <label for="mobile">
                        Phone Number
                    </label>

                    <input type="text"
                           id="mobile"
                           name="mobile"
                           placeholder="Example: 0771234567"
                           required>

                </div>

                <div class="form-group">

                    <label for="specialization">
                        Specialization
                    </label>

                    <select id="specialization"
                            name="specialization"
                            required>

                        <option value="">
                            Select Specialization
                        </option>

                        <option value="Java Web Development">
                            Java Web Development
                        </option>

                        <option value="Business Communication">
                            Business Communication
                        </option>

                        <option value="Professional Development">
                            Professional Development
                        </option>

                        <option value="Project Management">
                            Project Management
                        </option>

                    </select>

                </div>

                <button type="submit">
                    Add Trainer
                </button>

            </form>

        </section>

        <section class="panel">

            <h2>Registered Trainers</h2>

            <table>

                <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Phone</th>
                    <th>Specialization</th>
                </tr>
                </thead>

                <tbody>

                <% if (trainers != null
                        && !trainers.isEmpty()) { %>

                <% for (Trainer trainer : trainers) { %>

                <tr>
                    <td><%= trainer.getId() %></td>

                    <td>
                        <%= trainer.getFullName() %>
                    </td>

                    <td>
                        <%= trainer.getEmail() %>
                    </td>

                    <td>
                        <%= trainer.getMobile() %>
                    </td>

                    <td>
                        <%= trainer.getSpecialization() %>
                    </td>
                </tr>

                <% } %>

                <% } else { %>

                <tr>
                    <td colspan="5">
                        No trainers are registered.
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