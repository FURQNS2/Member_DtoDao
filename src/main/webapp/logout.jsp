<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그아웃</title>
</head>
<body>
   <%
	session.invalidate();	 
	%>

	<h3>로그아웃</h3>

	<hr>
	세션을 종료 후 로그아웃을 수행하였습니다.
	
	<a href='main.jsp'>메인화면으로 가기</a>
	
</body>
</html>