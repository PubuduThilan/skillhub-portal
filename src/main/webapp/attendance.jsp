<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="java.time.LocalDate" %>
<%@ page import="com.duskdev.skillhub.model.Enrollment" %>
<%@ page import="com.duskdev.skillhub.model.Attendance" %>

<%
    List<Enrollment> enrollments =
            (List<Enrollment>) request.getAttribute("enrollments");

    List<Attendance> attendances =
            (List<Attendance>) request.getAttribute(
                    "attendances"
            );

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Attendance Management</title>

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
            max-width: 1250px;
            margin: 30px auto;
            padding: 0 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: 380px 1fr;
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

        select,
        input {
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

        button:disabled {
            background: #94a3b8;
            cursor: not-allowed;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th,
        td {
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

        .status {
            display: inline-block;
            padding: 5px 9px;
            border-radius: 20px;
            font-size: 12px;
            font-weight: bold;
        }

        .present {
            background: #dcfce7;
            color: #166534;
        }

        .absent {
            background: #fee2e2;
            color: #991b1b;
        }

        .late {
            background: #fef3c7;
            color: #92400e;
        }

        @media (max-width: 900px) {
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

        <a href="<%= request.getContextPath() %>/portal/attendance">
            Attendance
        </a>

        <a href="<%= request.getContextPath() %>/logout">
            Logout
        </a>
    </div>

</nav>

<main class="container">

    <h1>Attendance Management</h1>

    <div class="grid">

        <section class="panel">

            <h2>Mark Attendance</h2>

            <% if (error != null) { %>

            <div class="error">
                <%= error %>
            </div>

            <% } %>

            <% if (enrollments == null
                    || enrollments.isEmpty()) { %>

            <div class="notice">
                Create at least one student enrollment
                before marking attendance.
            </div>

            <% } %>

            <form method="post"
                  action="<%= request.getContextPath() %>/portal/attendance">

                <div class="form-group">

                    <label for="enrollmentId">
                        Select Enrollment
                    </label>

                    <select id="enrollmentId"
                            name="enrollmentId"
                            required>

                        <option value="">
                            Select Student and Course
                        </option>

                        <% if (enrollments != null) { %>

                        <% for (Enrollment enrollment
                                : enrollments) { %>

                        <option value="<%= enrollment.getId() %>">

                            <%= enrollment.getStudentName() %>
                            -
                            <%= enrollment.getCourseName() %>

                        </option>

                        <% } %>

                        <% } %>

                    </select>

                </div>

                <div class="form-group">

                    <label for="attendanceDate">
                        Attendance Date
                    </label>

                    <input type="date"
                           id="attendanceDate"
                           name="attendanceDate"
                           value="<%= LocalDate.now() %>"
                           required>

                </div>

                <div class="form-group">

                    <label for="status">
                        Attendance Status
                    </label>

                    <select id="status"
                            name="status"
                            required>

                        <option value="">
                            Select Status
                        </option>

                        <option value="PRESENT">
                            Present
                        </option>

                        <option value="ABSENT">
                            Absent
                        </option>

                        <option value="LATE">
                            Late
                        </option>

                    </select>

                </div>

                <button type="submit"
                        <%= enrollments == null
                                || enrollments.isEmpty()
                                ? "disabled" : "" %>>

                    Save Attendance

                </button>

            </form>

        </section>

        <section class="panel">

            <h2>Attendance Records</h2>

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

                <% if (attendances != null
                        && !attendances.isEmpty()) { %>

                <% for (Attendance attendance
                        : attendances) { %>

                <tr>

                    <td>
                        <%= attendance.getId() %>
                    </td>

                    <td>
                        <%= attendance.getStudentName() %>
                    </td>

                    <td>
                        <%= attendance.getCourseName() %>
                    </td>

                    <td>
                        <%= attendance.getAttendanceDate() %>
                    </td>

                    <td>

                        <%
                            String statusClass;

                            if ("PRESENT".equals(
                                    attendance.getStatus())) {

                                statusClass = "present";

                            } else if ("ABSENT".equals(
                                    attendance.getStatus())) {

                                statusClass = "absent";

                            } else {

                                statusClass = "late";
                            }
                        %>

                        <span class="status <%= statusClass %>">
                                    <%= attendance.getStatus() %>
                                </span>

                    </td>

                </tr>

                <% } %>

                <% } else { %>

                <tr>
                    <td colspan="5">
                        No attendance records are available.
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