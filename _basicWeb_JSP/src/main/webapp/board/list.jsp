<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
	<h1>정보 게시판</h1>
	<table>
		<tr>
			<th>No</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- DB에서 가져온 리스트를  c:forEach를 통해 반복 
			var="bvo"는 BoardVO 객체를 참조한다. -->
		<c:forEach items="${list}" var="bvo">
			<tr>
				<td>${bvo.bno }</td>
				<td><a href="#"></a>${bvo.bno }</td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate }</td>
				<td>${bvo.readcount }</td>
			</tr>
		</c:forEach>
	</table>
	<a href ="#"><button>글쓰기</button></a>
	
</body>
</html>