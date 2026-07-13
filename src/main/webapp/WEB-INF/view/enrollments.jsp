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
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/students">Students</a>
                <a class="btn btn-outline-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/trainers">Trainers</a>
                <a class="btn btn-light btn-sm ms-2 my-1" href="<%= request.getContextPath() %>/portal/enrollments">Enrollments</a>
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
                    <h5 class="mb-0">Enroll Student</h5>
                </div>
                <div class="card-body">

                    <% if (error != null) { %>
                    <div class="alert alert-danger">
                        <%= error %>
                    </div>
                    <% } %>

                    <% if (students == null || students.isEmpty() || courses == null || courses.isEmpty()) { %>
                    <div class="alert alert-warning">
                        At least one student and one course are required before creating an enrollment.
                    </div>
                    <% } %>

                    <form method="post" action="<%= request.getContextPath() %>/portal/enrollments">

                        <div class="mb-3">
                            <label for="studentId" class="form-label fw-semibold">Select Student</label>
                            <select id="studentId" name="studentId" class="form-select" required>
                                <option value="">Select Student</option>
                                <% if (students != null) { %>
                                <% for (Student student : students) { %>
                                <option value="<%= student.getId() %>"><%= student.getFullName() %>
                                    - <%= student.getEmail() %>
                                </option>
                                <% } %>
                                <% } %>
                            </select>
                        </div>

                        <div class="mb-3">
                            <label for="courseId" class="form-label fw-semibold">Select Course</label>
                            <select id="courseId" name="courseId" class="form-select" required>
                                <option value="">Select Course</option>
                                <% if (courses != null) { %>
                                <% for (Course course : courses) { %>
                                <option value="<%= course.getId() %>"><%= course.getName() %>
                                    - <%= course.getDuration() %>
                                </option>
                                <% } %>
                                <% } %>
                            </select>
                        </div>

                        <button type="submit"
                                class="btn btn-primary w-100" <%= students == null || students.isEmpty() || courses == null || courses.isEmpty() ? "disabled" : "" %>>
                            Create Enrollment
                        </button>

                    </form>

                </div>
            </div>
        </div>

        <div class="col-12 col-lg-8">
            <div class="card panel shadow-sm border-0">
                <div class="card-header bg-light">
                    <h5 class="mb-0">Student Enrollments</h5>
                </div>
                <div class="card-body p-0">
                    <div class="table-responsive">
                        <table class="table table-striped table-hover align-middle mb-0">
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
                            <% if (enrollments != null && !enrollments.isEmpty()) { %>
                            <% for (Enrollment enrollment : enrollments) { %>
                            <tr>
                                <td><%= enrollment.getId() %>
                                </td>
                                <td><%= enrollment.getStudentName() %>
                                </td>
                                <td><%= enrollment.getCourseName() %>
                                </td>
                                <td><%= enrollment.getEnrollmentDate() %>
                                </td>
                                <td><span class="status badge bg-light text-dark"><%= enrollment.getStatus() %></span>
                                </td>
                            </tr>
                            <% } %>
                            <% } else { %>
                            <tr>
                                <td colspan="5" class="text-center py-3">No enrollments are available.</td>
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