<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Transaction Statement - Smart Bank</title>
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
        max-width: 900px;
        margin: 0 auto;
    }
    h2 {
        color: #34a853;
        margin-bottom: 20px;
    }
    .filter-form {
        background: #f8f9fa;
        padding: 15px;
        border-radius: 4px;
        margin-bottom: 20px;
    }
    .filter-form select, .filter-form input, .filter-form button {
        padding: 8px 12px;
        border: 1px solid #dadce0;
        border-radius: 4px;
        margin-right: 10px;
    }
    .filter-form button {
        background: #34a853;
        color: white;
        border: none;
        cursor: pointer;
    }
    .filter-form button:hover {
        background: #2d8e47;
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
    }
    th, td {
        padding: 12px;
        text-align: left;
        border-bottom: 1px solid #e0e0e0;
    }
    th {
        background: #f8f9fa;
        font-weight: 600;
        color: #202124;
    }
    .download-btn {
        background: #1a73e8;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
    }
    .download-btn:hover {
        background: #1557b0;
    }
    .back-link {
        margin-top: 20px;
    }
    .back-link a {
        color: #34a853;
        text-decoration: none;
    }
    .error {
        color: #d93025;
        background: #fce8e6;
        padding: 10px;
        border-radius: 4px;
        margin: 15px 0;
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Transaction Statement</h2>
        
        <div class="filter-form">
            <form action="<%=request.getContextPath()%>/customer/statement/filter" method="get">
                <label>Month:</label>
                <select name="month">
                    <option value="">All</option>
                    <c:forEach begin="1" end="12" var="m">
                        <option value="${m}">${m}</option>
                    </c:forEach>
                </select>
                
                <label>Year:</label>
                <input type="number" name="year" placeholder="2026" required />
                
                <button type="submit">Filter</button>
            </form>
        </div>
        
        <c:if test="${empty transactions}">
            <p class="error">No transactions found</p>
        </c:if>
        
        <c:if test="${not empty transactions}">
            <table>
                <tr>
                    <th>Date</th>
                    <th>Type</th>
                    <th>From</th>
                    <th>To</th>
                    <th>Amount</th>
                </tr>
                <c:forEach items="${transactions}" var="tx">
                    <tr>
                        <td>${tx.transactionDate}</td>
                        <td>${tx.type}</td>
                        <td>${tx.fromAccount}</td>
                        <td>${tx.toAccount}</td>
                        <td>₹${tx.amount}</td>
                    </tr>
                </c:forEach>
            </table>
            
            <form action="<%=request.getContextPath()%>/customer/statement/download" method="get">
                <input type="hidden" name="month" value="${month}" />
                <input type="hidden" name="year" value="${year}" />
                <button type="submit" class="download-btn">Download CSV</button>
            </form>
        </c:if>
        
        <div class="back-link">
            <a href="<%=request.getContextPath()%>/customer/dashboard">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
