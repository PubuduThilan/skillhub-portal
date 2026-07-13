<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillHub Error</title>
    <link rel="icon" href="<%= request.getContextPath() %>/assets/images/icon.png"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css"/>
</head>

<body class="d-flex justify-content-center align-items-center min-vh-100">

<div class="text-center card p-4">
    <h1 class="text-danger">Something went wrong</h1>

    <p>The requested page could not be loaded.</p>

    <a class="btn btn-primary mt-2" href="<%= request.getContextPath() %>/login">Return to Login</a>
</div>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.js"></script>
</body>
</html>