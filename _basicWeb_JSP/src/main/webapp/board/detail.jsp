<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
</head>
<body>
	<h1>상세 페이지</h1>
	<img alt="" src="/_fileUpload/${bvo.boardFile }">
	<table>
		<tr>
			<th>제목</th>
			<td>${bvo.title }</td>
		</tr>
		<tr>
			<th>작성자</th>
			<td>${bvo.writer }</td>
		</tr>
		<tr>
			<th>작성일</th>
			<td>${bvo.regdate }</td>
		</tr>
		<tr>
			<th>조회수</th>
			<td>${bvo.readcount }</td>
		</tr>
		<tr>
			<th>내용</th>
			<td>${bvo.content }</td>
		</tr>
		<tr>
			<th>수정일</th>
			<td>${bvo.moddate }</td>
		</tr>
	</table>
	<a href="/brd/register"><button>글쓰기</button></a>
	<!-- 만약 로그인id와 작성자가 같다면... -->
	<c:if test="${ses.id eq bvo.writer }">
	<a href="/brd/modify?bno=${bvo.bno }"><button>수정</button></a>
	<a href="/brd/remove?bno=${bvo.bno }"><button>삭제</button></a>
	</c:if>
	<a href="/brd/list"><button>목록</button></a>
	
		<!-- comment line -->
	<input type="hidden" id="cmtWriter" value="${ses.id }"><br>
	<hr>
	<div>
		댓글 <br>
		${ses.id }<br>
		<input type="text" id="cmtText" placeholder="댓글을 작성해주세요.">
		<button type="button" id="cmtAddBtn" >등록</button>
	</div>
	<hr>
	
	<!-- 댓글 표시 라인 -->
	<div id ="commentLine">
		<div>cno, writer, regdate</div>
		<div>
			<button>수정</button>  <button>삭제</button><br>
			<input value="content">
		</div>
	</div>
	
	<!-- script는 순서대로 써야한다. 값을 못불러 올 수도 있기 때문 -->
	<script type="text/javascript">
		const bnoVal = `<c:out value="${bvo.bno}" />`
		console.log("게시번호 : " + bnoVal);	
		const userId = `<c:out value="${ses.id}" />`
		console.log("작성자 : " + userId);	
	</script>
	
	<script src="/resources/board_detail.js"></script>
	
	<script type="text/javascript">
	 	printCommentList(bnoVal);
	</script>
	
</body>
</html>