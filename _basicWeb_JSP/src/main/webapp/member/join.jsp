<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h1>회원가입</h1>
	<br>
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
		<button type="submit">회원가입</button>
	</form>
		<button>취소</button>
</body>
</html>