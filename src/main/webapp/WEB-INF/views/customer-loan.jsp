<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>Your Loans</h2>

<table border="1">
<tr>
    <th>Type</th>
    <th>Amount</th>
    <th>Tenure</th>
    <th>Interest</th>
    <th>Status</th>
</tr>

<c:forEach items="${loans}" var="loan">
<tr>
    <td>${loan.loanType}</td>
    <td>${loan.amount}</td>
    <td>${loan.tenureMonths}</td>
    <td>${loan.interestRate}%</td>
    <td>${loan.status}</td>
</tr>
</c:forEach>

</table>

<a href="/customer/dashboard">Back</a>
</body>
</html>