<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sumcompany.PSY.MemberDao" %>  <!-- 내가 만든 클래스 부르기 -->
<%@ page import="com.sumcompany.PSY.MemberDto" %>
<jsp:useBean id="dto" class="com.sumcompany.PSY.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 중복확인</title>
</head>
<body>
	<h3>아이디 중복 여부 확인</h3>
	<hr>
	<%
		request.setCharacterEncoding("utf-8");
	
		String id = request.getParameter("id");
		
		MemberDao dao = new MemberDao();
		
		int idResult = dao.idCkeck(id); // idFlag 값을 반환(1이면 이미 가입된 아이디 0이면 가입가능 아이디
	
		if(idResult == 1) {
			out.println("이미 존재하는 아이디 입니다. 다른 아이디로 입력해주세요");
		} else {
			out.println("가입가능 아이디 입니다.");
		}				
	%>
	<br><br>
	<a href="join.jsp">뒤로가기 ▶</a>
	
</body>
</html>