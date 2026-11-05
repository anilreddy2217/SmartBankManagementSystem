<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard - Smart Bank</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f0f2f5;
        padding: 20px;
    }
    .container {
        background: white;
        padding: 30px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        margin: 0 auto;
    }
    h2 {
        color: #1a73e8;
        margin-bottom: 30px;
    }
    .menu {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    .menu a {
        padding: 12px 20px;
        background: #1a73e8;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        text-align: center;
        transition: background 0.3s;
    }
    .menu a:hover {
        background: #1557b0;
    }
    .logout {
        background: #d93025 !important;
    }
    .logout:hover {
        background: #c5221f !important;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Welcome Admin 👨‍💼</h2>
        
        <div class="menu">
            <a href="<%=request.getContextPath()%>/admin/create-customer">Create Customer</a>
            <a href="<%=request.getContextPath()%>/admin/loans">Loan Approvals</a>
            <a href="<%=request.getContextPath()%>/admin/logout" class="logout">Logout</a>
        </div>
    </div>
</body>
</html>