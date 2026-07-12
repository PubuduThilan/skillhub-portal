<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>

    <style>
        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            background: #f8fafc;
        }

        .card {
            width: 430px;
            padding: 35px;
            text-align: center;
            background: white;
            border-radius: 16px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.10);
        }

        h1 {
            color: #dc2626;
        }

        p {
            color: #64748b;
            line-height: 1.6;
        }

        a {
            display: inline-block;
            margin-top: 15px;
            padding: 11px 20px;
            color: white;
            text-decoration: none;
            background: #2563eb;
            border-radius: 8px;
        }
    </style>
</head>

<body>

<div class="card">

    <h1>Access Denied</h1>

    <p>
        You do not have permission to access this section.
    </p>

    <a href="<%= request.getContextPath() %>/portal/dashboard">
        Return to Dashboard
    </a>

</div>

</body>
</html>