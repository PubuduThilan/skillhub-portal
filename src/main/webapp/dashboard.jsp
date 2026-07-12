<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>SkillHub Dashboard</title>

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
            height: 70px;
            padding: 0 35px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            background: #0f172a;
            color: white;
        }

        .navbar h2 {
            margin: 0;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            background: #dc2626;
            padding: 10px 16px;
            border-radius: 8px;
        }

        .container {
            max-width: 1200px;
            margin: 35px auto;
            padding: 0 20px;
        }

        .welcome {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);
            margin-bottom: 30px;
        }

        .welcome h1 {
            margin-top: 0;
            color: #2563eb;
        }

        .cards {
            display: grid;
            grid-template-columns:
                repeat(auto-fit, minmax(210px, 1fr));
            gap: 20px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 15px;
            box-shadow: 0 8px 25px rgba(0, 0, 0, 0.06);
        }

        .card h3 {
            margin-top: 0;
            color: #64748b;
        }

        .card .count {
            font-size: 36px;
            font-weight: bold;
            color: #2563eb;
        }

        .info {
            margin-top: 30px;
            padding: 20px;
            background: #eff6ff;
            border-radius: 12px;
            color: #1e3a8a;
        }
    </style>
</head>

<body>

<nav class="navbar">

    <h2>SkillHub Training Portal</h2>


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
</nav>

<main class="container">

    <section class="welcome">

        <h1>
            Welcome,
            ${sessionScope.loggedUser.name}
        </h1>

        <p>
            Role:
            <strong>${sessionScope.loggedUser.role}</strong>
        </p>

        <p>
            Manage SkillHub training operations through this portal.
        </p>

    </section>

    <section class="cards">

        <div class="card">
            <h3>Total Courses</h3>
            <div class="count">${courseCount}</div>
        </div>

        <div class="card">
            <h3>Total Students</h3>
            <div class="count">${studentCount}</div>
        </div>

        <div class="card">
            <h3>Total Trainers</h3>
            <div class="count">${trainerCount}</div>
        </div>

        <div class="card">
            <h3>Total Enrolments</h3>
            <div class="count">${enrollmentCount}</div>
        </div>

        <div class="card">
            <h3>Total Attendance Records</h3>
            <div class="count">${attendanceCount}</div>
        </div>

    </section>

    <div class="info">
        Application started at:
        <strong>${applicationStartTime}</strong>
    </div>

</main>

</body>
</html>