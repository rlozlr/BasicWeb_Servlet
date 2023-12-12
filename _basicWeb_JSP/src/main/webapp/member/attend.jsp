<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석부</title>
</head>
<body>
	<h1>출석부</h1>
	<table>
		<tr>
			<th>ID</th>
			<th>출석일</th>
		</tr>
		<c:forEach items="${list }" var="mvo">
		<tr>
			<td>${mvo.id }</td>
			<td>${mvo.lastlogin }</td>
		</tr>
		</c:forEach>
	</table>
</body>
</html>