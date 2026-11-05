<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Customer - Smart Bank</title>
<style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: #f0f2f5;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }
    .container {
        background: white;
        padding: 40px;
        border-radius: 8px;
        box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        max-width: 450px;
        width: 100%;
    }
    h2 {
        color: #1a73e8;
        margin-bottom: 30px;
        text-align: center;
    }
    label {
        display: block;
        margin-bottom: 8px;
        color: #202124;
        font-weight: 500;
    }
    input[type="text"],
    input[type="email"] {
        width: 100%;
        padding: 12px;
        border: 1px solid #dadce0;
        border-radius: 4px;
        font-size: 14px;
        margin-bottom: 20px;
    }
    button {
        width: 100%;
        padding: 12px;
        background: #1a73e8;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
    }
    button:hover {
        background: #1557b0;
    }
    .success {
        color: #1e8e3e;
        background: #e6f4ea;
        padding: 10px;
        border-radius: 4px;
        margin-top: 15px;
        text-align: center;
    }
    .back-link {
        text-align: center;
        margin-top: 20px;
    }
    .back-link a {
        color: #1a73e8;
        text-decoration: none;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Create Customer</h2>
        
        <form action="<%=request.getContextPath()%>/admin/create-customer" method="post">
            <label>Full Name:</label>
            <input type="text" name="fullName" required>
            
            <label>Email:</label>
            <input type="email" name="email" required>
            
            <label>Mobile Number:</label>
            <input type="text" name="mobile" required pattern="[0-9]{10}" placeholder="10-digit mobile number">
            
            <button type="submit">Create Customer</button>
        </form>
        
        <% if(request.getAttribute("message") != null) { %>
            <p class="success">${message}</p>
        <% } %>
        
        <div class="back-link">
            <a href="<%=request.getContextPath()%>/admin/dashboard">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>