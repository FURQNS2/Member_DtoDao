package com.sumcompany.PSY;

import java.sql.*;

public class MemberDao {
	
	static String driverName="com.mysql.jdbc.Driver";   // 어디꺼를 쓰는지 작성
	static String url ="jdbc:mysql://localhost:3306/serverdb";      // 기본 주소 작성
	static String user = "root";    // 관리자 계정
	static String pass = "12345";    // MySql 비밀번호

	public int inserMember(MemberDto dto) {
		String id = dto.getId();
		String pw = dto.getPw();
		String name = dto.getUsername();
		String email = dto.getEmail();
		
		String sql = "INSERT INTO members(id, pw, username, email) VALUES ('"+id+"','"+pw+"','"+name+"','"+email+"')";
		
		Connection conn = null;
		Statement stmt = null;
		int dbFlag=0;   // 1-성공, 0-실패
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, pass);
			stmt = conn.createStatement();
			dbFlag = stmt.executeUpdate(sql); // 1이 반환되면 성공
		
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(stmt != null) {
					stmt.close();
				}
				if(conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return dbFlag;
	}	

	public int idCheck(String id) {  // 아이디 중복확인
		
	
		int idFlag = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "SELECT * FROM members WHERE id=?";		
		
		try {
			
			Class.forName(driverName);			
			conn = DriverManager.getConnection(url, user, pass);
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();   //   0-실패 or 1-성공
			
			if(rs.next()) {
				idFlag = 1;
			} else {
				idFlag = 0;
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
			if(rs != null ) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		
		return idFlag;   //가입하려는 아이디가 이미 존재하면 1이 반환, 아니면 0이 반환
	}
	
	
	public int userCheck(String id, String pw) {  // 가입된 아이디 조회
		
		int userFlag = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "SELECT pw FROM members WHERE id=?";  // 아이디 조회 후 비밀번호 불러오기		
		
		try {
			
			Class.forName(driverName);			
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();   //   0-실패 or 1-성공
			
			
			if(rs.next()) {
				String dbPw = rs.getString("pw");  //rs값이 null값일 수 있기 때문에 if에 넣는다.
				if(dbPw.equals(pw)){
					userFlag = 1;    // 아이디와 비번 맞음
				}else {
					userFlag = 2;   // 아이디는 맞지만 비번 다름
				}
			} else {
				userFlag = 0;    // 아이디x 비회원
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
			if(rs != null ) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
			
		return userFlag; // 1이 반환되면 로그인 성공, 0이 반환되면 로그인 실패, 2가 반환되며 비밀번호만 틀림
	
	}	


	public MemberDto getMemberInfo(String id) {  // 아이디로 테이블을 검색하여 해당 아이디의 모든 정보를 반환
		
		MemberDto dto = null; 
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "SELECT * FROM members WHERE id=?";		
		
		
		
		
		try {
			
			Class.forName(driverName);			
			conn = DriverManager.getConnection(url, user, pass);
			pstmt =conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();   //   0-실패 or 1-성공
			
			if(rs.next()) {
				
				dto = new MemberDto();
				
				String dbID = rs.getString("id");
				String dbPW = rs.getString("pw");
				String dbusername = rs.getString("name");
				String dbEmail = rs.getString("email");
				String dbSignuptime= rs.getString("signuptime");
			
				
				dto.setId(dbID);
				dto.setPw(dbPW);
				dto.setUsername(dbusername);
				dto.setEmail(dbEmail);
				dto.setSignuptime(dbSignuptime);
			
			} 
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
			if(rs != null ) {
				rs.close();
			}
			if(pstmt != null) {
				pstmt.close();
			}	
			}catch(SQLException e){
				e.printStackTrace();
			}	
		}
		
		   return dto;
	}
	
	
	public int modifyMemberInfor(MemberDto dto) {  //modify.jsp에서 보내준 수정된 회원정보를 DB에 다시 넣기(update)
		
		int updateFlag = 0;
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql = "UPDATE members SET  pw=?, username=?, email=? WHERE id=?";
		
		
		try {
			Class.forName(driverName);
			conn = DriverManager.getConnection(url, user, pass);
			pstmt = conn.prepareStatement(sql);			
			
			pstmt.setString(2, dto.getPw());
			pstmt.setString(4, dto.getUsername());
			pstmt.setString(3, dto.getEmail());
			pstmt.setString(1, dto.getId());
			
			updateFlag =pstmt.executeUpdate(); // 1이 반환되면 성공
			
			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		
		} catch (SQLException e) {
			e.printStackTrace();
		
		}finally {
			try {
				if(pstmt != null) {
					pstmt.close();
				}
				if(conn != null ) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return updateFlag;  //1이 반환되면 정보수정 성공, 아니면 정보수정 실패
	}
	
}


