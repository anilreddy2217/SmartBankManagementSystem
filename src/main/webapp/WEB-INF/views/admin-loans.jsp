<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Loan Approvals - Smart Bank</title>
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
        max-width: 1000px;
        margin: 0 auto;
    }
    h2 {
        color: #1a73e8;
        margin-bottom: 20px;
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
    .btn {
        padding: 6px 12px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-size: 14px;
        margin-right: 5px;
    }
    .approve-btn {
        background: #34a853;
        color: white;
    }
    .reject-btn {
        background: #d93025;
        color: white;
    }
    .approve-btn:hover {
        background: #2d8e47;
    }
    .reject-btn:hover {
        background: #c5221f;
    }
    .no-data {
        text-align: center;
        padding: 40px;
        color: #5f6368;
    }
    .back-link {
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
        <h2>Pending Loan Applications</h2>
        
        <c:if test="${empty loans}">
            <div class="no-data">
                <p>No pending loan applications</p>
            </div>
        </c:if>
        
        <c:if test="${not empty loans}">
            <table>
                <tr>
                    <th>Account</th>
                    <th>Type</th>
                    <th>Amount</th>
                    <th>Tenure</th>
                    <th>Interest</th>
                    <th>Applied Date</th>
                    <th>Action</th>
                </tr>
                <c:forEach items="${loans}" var="loan">
                    <tr>
                        <td>${loan.accountNumber}</td>
                        <td>${loan.loanType}</td>
                        <td>₹${loan.amount}</td>
                        <td>${loan.tenureMonths} months</td>
                        <td>${loan.interestRate}%</td>
                        <td>${loan.appliedDate}</td>
                        <td>
                            <form action="<%=request.getContextPath()%>/admin/loan/approve" method="post" style="display:inline">
                                <input type="hidden" name="loanId" value="${loan.id}"/>
                                <button type="submit" class="btn approve-btn">Approve</button>
                            </form>
                            <form action="<%=request.getContextPath()%>/admin/loan/reject" method="post" style="display:inline">
                                <input type="hidden" name="loanId" value="${loan.id}"/>
                                <button type="submit" class="btn reject-btn">Reject</button>
                            </form>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </c:if>
        
        <div class="back-link">
            <a href="<%=request.getContextPath()%>/admin/dashboard">← Back to Dashboard</a>
        </div>
    </div>
</body>
</html>