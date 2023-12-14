<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/mypage.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>I GOT YOUR INFO</title>
</head>
<body>
	<header>
		<div class="logo">
			<a href="/index.jsp"><i class="bi bi-cpu logo"></i></a>
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
				<th>마지막 출석일</th>
				<td>${mvo.lastlogin }</td>
			</tr>
		</table>
		<button type="submit">수정</button>
		<a href="/memb/remove?${ses.id }"><button type="button">회원탈퇴</button></a>
		<a href="/memb/myList"><button type="button">나의 게시물</button></a>
	</form>
	</main>
	<footer>
		<a
			href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"
			target="_blank"><i class="bi bi-journal-code blog"></i> <span>
				project history</span></a>
	</footer>
	
	<script type="text/javascript">
		const msg_modify = `<c:out value="${msg_modify}" />`;
		console.log(msg_modify);
		if(msg_modify == 'success') {
			alert('수정이 완료되었습니다!');
		}
	</script>
</body>
</html>