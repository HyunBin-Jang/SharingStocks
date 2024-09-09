<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	request.setCharacterEncoding("UTF-8");
	Connection con = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql = null;
	String sql_update = null;
	String name = "";
	String code = "";
	String numof = "";
	String balances = "";
	String id = "";
	int rownum = 0;
	
	if(session.getAttribute("userID")!=null){
    	id=(String)session.getAttribute("userID");
    }
	name = (String)request.getParameter("jongmok_db");
	code = (String)request.getParameter("code_db");
	numof = (String)request.getParameter("numof_db");
	balances = (String)request.getParameter("bal_db");
	
	try{           // DB 연동
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
		con = DriverManager.getConnection(url, "janghb3730", "aa20211212");
		stmt = con.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:" + e.getMessage());
	}
	
	sql_update = "insert into portfolio (name, code, numof, balances, id)" 
			+ "values ('" + name + "', '" + code + "', '"  + numof + "', '" + balances + "','" + id + "')";
	
	try{
		stmt.executeUpdate(sql_update);
		%><script>alert("추가되었습니다") 
			history.back()</script><%
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:" + e.getMessage());
	}
%>
</body>
</html>