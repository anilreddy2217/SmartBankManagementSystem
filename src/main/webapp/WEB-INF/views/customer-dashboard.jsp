<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Customer Dashboard - Smart Bank</title>
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
        color: #34a853;
        margin-bottom: 20px;
    }
    .info {
        background: #e8f5e9;
        padding: 15px;
        border-radius: 4px;
        margin-bottom: 20px;
    }
    .info p {
        margin: 5px 0;
        color: #202124;
    }
    .menu {
        display: flex;
        flex-direction: column;
        gap: 10px;
    }
    .menu a {
        padding: 12px 20px;
        background: #34a853;
        color: white;
        text-decoration: none;
        border-radius: 4px;
        text-align: center;
        transition: background 0.3s;
    }
    .menu a:hover {
        background: #2d8e47;
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
        <h2>Welcome, ${customer.fullName}</h2>
        
        <div class="info">
            <p><b>Account Number:</b> ${customer.accountNumber}</p>
            <p><b>Balance:</b> ₹${customer.balance}</p>
        </div>
        
        <div class="menu">
            <a href="<%=request.getContextPath()%>/customer/transfer">Fund Transfer</a>
            <a href="<%=request.getContextPath()%>/customer/statement">Mini Statement</a>
            <a href="<%=request.getContextPath()%>/customer/loan/apply">Apply Loan</a>
            <a href="<%=request.getContextPath()%>/customer/logout" class="logout">Logout</a>
        </div>
    </div>
</body>
</html>
