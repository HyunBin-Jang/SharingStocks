<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.text.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<html>
<body>
<%
	String userID=null;
	if(session.getAttribute("userID")!=null){
		userID=(String)session.getAttribute("userID");
	}
	int temp = 0, cnt;
	int new_id = 0, ref = 0;
	String title, content, passwd, reply;
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	String sql_update;
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		String sql = "select max(id) as max_id, count(*) as cnt from board";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:"+e.getMessage());
	}
	
	while(rs.next()){
		cnt = Integer.parseInt(rs.getString("cnt"));
		if(cnt != 0)
			new_id = Integer.parseInt(rs.getString("max_id"));
	}
	new_id++;
	title = request.getParameter("title");
	content = request.getParameter("content");
	passwd = request.getParameter("passwd");
	reply = request.getParameter("reply");
	
	if("y".equals(reply)){
				ref = Integer.parseInt(request.getParameter("ref"));
	} else {
				ref = new_id;
	}
	
	sql_update = "insert into board (id, user, title, content, passwd, ref)"
			+ "values ('" + new_id + "', '" + userID +  "', '" + title + "', '"+content+"', '"+passwd+"', '"+ ref+" ')";
	
	try{
		stmt.executeUpdate(sql_update);
	
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:"+e.getMessage());
	}
%>
<center>
	<h2> 작성한 글이 등록되었습니다. </h2>
	<a href="board.jsp"> 게시글 목록 보기 </a>
</center>
</body>
</html>