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
    <link rel="icon" href="<%= request.getContextPath() %>/assets/images/icon.png"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css"/>
</head>

<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
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
                <a class="btn btn-outline-light btn-sm ms-2 my-1"
                   href="<%= request.getContextPath() %>/portal/dashboard">Dashboard</a>
                <a class="btn btn-light btn-sm ms-2 my-1"
                   href="<%= request.getContextPath() %>/portal/courses">Courses</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1"
                   href="<%= request.getContextPath() %>/portal/students">Students</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1"
                   href="<%= request.getContextPath() %>/portal/trainers">Trainers</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1"
                   href="<%= request.getContextPath() %>/portal/enrollments">Enrolments</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1 href="<%= request.getContextPath() %>
                /portal/attendance">Attendance</a>
                <a class="btn btn-danger btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/logout">Logout</a>
            </div>
        </div>
    </div>
</nav>

<main class="container my-4">

    <div class="row g-4">

        <div class="col-12 col-lg-4">
            <div class="card panel shadow-sm border-0">
                <div class="card-header bg-light">
                    <h5 class="mb-0">Add New Course</h5>
                </div>
                <div class="card-body">

                    <% if (error != null) { %>
                    <div class="alert alert-danger">
                        <%= error %>
                    </div>
                    <% } %>

                    <form method="post" action="<%= request.getContextPath() %>/portal/courses">

                        <div class="mb-3">
                            <label for="name" class="form-label fw-semibold">Course Name</label>
                            <input type="text" id="name" name="name" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="category" class="form-label fw-semibold">Category</label>
                            <select id="category" name="category" class="form-select" required>
                                <option value="">Select Category</option>
                                <option value="Technology">Technology</option>
                                <option value="Business">Business</option>
                                <option value="Professional Development">Professional Development</option>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="duration" class="form-label fw-semibold">Duration</label>
                            <input type="text" id="duration" name="duration" class="form-control"
                                   placeholder="Example: 3 Months" required>
                        </div>

                        <div class="mb-3">
                            <label for="trainerName" class="form-label fw-semibold">Trainer Name</label>
                            <input type="text" id="trainerName" name="trainerName" class="form-control" required>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Add Course</button>

                    </form>

                </div>
            </div>
        </div>

        <div class="col-12 col-lg-8">
            <div class="card panel shadow-sm border-0">
                <div class="card-header bg-light">
                    <h5 class="mb-0">Available Courses</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
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
                                <td><%= course.getId() %>
                                </td>
                                <td><%= course.getName() %>
                                </td>
                                <td><%= course.getCategory() %>
                                </td>
                                <td><%= course.getDuration() %>
                                </td>
                                <td><%= course.getTrainerName() %>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="5" class="text-center py-3">No courses are available.</td>
                            </tr>
                            <% } %>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>

    </div>

</main>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.js"></script>
</body>
</html>