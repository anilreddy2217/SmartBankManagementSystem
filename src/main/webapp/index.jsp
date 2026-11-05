<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Smart Bank - Home</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
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
            text-align: center;
            max-width: 450px;
            width: 100%;
        }
        
        h1 {
            color: #1a73e8;
            margin-bottom: 10px;
            font-size: 2em;
        }
        
        .subtitle {
            color: #5f6368;
            margin-bottom: 40px;
            font-size: 1em;
        }
        
        .button-group {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        
        .btn {
            padding: 12px 24px;
            border: none;
            border-radius: 4px;
            font-size: 1em;
            cursor: pointer;
            text-decoration: none;
            display: inline-block;
            transition: background 0.3s ease;
            font-weight: 500;
        }
        
        .btn-admin {
            background: #1a73e8;
            color: white;
        }
        
        .btn-admin:hover {
            background: #1557b0;
        }
        
        .btn-customer {
            background: #34a853;
            color: white;
        }
        
        .btn-customer:hover {
            background: #2d8e47;
        }
        
        .footer {
            margin-top: 30px;
            color: #5f6368;
            font-size: 0.9em;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>🏦 Smart Bank</h1>
        <p class="subtitle">Welcome to Smart Banking System</p>
        
        <div class="button-group">
            <a href="<%=request.getContextPath()%>/admin/login" class="btn btn-admin">
                Admin Login
            </a>
            
            <a href="<%=request.getContextPath()%>/customer/login" class="btn btn-customer">
                Customer Login
            </a>
        </div>
        
        <div class="footer">
            <p>Secure • Simple • Reliable</p>
        </div>
    </div>
</body>
</html>
