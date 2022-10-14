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
<title>회원 정보 수정 확인</title>
</head>
<body>
	<h3>회원 정보 수정 확인</h3>	
	<hr>

 <%
		MemberDao dao = new MemberDao();
		
		int modifyFlag = dao.modifyMemberInfor(dto);  // 1-수정성공, 0-수정실패
		
		if(modifyFlag == 1) {
			out.println("수정성공");
		}else{
			out.println("수정실패! 다시 확인해주세요!");
			}
	%>
</body>
</html>