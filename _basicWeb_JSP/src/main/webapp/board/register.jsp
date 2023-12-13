<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/register.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
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
		<form action="/brd/insert" method="post" enctype="multipart/form-data">
			제목 <input type="text" name="title"><br>
			<!-- 작성자는 글쓰기에서 노출 안시키고 값만 서버로 
		(리스트에는 작성자 명을 띄워야 하니까) -->
			<input type="hidden" name="writer" value="${ses.id }"><br>
			내용<br>
			<textarea rows="10" cols="30" name=content></textarea>
			<br><input type="file" name="board_file" class="add-file"><br>
			<div class="btn-box"> 
			<button type="submit">등록</button>
			<a href="/brd/list"><button type="button">취소</button></a>
			</div>
		</form>
	</main>
	<footer>
		<a
			href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i
			class="bi bi-journal-code blog"></i> <span> project history</span></a>
	</footer>
</body>
</html>