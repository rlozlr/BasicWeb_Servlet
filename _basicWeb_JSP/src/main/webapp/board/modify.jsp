<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>
<body>
	<h1>자유게시판 글쓰기</h1>
	<form action="/brd/edit" method="post">
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
		</table>
		<button type="submit">등록</button>
		<a href="/brd/list"><button type="button">취소</button></a>
	</form>
</body>
</html>