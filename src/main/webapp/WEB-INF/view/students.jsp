<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.duskdev.skillhub.model.Student" %>

<%
    List<com.duskdev.skillhub.model.Student> students =
            (List<Student>) request.getAttribute("students");

    String error =
            (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>Student Management</title>
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

        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navLinks"
                aria-controls="navLinks" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse site-links justify-content-end" id="navLinks">
            <div class="navbar-nav align-items-lg-end">
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/dashboard">Dashboard</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/courses">Courses</a>
                <a class="btn btn-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/students">Students</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/trainers">Trainers</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/enrollments">Enrollments</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/attendance">Attendance</a>
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
                    <h5 class="mb-0">Add New Student</h5>
                </div>
                <div class="card-body">

                    <% if (error != null) { %>
                    <div class="alert alert-danger">
                        <%= error %>
                    </div>
                    <% } %>

                    <form method="post" action="<%= request.getContextPath() %>/portal/students">

                        <div class="mb-3">
                            <label for="fullName" class="form-label fw-semibold">Full Name</label>
                            <input type="text" id="fullName" name="fullName" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label fw-semibold">Email Address</label>
                            <input type="email" id="email" name="email" class="form-control" required>
                        </div>

                        <div class="mb-3">
                            <label for="mobile" class="form-label fw-semibold">Mobile Number</label>
                            <input type="text" id="mobile" name="mobile" class="form-control"
                                   placeholder="Example: 0771234567" required>
                        </div>

                        <div class="mb-3">
                            <label for="course" class="form-label fw-semibold">Course</label>
                            <select id="course" name="course" class="form-select" required>
                                <option value="">Select Course</option>
                                <option value="Java Web Development">Java Web Development</option>
                                <option value="Business Communication">Business Communication</option>
                                <option value="Professional Development">Professional Development</option>
                            </select>
                        </div>

                        <button type="submit" class="btn btn-primary w-100">Add Student</button>

                    </form>

                </div>
            </div>
        </div>

        <div class="col-12 col-lg-8">
            <div class="card panel shadow-sm border-0">
                <div class="card-header bg-light">
                    <h5 class="mb-0">Registered Students</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
                            <thead>
                            <tr>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Email</th>
                                <th>Mobile</th>
                                <th>Course</th>
                            </tr>
                            </thead>
                            <tbody>
                            <% if (students != null && !students.isEmpty()) { %>
                            <% for (Student student : students) { %>
                            <tr>
                                <td><%= student.getId() %>
                                </td>
                                <td><%= student.getFullName() %>
                                </td>
                                <td><%= student.getEmail() %>
                                </td>
                                <td><%= student.getMobile() %>
                                </td>
                                <td><%= student.getCourse() %>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="5" class="text-center py-3">No students are registered.</td>
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