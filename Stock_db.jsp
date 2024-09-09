<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>
<%@ page import="java.sql.*" %>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.JSONArray"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주식 정보 가져오기</title>
</head>

<body>
<%
	Connection conn = null;
	Statement stmt = null;
	String sql = null;
	Document doc = null;
	ResultSet rs = null;
	String sql_update;
	String code = "";
	String name = "";
	String juga ="";
	String netchange = "";
	String ctype = "";
	Boolean first = true;
	final String Url = "https://finance.naver.com/item/main.nhn?code=";
	
	String realPath = application.getRealPath("WEB-INF/jsons/kospi.json");
	FileReader fr = new FileReader(realPath);
	JSONArray js = null;
	JSONObject jo = null;
	
	try{           // DB 연동
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		sql = "select * from stocks";
		rs = stmt.executeQuery(sql);
	}
	catch(Exception e){
		out.println("DB 연동 오류입니다.:" + e.getMessage());
	}
	
	try{     // json 파일에서 kospi 200 종목명과 코드 가져오기
		js = (JSONArray) new JSONParser().parse(fr);
	}
	catch(Exception e){
		out.println(e.getMessage());
	}
	rs.last();
	if(rs.getRow() == 0){
		first = true;
	}else{
		first = false;
	}
	rs.beforeFirst();
	
	for(int i=0; i < js.size(); i++){
		
		jo = (JSONObject)js.get(i);
		code = String.valueOf(jo.get("code"));
		name = String.valueOf(jo.get("name"));
		
		try {             // 주식 종목 크롤링
			doc = Jsoup.connect(Url + code).get();
			Elements elem = doc.select(".date");
			String[] str = elem.text().split(" ");
	
			Elements todaylist =doc.select(".new_totalinfo dl>dd");
			
			juga = todaylist.get(3).text().split(" ")[1];
			String DungRakrate = todaylist.get(3).text().split(" ")[6];
			String siga =  todaylist.get(5).text().split(" ")[1];
			String goga = todaylist.get(6).text().split(" ")[1];
			String zeoga = todaylist.get(8).text().split(" ")[1];
			String georaeryang = todaylist.get(10).text().split(" ")[1];
	
			ctype = todaylist.get(3).text().split(" ")[3]; //상한가,상승,보합,하한가,하락 구분
	
			netchange = todaylist.get(3).text().split(" ")[4];
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}
		if(first){
			sql_update = "insert into stocks (code, name, juga, netchange, ctype)" 
					+ "values ('" + code + "', '" + name + "', '" + juga + "', '" + netchange + "', '" + ctype + "')";
			try{
				stmt.executeUpdate(sql_update);
			
			}
			catch(Exception e){
				out.println("DB 연동 오류입니다.:"+e.getMessage());
			}
		}
		else{
			sql_update = "update stocks set name = '" + name + "', juga = '" + juga  +"', netchange = '" + netchange + "', ctype = '"
					+ ctype + "' where code = '" + code + "'";
			try{
				stmt.executeUpdate(sql_update);
			
			}
			catch(Exception e){
				out.println("DB 연동 오류입니다.:"+e.getMessage());
			}
		}
	}
%>
</body>
</html>