<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시물</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/myList.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/index.jsp"><i class="bi bi-cpu logo"></i></a>
		</div>
		<div class="top-menu">
			<ul>
				<li><a href="/memb/attend_book">AttenBook</a></li>
				<li><a href="/brd/list">BOARD</a></li>
				<li><a href="/memb/mypage">MYPAGE</a></li>
				<li><a href="/memb/logout">LOGOUT</a></li>
			</ul>
		</div>
	</header>
	<main>
		<c:if test="${not empty myList }">
			<table class="list">
				<tr>
				<!-- nno, title, writer, regdate, readcount -->
					<th>No</th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th>조회수</th>
				</tr>
				<c:forEach items="${myList }" var="bvo">
					<tr>
						<!-- title 눌렀을 때 게시글 상세로 이동할 수 있게  -->
						<td>${bvo.bno }</td>
						<td><a href="/brd/detail?bno=${bvo.bno }"><img alt="" src="/_fileUpload/th_${bvo.boardFile }">${bvo.title }</a></td>
						<td>${bvo.writer }</td>
						<td>${bvo.regdate }</td>
						<td>${bvo.readcount }</td>
					</tr>
				</c:forEach>
			</table>
			<a href ="/brd/register"><button class="regBnt">글쓰기</button></a>
		</c:if>
		<c:if test="${empty myList}">
			<div class="noList">
				<h4>등록된 게시글이 없습니다.</h4>
				<a href="/brd/register"><button>글쓰기</button></a>
			</div>
		</c:if>
	</main>
	<footer>
		<a
			href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"
			target="_blank"><i class="bi bi-journal-code blog"></i> <span>
				project history</span></a>
	</footer>
</body>
</html>