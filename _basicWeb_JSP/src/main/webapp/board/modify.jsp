<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/modify.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
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
		<div class="show-container">
			<form action="/brd/edit" method="post" enctype="multipart/form-data">
				<!-- controller case "edit"에 보낼 bno 값 -->
				<input type="hidden" name="bno" value="${bvo.bno }">
				<table>
					<tr>
						<th>제목</th>
						<td><input type="text" name="title" value="${bvo.title }"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><textarea rows="10" cols="30" name="content">${bvo.content }</textarea></td>
					</tr>
					<tr>
						<th>첨부파일</th>
						<td><input type="hidden" name="board_file"
							value="${bvo.boardFile }"> <!-- accept있어도 모든 파일을 다 올릴 수 있음 / 기능적으로 일을 하지 않음-->
							<input type="file" name="new_file" class="add-file"></td>
					</tr>
				</table>
				<div class="btn-box">
					<button type="submit">등록</button>
					<button type="button">
						<a href="/brd/list">취소</a>
					</button>
				</div>
			</form>
			<c:if test="${bvo.boardFile ne null}">
				<div class="now-file">
					첨부파일<br> <br> <img alt=""
						src="/_fileUpload/${bvo.boardFile }" width="600px" height="400px">
				</div>
			</c:if>
		</div>
	</main>
	<footer>
		<a
			href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i
			class="bi bi-journal-code blog"></i> <span> project history</span></a>
	</footer>
</body>
</html>