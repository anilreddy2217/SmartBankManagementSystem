<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Reset Password - Smart Bank</title>
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
        max-width: 400px;
        width: 100%;
    }
    h2 {
        color: #34a853;
        margin-bottom: 10px;
        text-align: center;
    }
    .subtitle {
        color: #5f6368;
        margin-bottom: 30px;
        text-align: center;
        font-size: 0.9em;
    }
    label {
        display: block;
        margin-bottom: 8px;
        color: #202124;
        font-weight: 500;
    }
    input[type="password"] {
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
        background: #34a853;
        color: white;
        border: none;
        border-radius: 4px;
        font-size: 16px;
        font-weight: 500;
        cursor: pointer;
    }
    button:hover {
        background: #2d8e47;
    }
    .error {
        color: #d93025;
        background: #fce8e6;
        padding: 10px;
        border-radius: 4px;
        margin-top: 15px;
        text-align: center;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Reset Password</h2>
        <p class="subtitle">First time login - Please set a new password</p>
        
        <form action="<%=request.getContextPath()%>/customer/reset-password" method="post">
            <label>New Password:</label>
            <input type="password" name="newPassword" required minlength="4">
            
            <button type="submit">Reset Password</button>
        </form>
        
        <% if(request.getAttribute("error") != null) { %>
            <p class="error">${error}</p>
        <% } %>
    </div>
</body>
</html>