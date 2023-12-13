<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/resources/css/detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
		<div class="list-container">
			<div class="show-container">

				<table class="detail-table">
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
				<c:if test="${bvo.boardFile ne null}">
					<div class="now-file">
						첨부파일<br> <br> <img alt=""
							src="/_fileUpload/${bvo.boardFile }" width="600px" height="400px">
					</div>
				</c:if>
			</div>
			<div class="btn-container">
				<a href="/brd/register"><button>글쓰기</button></a>
				<!-- 만약 로그인id와 작성자가 같다면... -->
				<c:if test="${ses.id eq bvo.writer }">
					<a href="/brd/modify?bno=${bvo.bno }"><button>수정</button></a>
					<a href="/brd/remove?bno=${bvo.bno }"><button>삭제</button></a>
				</c:if>
				<a href="/brd/list"><button>목록</button></a>
			</div>

			<!-- comment line -->
			<input type="hidden" id="cmtWriter" value="${ses.id }"><br>
			<div class="cmt-reg">
				댓글 <br> ${ses.id }<br> <input type="text" id="cmtText"
					placeholder="댓글을 작성해주세요.">
				<button type="button" id="cmtAddBtn">등록</button>
			</div>
			<hr>

			<!-- 댓글 표시 라인 -->
			<div id="commentLine">
				<div>cno, writer, regdate</div>
				<div>
					<button>수정</button>
					<button>삭제</button>
					<br> <input value="content">
				</div>
			</div>
		</div>
	</main>
	<footer>
		<a
			href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i
			class="bi bi-journal-code blog"></i> <span> project history</span></a>
	</footer>
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