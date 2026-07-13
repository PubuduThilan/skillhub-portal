<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    String error = (String) request.getAttribute("error");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>SkillHub Login</title>
    <link rel="icon" href="<%= request.getContextPath() %>/assets/images/icon.png"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css"/>
</head>

<body>

<main class="container d-flex align-items-center justify-content-center min-vh-100">

    <div class="card login-container shadow-sm border-0">
        <div class="card-body">
            <div class="text-center mb-4 p-2">
                <a class="navbar-brand" href="<%= request.getContextPath() %>/portal/dashboard">
                    <img src="<%= request.getContextPath() %>/assets/images/logo.png" alt="SkillHub Portal" height="50"
                         class="d-inline-block align-middle"/>
                </a>
                <p class="text-muted mb-0">Training Management Portal</p>
            </div>

            <% if (error != null) { %>
            <div class="alert alert-danger" role="alert">
                <%= error %>
            </div>
            <% } %>

            <form method="post" action="<%= request.getContextPath() %>/login">

                <div class="mb-3">
                    <label for="email" class="form-label fw-semibold">Email Address</label>
                    <input type="email" id="email" name="email" class="form-control" placeholder="Enter email address" required>
                </div>

                <div class="mb-3">
                    <label for="password" class="form-label fw-semibold">Password</label>
                    <input type="password" id="password" name="password" class="form-control" placeholder="Enter password" required>
                </div>

                <button type="submit" class="btn btn-primary w-100">Sign In</button>

            </form>

            <div class="alert alert-info mt-3 mb-0 small">
                <strong>Administrator Account</strong><br>
                Email: admin@skillhub.com<br>
                Password: admin123
            </div>

            <div class="alert alert-info mt-3 mb-0 small">
                <strong>Student Account</strong><br>
                Email: student@skillhub.com<br>
                Password: student123
            </div>
        </div>
    </div>

</main>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.js"></script>
</body>
</html>