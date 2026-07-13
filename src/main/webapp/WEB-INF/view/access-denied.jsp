<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Access Denied</title>

    <link rel="icon" href="<%= request.getContextPath() %>/assets/images/icon.png"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/bootstrap.css"/>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/assets/css/styles.css"/>
</head>

<body>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-12 col-md-8 col-lg-5">
            <div class="card">
                <div class="card-body text-center">
                    <h1 class="h4 text-danger">Access Denied</h1>
                    <p class="text-muted">You do not have permission to access this section.</p>
                    <a class="btn btn-primary mt-3" href="<%= request.getContextPath() %>/portal/dashboard">Return to Dashboard</a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="<%= request.getContextPath() %>/assets/js/bootstrap.bundle.js"></script>
</body>
</html>