<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>login</title>
</head>
<body>
<%
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		String sql_update = null;
		int result = -1;
		String joinID = "";
		String joinPWD = "";
		String joinName = "";
		String joinGender = "";
		String joinEmail = "";
		
		joinID = request.getParameter("userID"); 
		joinPWD = request.getParameter("userPassword"); 
	    joinName = request.getParameter("userName");
	    joinGender = request.getParameter("userGender");
	    joinEmail = request.getParameter("userEmail"); 
	    
		// 현재 세션 상태를 체크한다
		String userID = null;
		if(session.getAttribute("userID") != null){
			userID = (String)session.getAttribute("userID");
		}
		// 이미 로그인했으면 회원가입을 할 수 없게 한다
		if(userID != null){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('이미 로그인이 되어 있습니다')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		else if(joinID == "" || joinPWD == "" || joinName == "" ||
			joinGender == "" || joinEmail == ""){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력이 안 된 사항이 있습니다')");
			script.println("history.back()");
			script.println("</script>");
		}else{
			try {
				String dbURL = "jdbc:mysql://localhost:3306/janghb3730";
				String dbID = "janghb3730";
				String dbPassword = "aa20211212";				
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			}catch (Exception e) {
				e.printStackTrace();
			}
			sql = "insert into user values(?, ?, ?, ?, ?)";
			  try {
			    pstmt = conn.prepareStatement(sql);
			    pstmt.setString(1, joinID);
			    pstmt.setString(2, joinPWD);
			    pstmt.setString(3, joinName);
			    pstmt.setString(4, joinGender);
			    pstmt.setString(5, joinEmail);
			    result = pstmt.executeUpdate();;
			  }catch (Exception e) {
			 	e.printStackTrace();
			  }
			
			if(result == -1){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 존재하는 아이디입니다')");
				script.println("history.back()");
				script.println("</script>");
			}else {
				session.setAttribute("userID", joinID);
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('회원가입 성공')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
		}
	%>


</body>
</html>