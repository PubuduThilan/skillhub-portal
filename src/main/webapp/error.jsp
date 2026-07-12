<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>SkillHub Error</title>
</head>

<body>

<h1>Something went wrong</h1>

<p>The requested page could not be loaded.</p>

<a href="<%= request.getContextPath() %>/login">
    Return to Login
</a>

</body>
</html>