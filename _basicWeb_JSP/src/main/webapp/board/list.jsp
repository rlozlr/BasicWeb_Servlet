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
	<h1>자유게시판</h1>
	
	<!-- 검색 -->
	<div>
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
				<td><a href="#">${bvo.title }</a></td>
				<td>${bvo.writer }</td>
				<td>${bvo.regdate }</td>
				<td>${bvo.readcount }</td>
			</tr>
		</c:forEach>
	</table>
	
	<a href ="/brd/register"><button>글쓰기</button></a>
	<!-- 페이지네이션 -->
	<div>
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
	
	<script type="text/javascript">
		const msg_new = `<c:out value="${msg_new}" />`;
		console.log(msg_new);
		if(msg_new == 'new') {
			alert('게시글을 등록했습니다.');
		}
	</script>
	
</body>
</html>