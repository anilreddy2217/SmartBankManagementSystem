<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Apply for Loan - Smart Bank</title>
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
        color: #34a853;
        margin-bottom: 30px;
        text-align: center;
    }
    label {
        display: block;
        margin-bottom: 8px;
        color: #202124;
        font-weight: 500;
    }
    select, input[type="number"] {
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
        color: #34a853;
        text-decoration: none;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Apply for Loan</h2>
        
        <form action="<%=request.getContextPath()%>/customer/loan/apply" method="post">
            <label>Loan Type:</label>
            <select name="loanType" required>
                <option value="">Select Loan Type</option>
                <option value="HOME">Home Loan (8.5% interest)</option>
                <option value="EDUCATION">Education Loan (6.5% interest)</option>
                <option value="PERSONAL">Personal Loan (12% interest)</option>
            </select>
            
            <label>Amount (₹):</label>
            <input type="number" name="amount" required min="10000" placeholder="Minimum ₹10,000" />
            
            <label>Tenure (Months):</label>
            <input type="number" name="tenure" required min="6" max="360" placeholder="6 to 360 months" />
            
            <button type="submit">Apply for Loan</button>
        </form>
        
        <% if(request.getAttribute("error") != null) { %>
            <p class="error">${error}</p>
        <% } %>
        
        <% if(request.getAttribute("message") != null) { %>
            <p class="success">${message}</p>
        <% } %>
        
        <div class="back-link">
            <a href="<%=request.getContextPath()%>/customer/dashboard">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>