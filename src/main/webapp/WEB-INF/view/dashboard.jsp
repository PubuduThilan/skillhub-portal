<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.duskdev.skillhub.model.User" %>

<%

    User user = (User) session.getAttribute("user");

    boolean isAdmin =
            user != null && "ADMIN".equalsIgnoreCase(user.getRole());
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>SkillHub Dashboard</title>

    <link rel="icon" href="<%= request.getContextPath() %>/assets/images/icon.png"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css"/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark w-100">

    <div class="container-fluid ms-lg-2 ms-3">

        <a class="navbar-brand" href="<%= request.getContextPath() %>/portal/dashboard">
            <img src="<%= request.getContextPath() %>/assets/images/logo.png" alt="SkillHub Portal" height="40"
                 class="d-inline-block align-middle"/>
        </a>

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navLinks" aria-controls="navLinks" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse site-links justify-content-end" id="navLinks">

            <div class="navbar-nav align-items-lg-end">

                <% if (isAdmin) { %>

                <a class="btn btn-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/dashboard">Dashboard</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/courses">Courses</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1"href="<%= request.getContextPath() %>/portal/students">Students</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/trainers">Trainers</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/enrollments">Enrollments</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/attendance">Attendance</a>

                <% } %>

                <a class="btn btn-danger btn-sm ms-2 my-1"
                   href="<%= request.getContextPath() %>/logout">
                    Logout
                </a>

            </div>

        </div>
    </div>
</nav>

<main class="container my-4">

    <div class="card panel shadow-sm border-0 mb-4">
        <div class="card-body">

            <h1 class="h4 mb-1">
                Welcome,
                <%= user != null ? user.getName() : "User" %>
            </h1>

            <p class="mb-1">
                Role:
                <strong>
                    <%= user != null ? user.getRole() : "Unknown" %>
                </strong>
            </p>

            <% if (isAdmin) { %>

            <p class="text-muted mb-0">
                Manage SkillHub training operations through this portal.
            </p>

            <% } else { %>

            <p class="text-muted mb-0">
                Access your SkillHub student account and training information.
            </p>

            <% } %>

        </div>
    </div>

    <% if (isAdmin) { %>

    <!-- Administrator dashboard cards -->
    <div class="row g-3">

        <div class="col-12 col-sm-6 col-lg-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">
                    <h6 class="text-muted">Total Courses</h6>
                    <div class="h3 text-primary mb-0">
                        ${courseCount}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">
                    <h6 class="text-muted">Total Students</h6>
                    <div class="h3 text-primary mb-0">
                        ${studentCount}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">
                    <h6 class="text-muted">Total Trainers</h6>
                    <div class="h3 text-primary mb-0">
                        ${trainerCount}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">
                    <h6 class="text-muted">Total Enrollments</h6>
                    <div class="h3 text-primary mb-0">
                        ${enrollmentCount}
                    </div>
                </div>
            </div>
        </div>

        <div class="col-12 col-sm-6 col-lg-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">
                    <h6 class="text-muted">
                        Total Attendance Records
                    </h6>

                    <div class="h3 text-primary mb-0">
                        ${attendanceCount}
                    </div>
                </div>
            </div>
        </div>

    </div>

    <div class="card mt-4 shadow-sm border-0">
        <div class="card-body bg-light">

            Application started at:
            <strong>${applicationStartTime}</strong>

        </div>
    </div>

    <% } else { %>

    <!-- Student dashboard cards -->
    <div class="row g-3">

        <div class="col-12 col-md-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">

                    <h6 class="text-muted">Account Name</h6>

                    <div class="h5 text-primary mb-0">
                        <%= user != null ? user.getName() : "Student" %>
                    </div>

                </div>
            </div>
        </div>

        <div class="col-12 col-md-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">

                    <h6 class="text-muted">Portal Role</h6>

                    <div class="h5 text-info mb-0">
                        Student
                    </div>

                </div>
            </div>
        </div>

        <div class="col-12 col-md-4">
            <div class="card shadow-sm border-0 h-100">
                <div class="card-body">

                    <h6 class="text-muted">Account Status</h6>

                    <div class="h5 text-success mb-0">
                        Active
                    </div>

                </div>
            </div>
        </div>

        <div class="col-12">
            <div class="alert alert-info mb-0" role="alert">
                Student accounts currently only have access to view the account name, portal role, and account status.
            </div>
        </div>

    </div>

    <% } %>

</main>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.js"></script>

</body>
</html>
