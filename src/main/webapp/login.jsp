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

    <style>
        * {
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #f1f5f9;
        }

        .login-container {
            width: 420px;
            background: white;
            padding: 35px;
            border-radius: 18px;
            box-shadow: 0 15px 40px rgba(0, 0, 0, 0.10);
        }

        .logo {
            text-align: center;
            margin-bottom: 28px;
        }

        .logo h1 {
            color: #2563eb;
            margin-bottom: 5px;
        }

        .logo p {
            color: #64748b;
            margin-top: 0;
        }

        .form-group {
            margin-bottom: 18px;
        }

        label {
            display: block;
            margin-bottom: 7px;
            color: #334155;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 13px;
            border: 1px solid #cbd5e1;
            border-radius: 9px;
            font-size: 15px;
        }

        input:focus {
            outline: 2px solid #bfdbfe;
            border-color: #2563eb;
        }

        button {
            width: 100%;
            padding: 13px;
            border: none;
            border-radius: 9px;
            background: #2563eb;
            color: white;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
        }

        button:hover {
            background: #1d4ed8;
        }

        .error {
            padding: 11px;
            margin-bottom: 17px;
            border-radius: 8px;
            color: #991b1b;
            background: #fee2e2;
        }

        .demo {
            margin-top: 20px;
            padding: 13px;
            border-radius: 9px;
            background: #eff6ff;
            color: #1e3a8a;
            font-size: 13px;
            line-height: 1.7;
        }
    </style>
</head>

<body>

<div class="login-container">

    <div class="logo">
        <h1>SkillHub</h1>
        <p>Training Management Portal</p>
    </div>

    <% if (error != null) { %>

    <div class="error">
        <%= error %>
    </div>

    <% } %>

    <form method="post"
          action="<%= request.getContextPath() %>/login">

        <div class="form-group">
            <label for="email">Email Address</label>

            <input type="email"
                   id="email"
                   name="email"
                   placeholder="Enter email address"
                   required>
        </div>

        <div class="form-group">
            <label for="password">Password</label>

            <input type="password"
                   id="password"
                   name="password"
                   placeholder="Enter password"
                   required>
        </div>

        <button type="submit">Sign In</button>

    </form>

    <div class="demo">
        <strong>Administrator Account</strong><br>
        Email: admin@skillhub.lk<br>
        Password: admin123
    </div>

</div>

</body>
</html>