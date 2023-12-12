<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 게시물</title>
</head>
<body>
	<h1>나의 게시물</h1>
	<hr>
	<br>
	<c:if test="${not empty myList }">
	<table>
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
			<td><a href="/brd/detail?bno=${bvo.bno }">${bvo.title }</a></td>
			<td>${bvo.writer }</td>
			<td>${bvo.regdate }</td>
			<td>${bvo.readcount }</td>
		</tr>
		</c:forEach>
		</table>
		<br>
	</c:if>
	<c:if test="${empty myList}">
		<h4>등록된 게시글이 없습니다.</h4>
		<br><a href="/brd/register"><button>글쓰기</button></a>
	</c:if>
</body>
</html>