<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out 태그를 사용하기 위해서는 JSTL(Core Tag Library)을 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semicolone</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/index.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
</head>
<body>
	<header>
		<div class="logo">
			<a href="/index.jsp"><i class="bi bi-cpu logo"></i></a></li>
		</div>
		<div class="top-menu">
			<ul class="ul">
				<c:if test="${ses.id eq null }">
					<li><a href="/member/login.jsp">LOGIN</a></li>
					<li><a href="/memb/join">SIGNUP</a></li>
				</c:if>
				<c:if test="${ses.id ne null }">
					<li><a href="/memb/attend_book">AttenBook</a></li>
					<li><a href="/brd/list">BOARD</a></li>
					<li><a href="/memb/mypage">MYPAGE</a></li>
					<li><a href="/memb/logout">LOGOUT</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<main>
		<c:if test="${ses.id eq null }">
			<div class="hello">
				Semicolone ;
			</div>
		</c:if>
		<c:if test="${ses.id ne null }">
			<div class="welcome">
				<h3>Hi, [ ${ses.id } ]</h3>
				<p>Welcome to here<br>Come with us</p>
				<a href="/memb/attend"><button>Check In</button></a>
			</div>
		</c:if>
	</main>
	<footer>
		<a href="https://rlog0918.tistory.com/category/TOY%20PROJECT/%5BJSP%5D%20%EA%B8%B0%EB%B3%B8%20%ED%99%88%ED%8E%98%EC%9D%B4%EC%A7%80%20%EB%A7%8C%EB%93%A4%EA%B8%B0"><i class="bi bi-journal-code blog"></i>
		<span> project history</span></a>
	</footer>
	
	<script type="text/javascript">
		const msg_join = `<c:out value="${msg_join}" />`;
		console.log(msg_join);
		if (msg_join == 'welcome') {
			alert('회원가입이 완료되었습니다~!!\n환영합니다!');
		}
		
		const msg_login = `<c:out value="${msg_login}" />`;
		console.log(msg_login);
		if (msg_login == 'fail') {
			alert('로그인 정보가 일치하지 않습니다.');
		}
		
		const msg_remove = `<c:out value="${msg_remove}" />`;
		console.log(msg_remove);
		if(msg_remove == 'bye') {
			alert('Good Bye...!');
		}

	</script>
</body>
</html>