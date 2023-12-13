<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/join.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/index.jsp"><i class="bi bi-cpu logo"></i></a>
		</div>
		<div class="top-menu">
			<ul class="ul">
				<li><a href="/member/login.jsp">LOGIN</a></li>
				<li><a href="/member/join.jsp">SIGNUP</a></li>
			</ul>
		</div>
	</header>
	<main>
		<form action="/memb/register" method="post">
			<table>
				<tr>
					<th>ID</th>
					<td><input type="text" name="id"></td>
				</tr>
				<tr>
					<th>Password</th>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input type="email" name="email"></td>
				</tr>
				<tr>
					<th>Team</th>
					<td><input type="text" name="team"></td>
				</tr>
			</table>
			<button tyep="button">취소</button>
			<button type="submit">회원가입</button>
		</form>
	</main>
	<footer>
		<a href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i class="bi bi-journal-code blog"></i>
		<span> project history</span></a>
	</footer>
</body>
</html>