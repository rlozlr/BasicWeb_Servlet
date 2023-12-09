<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>LOGIN</title>
</head>
<body>
	<div>
		<form action="/memb/login" method="post">
			<input type="text" name="id" placeholder="ID">
			<input type="password" name="pwd" placeholder="Password">
			<button type="submit">로그인</button>
		</form>
	</div>
</body>
</html>