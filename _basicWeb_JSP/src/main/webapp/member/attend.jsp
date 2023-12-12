<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>출석부</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/attend.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/index.jsp"><i class="bi bi-cpu logo"></i></a></li>
		</div>
		<div class="top-menu">
			<ul class="ul">
				<li><a href="/memb/attend_book">AttenBook</a></li>
				<li><a href="/brd/list">BOARD</a></li>
				<li><a href="/memb/mypage">MYPAGE</a></li>
				<li><a href="/memb/logout">LOGOUT</a></li>
			</ul>
		</div>
	</header>
	<main>
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
	</main>
	<footer>
		<a href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i class="bi bi-journal-code blog"></i>
		<span> project history</span></a>
	</footer>
</body>
</html>