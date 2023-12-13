<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/login.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/index.jsp"><i class="bi bi-cpu logo"></i></a>
		</div>
		<div class="top-menu">
			<ul class="ul">
				<!-- login과 signup은 어차피 로그인을 안한 상태에서만 들어갈 수 있으므로 
				ses.id ne null 부분은 지웠다.-->
				<li><a href="/member/login.jsp">LOGIN</a></li>
				<li><a href="/memb/join">SIGNUP</a></li>
			</ul>
		</div>
	</header>
	<main>
		<div class="login">
			<form action="/memb/login" method="post">
				<input type="text" name="id" placeholder=" ID" class="userId">
				<input type="password" name="pwd" placeholder=" Password" class="userPwd">
				<button type="submit">Login</button>
			</form>
		</div>
	</main>
	<footer>
		<a href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i class="bi bi-journal-code blog"></i>
		<span> project history</span></a>
	</footer>
</body>
</html>