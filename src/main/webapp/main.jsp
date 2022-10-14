<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 화면</title>
</head>
<body>
 <h3>로그인 확인</h3>
 <hr>

	<%
		if(session.getAttribute("validMember") == null ) {   //로그아웃 상태
			out.println("<a href='login.jsp'>로그인으로 가기</a>");
		}else{    //로그아웃상태
		String id = (String)session.getAttribute("memberId");
			out.println("<a href='logout.jsp'>로그아웃</a>");
			out.println("<a href='modify.jsp'>회원정보수정</a>"+"<br>");
		}
	%>
	
	
</body>
</html>