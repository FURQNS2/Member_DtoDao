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
<title>Insert title here</title>
</head>
<body>
	<%
	   
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
			
		
		MemberDao dao = new MemberDao();
		
		int userFlag = dao.userCheck(id, pw); // 1이 반환되면 로그인 성공, 0이 반환되면 로그인 실패, 2가 반환되며 비밀번호만 틀림
		
		if(userFlag == 2){
			out.print("비밀번호가 다릅니다.");
		}
		if(userFlag == 1) {
			session.setAttribute("memberId", id);
			session.setAttribute("validMember", "yes");
			out.print("로그인 되셨습니다.");
			out.print("<hr>");
			out.print(id + "님 반갑습니다. 로그인에 성공하셨습니다.");
			
		}else{
			
			out.println("가입되지 않은 아이디입니다.");
	%>      	<a href="join.jsp">회원가입하기</a>
	<% }%>
         <br>
          <a href="main.jsp">메인화면 가기</a>
		

	
</body>
</html>