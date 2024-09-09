<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="java.io.*" %>
<%@ page import ="java.sql.*" %>
<%@ page import="java.util.*"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>


	<%
		String name = request.getParameter("stockname");
		String code = "";
		Connection conn = null;
		ResultSet rs = null;
		Statement stmt = null;
		
		try{
			String dbURL = "jdbc:mysql://localhost:3306/janghb3730";
			String dbID = "janghb3730";
			String dbPassword = "aa20211212";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		}catch(Exception e){
			e.printStackTrace();
		}
		
		String SQL = "select*from stocks where name = '" + name + "'";
		
		
		try{
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			rs = stmt.executeQuery(SQL);
			rs.next();
			code = rs.getString("code");
		} catch(Exception e){
			e.printStackTrace();
		}
		
		
		PrintWriter script = response.getWriter();
		
		if(code.equals("")){
			script.println("<script>");
			script.println("alert('존재하지 않는 주식명입니다.')");
			script.println("history.back()");
			script.println("</script>");
		}
		else{
			script.println("<script>");
			script.println("location.href = \"stockinfo.jsp?code=" + code + "\"");
			script.println("</script>");
		}
		
	%>
</body>
</html>