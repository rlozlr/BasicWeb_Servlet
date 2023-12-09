<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>마이페이지</h1>
	<form action="/memb/modify" method="post">
		<table>
			<tr>
				<th>ID</th>
				<td>${mvo.id }</td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="text" name="pwd" value="${mvo.pwd }"></td>
			</tr>
			<tr>
				<th>E-mail</th>
				<td><input type="text" name="email" value="${mvo.email }"></td>
			</tr>
			<tr>
				<th>Team</th>
				<td><input type="text" name="team" value="${mvo.team }"></td>
			</tr>
			<tr>
				<th>계정 생성일</th>
				<td>${mvo.regdate }</td>
			</tr>
			<tr>
				<th>최근 접속일</th>
				<td>${mvo.lastlogin }</td>
			</tr>
		</table>
		<button type="submit">수정</button>
		<a href="/memb/remove?${ses.id }"><button type="button">회원탈퇴</button></a>
	</form>
	
	<script type="text/javascript">
		const msg_modify = `<c:out value="${msg_modify}" />`;
		console.log(msg_modify);
		if(msg_modify == 'success') {
			alert('수정이 완료되었습니다!');
		}
	</script>
</body>
</html>