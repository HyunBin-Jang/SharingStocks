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
// 현재 세션 상태를 체크한다
	String userID = null;
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	String sql_update = null;
	int result = -1;
	String loginID = null;
	String loginPWD = null;
	
	loginID = request.getParameter("userID"); 
	loginPWD = request.getParameter("userPassword"); 
	
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	// 이미 로그인했으면 다시 로그인을 할 수 없게 한다
	if(userID != null){
		PrintWriter script = response.getWriter();
		script.println("<script>");
		script.println("alert('이미 로그인이 되어 있습니다')");
		script.println("location.href='main.jsp'");
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
			result = -2;
		}
		
		try {		
			sql = "select userPassword from user where userID = ?";
			pstmt = conn.prepareStatement(sql); //sql쿼리문을 대기 시킨다
			pstmt.setString(1, loginID); //첫번째 '?'에 매개변수로 받아온 'userID'를 대입
			rs = pstmt.executeQuery(); //쿼리를 실행한 결과를 rs에 저장
			if(rs.next()) {
				if(rs.getString(1).equals(loginPWD)) {
					result = 1; //로그인 성공
				}else{
					result = 0; //비밀번호 틀림
				}
			}
		}catch (Exception e) {
			e.printStackTrace();
			result = -2;
		}
		
		if(result == 1){
			session.setAttribute("userID", loginID);
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인 성공')");
			script.println("location.href='main.jsp'"); //로그인 성공시 main.jsp로 이동
			script.println("</script>");
		}else if(result == 0){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('비밀번호가 틀립니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -1){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('존재하지 않는 아이디입니다')");
			script.println("history.back()");
			script.println("</script>");
		}else if(result == -2){
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('데이터베이스 오류입니다')");
			script.println("history.back()");
			script.println("</script>");
		}
	}
%>

</body>
</html>