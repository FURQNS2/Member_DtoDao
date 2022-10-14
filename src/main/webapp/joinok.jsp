<%@page import="com.sumcompany.PSY.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.sumcompany.PSY.MemberDao" %>  <!-- 내가 만든 클래스 부르기 -->
<%@ page import="com.sumcompany.PSY.MemberDto" %>
<jsp:useBean id="dto" class="com.sumcompany.PSY.MemberDto"/>
<jsp:setProperty property="*" name="dto"/>
<% request.setCharacterEncoding("utf-8"); %>   <!-- 글씨 깨짐 방지 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>
	<%
	   /*
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String email = request.getParameter("email");	
		
		
		MemberDto dto = new MemberDto();
		dto.setId(id);
		dto.setPw(pw);
		dto.setUsername(name);
		dto.setEmail(email);
		*/
		
		MemberDao dao = new MemberDao();
		
		int idResult = dao.idCheck(dto.getId());
		
		if(idResult == 1) {
			out.print("이미 가입된 아이디입니다. 다른 아이디를 입력해주세요.");
		}else{
			int joinCheck = dao.inserMember(dto);
			if(joinCheck == 1) {
			out.println("회원가입 성공!");
			} else {
			out.println("회원가입 실패! 가입사항을 다시 확인해주세요.");
		}
		}
	%>

</body>
</html>