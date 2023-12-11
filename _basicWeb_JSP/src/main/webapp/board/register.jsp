<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유게시판</title>
</head>
<body>
	<h1>자유게시판 글쓰기</h1>
	<form action="/brd/insert" method="post" enctype="multipart/form-data">
		제목 : <input type="text" name="title"><br>
		<!-- 작성자는 글쓰기에서 노출 안시키고 값만 서버로 
		(리스트에는 작성자 명을 띄워야 하니까) -->
		<input type="hidden" name="writer" value="${ses.id }"><br>
		내용 :<br>
		<textarea rows="10" cols="30" name=content></textarea><br>
		첨부파일 : <input type="file" name="board_file"><br>
		<button type="submit">등록</button>
		<a href="/brd/list"><button type="button">취소</button></a>
	</form>
</body>
</html>