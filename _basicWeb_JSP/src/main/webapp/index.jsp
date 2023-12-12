<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- c:out 태그를 사용하기 위해서는 JSTL(Core Tag Library)을 사용 -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Semicolone</title>
</head>
<body>
	<header>
		<div>Logo</div>
		<div>
			<ul>
				<li><a href="/index.jsp">HOME</a></li>
				<c:if test="${ses.id eq null }">
					<li><a href="/member/login.jsp">LOGIN</a></li>
					<li><a href="/memb/join">SIGNUP</a></li>
				</c:if>
				<c:if test="${ses.id ne null }">
					<li><a href="/brd/list">BOARD</a></li>
					<li><a href="/memb/mypage">MYPAGE</a></li>
					<li><a href="/memb/logout">LOGOUT</a></li>
				</c:if>
			</ul>
		</div>
	</header>
	<main>
		<c:if test="${ses.id ne null }">
			<div>
				[ ${ses.id } ]님 환영합니다.<br>
				최근 접속일 : ${ses.lastlogin }<br>
				<a href="/memb/attend"><button>출석하기</button></a>
				<a href="/memb/attend_book"><button>출석부</button></a>
			</div>
		</c:if>
	</main>
	<footer></footer>
	
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