<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/list.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
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
	<div class="list-container">
	<!-- 검색 -->
	<div class="search">
		<form action="/brd/list" method="get">
			<c:set value="${ph.pgvo.type }" var="typed"></c:set>
			<select name="type">
				<option ${typed == null ? 'selected' : ''}>선택</option>
				<option value="t" ${typed eq 't' ? 'selected' : ''}>제목</option>
				<option value="w" ${typed eq 'w' ? 'selected' : ''}>작성자</option>
				<option value="c" ${typed eq 'c' ? 'selected' : ''}>내용</option>
				<option value="twc" ${typed eq 'twc' ? 'selected' : ''}>전체</option>
				<option value="tc" ${typed eq 'tc' ? 'selected' : ''}>제목&내용</option>
				<option value="tw" ${typed eq 'tw' ? 'selected' : ''}>제목&작성자</option>
				<option value="wc" ${typed eq 'wc' ? 'selected' : ''}>작성자&내용</option>
			</select>
			<input type="text"name="keyword" placeholder="검색" value="${ph.pgvo.keyword }">
			<!-- 페이지를 전환할 때마다 값을 보내야하기 때문에   -->
			<input type="hidden" name="pageNo" value="1">
			<input type="hidden" name="qty"	value="${ph.pgvo.qty }">
			<button type="submit">검색</button><span>${ph.totalCount}</span>
		</form>
	</div>
	
	<table class="list">
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
				<td><a href="/brd/detail?bno=${bvo.bno }"><img alt="" src="/_fileUpload/th_${bvo.boardFile }">${bvo.title }</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate }</td>
				<td>${bvo.readcount }</td>
			</tr>
		</c:forEach>
	</table>
	<button class="regBnt"><a href ="/brd/register">글쓰기</a></button>
	
	<!-- 페이지네이션 -->
	<div class="pagenation">
		<!-- prev -->
		<c:if test="${ph.prev }">
			<a href="/brd/list?pageNo=${ph.startPage-1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ◁ | </a>		
		</c:if>
		<!-- paging -->
		<c:forEach begin="${ph.startPage }" end="${ph.endPage }" var="i">
			<a href="/brd/list?pageNo=${i}&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> ${i} </a>		
		</c:forEach>
		<!-- next -->
		<c:if test="${ph.next }">
			<a href="/brd/list?pageNo=${ph.endPage+1 }&qty=${ph.pgvo.qty}&type=${ph.pgvo.type}&keyword=${ph.pgvo.keyword}"> | ▷ </a>		
		</c:if>
	</div>
	</div>
	</main>
	<footer>
		<a href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i class="bi bi-journal-code blog"></i>
		<span> project history</span></a>
	</footer>
	
	<script type="text/javascript">
		const msg_new = `<c:out value="${msg_new}" />`;
		console.log(msg_new);
		if(msg_new == 'new') {
			alert('게시글을 등록했습니다.');
		}
	</script>
	
</body>
</html>