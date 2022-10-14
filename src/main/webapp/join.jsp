<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h3>회원가입</h3>
	<hr>
	 <h3>아이디 중복 여부 확인</h3>
		<form action="idCheck.jsp">
			<input type="text" size="20" name="id">
			<input type="submit" value="중복체크">
		</form>
	
	
	<hr>
	<form action="joinok.jsp">
				아이디 : <input type="text" size="20" name="id"> <br><br>
				비밀번호 : <input type="password" size="16" name="pw"> <br><br>
				이름 : <input type="text" size="16" name="username"> <br><br>
				이메일 : <input type="text" size="30" name="email"> <br><br>
				
				<input type="reset" value="◀ 다시작성 ">
				<input type="submit" value=" 가입하기 ▶"> 
		</form>
</body>
</html>