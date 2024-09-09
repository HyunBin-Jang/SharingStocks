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
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en"><script src="http://code.jquery.com/jquery.min.js"></script>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Stock Info</title>
    <%
    String userID=null;
    if(session.getAttribute("userID")!=null){
    	userID=(String)session.getAttribute("userID");
    }
    
    
    %>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/css/select2.min.css" rel="stylesheet" /> 
	<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-beta.1/dist/js/select2.min.js"></script>

</head>

<body id="page-top">
	<%
	
	int pageNumber = 0;	
	Connection conn = null;
	Statement stmt = null;
	ResultSet rs = null;
	
	if(request.getParameter("pageNumber") != null){
		pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
	}
	else pageNumber = 1;
						        		
	ArrayList<String> Juga = new ArrayList<String>();
	ArrayList<String> Name = new ArrayList<String>();
	ArrayList<String> Code = new ArrayList<String>();
	
	try{
		//db명, root 계정 정보 수정 필요
		Class.forName("com.mysql.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
		conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
	}catch(Exception e){
		e.printStackTrace();
	}
	
	String SQL = "select*from stocks order by name asc";
				 
	try{
		rs = stmt.executeQuery(SQL);
		while(rs.next()){
			Juga.add(rs.getString("juga").replace(",",""));
			Name.add(rs.getString("name"));
			Code.add(rs.getString("code"));
		}
		
	} catch(Exception e){
		e.printStackTrace();
	}
%>
    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar -->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="main.jsp">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Ant planet</div>
            </a>

            <!-- Divider -->
            <hr class="sidebar-divider my-0">


            <!-- Divider -->
            <hr class="sidebar-divider">

            <!-- Heading -->
          
            <!-- Nav Item - Pages Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="board.jsp">
                    <i class="fas fa-fw fa-cog"></i>
                    <span>게시판</span>
                </a>
                
            </li>

            <!-- Nav Item - Utilities Collapse Menu -->
            <li class="nav-item">
                <a class="nav-link collapsed" href="stocklist.jsp">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>주식 종목 상세 정보</span>
                </a>
                
            </li> 
            
            <li class="nav-item">
                <a class="nav-link collapsed" href="Portfolio-list.jsp">
                    <i class="fas fa-fw fa-wrench"></i>
                    <span>Member's 포트폴리오</span>
                </a>
                
            </li>                 
       

            <li class="nav-item">
                <a class="nav-link collapsed" href="news.jsp" >
                    <i class="fas fa-fw fa-wrench"></i>
                   	<span>뉴스</span>
                </a>
                
            </li>


            <!-- Divider -->
            <hr class="sidebar-divider d-none d-md-block">

            <!-- Sidebar Toggler (Sidebar) -->
            <div class="text-center d-none d-md-inline">
                <button class="rounded-circle border-0" id="sidebarToggle"></button>
            </div>

        </ul>
        <!-- End of Sidebar -->

        <!-- Content Wrapper -->
        <div id="content-wrapper" class="d-flex flex-column">

            <!-- Main Content -->
            <div id="content">

                <!-- Topbar -->
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

                    <!-- Sidebar Toggle (Topbar) -->
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>

                    <!-- Topbar Search -->
                    <form 
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search" 
                        action="stocksearch.jsp">
                        <div class="input-group">
								<select id="stocksearch" name="stockname">
									<% for(int i=0; i < Juga.size(); i++){ %>
									<option value=<%=Name.get(i) %>><%=Name.get(i) %></option>
									<%} %>									
								</select>
								
								<script>
									$('select').select2();
								</script>

                                <button class="btn btn-primary" type="submit">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                        </div>
                    </form>

                    <!-- Topbar Navbar -->
                    <ul class="navbar-nav ml-auto">

                        <!-- Nav Item - User Information -->
                        <li class="nav-item dropdown no-arrow">

                            <!-- Dropdown - User Information -->
                            
                            <%
                            	//로그인 했을 때 보여지는 화면
                            	if(userID!=null){
                            
                            %>
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <span class="mr-2 d-none d-lg-inline text-gray-600 small"><%= userID %></span>
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">
                            </a>
                            
                            <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                                <a class="dropdown-item" href="Portfolio.jsp">
                                    <i class="fas fa-user fa-sm fa-fw mr-2 text-gray-400"></i>
                                    My Portfolio
                                </a>
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="logoutAction.jsp">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Logout
                                </a>
                            </div>
                            <%
                            	}else{
                            		
                            %>
                            <a class="nav-link dropdown-toggle" href="#" id="userDropdown" role="button"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="img-profile rounded-circle"
                                    src="img/undraw_profile.svg">  
                             </a>                         
                             <div class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
                                aria-labelledby="userDropdown">
                              
                                <div class="dropdown-divider"></div>
                                <a class="dropdown-item" href="login.jsp">
                                    <i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
                                    Login
                                </a>
                            </div>
                            <%
                            	}
                            %>
                        </li>

                    </ul>

                </nav>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                
                
                <br>
               	<%
               	
        

            	String sql = null;
            	Document doc = null;
            	String code;
            	String sql_update;
            	String name=null;
            	String juga=null;
            	String netchange=null;
            	String ctype=null;
            	
            	try{     // DB 연동
            		Class.forName("com.mysql.jdbc.Driver");
            		String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
            		conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
            		stmt = conn.createStatement();
            		
            	}
            	catch(Exception e){
            		out.println("DB 연동 오류입니다.:" + e.getMessage());
            	}
            	
               	
            	code=request.getParameter("code"); //게시판에서 누르면 code 넘겨줌
            	//code="052690";  //상승
            	//code="001040"; //하락
            	//code="086280"; //보합
            	sql="select * from stocks where code="+code+";";
            	rs = stmt.executeQuery(sql);
            	while(rs.next()){
            		name=rs.getString("name");
            		juga=rs.getString("juga");
            		netchange=rs.getString("netchange");
            		ctype=rs.getString("ctype");
            		
            	}
            	
            	%>
            	
            	 
            	 <div class="container-fluid">
            	 	<h3>주식 종목 상세 정보</h3>
            	 	<br>
		 				<div class="d-sm-flex align-items-center justify-content-between mb-4">
		                        <h1 class="h3 mb-0 text-gray-800"><strong><%=name %></strong><sub>   <%=code %></sub></h1> 
		                        
		                  
		                   </div>
			                   
			        <%
	            	if(ctype.equals("상승")){
	            		%><h2 style="color:red;">     <%=juga %></h2>  
	            		전일대비 | <strong style="color:red";>+<%=netchange %>원</strong>
	            		<% 
	            	}else if(ctype.equals("보합")){
	            		%><h2 style="color:green;">     <%=juga %></h2>  
	            		전일대비 | <strong style="color:green";>-</strong>
	            		<% 
	            		
	            	}else{
	            		%><h2 style="color:blue;">     <%=juga %></h2> 
	            		전일대비 | <strong style="color:blue";>-<%=netchange %>원</strong>
	            		
	            		<%
	            	}
	            	
	            	%>
	            	<br><br>
	            	<%
	            	
	            	String URL="https://finance.naver.com/item/main.nhn?code="+code;
	            	Document doc2=Jsoup.connect(URL).get();
	            	doc2.html();
	            	
	            	Element chart=doc2.select("#img_chart_area").get(0);	            	
	            	out.println(chart);
	            	
	            	%>
	            	 
	            	<% 
	            	
	            	//Element -> ArrayList
	            	
	            	Elements siga=doc2.select(".first>table>tbody>tr>th"); 
	         		Elements num1=doc2.select(".first>table>tbody>tr>td");
	            	
	            	Elements tuja=doc2.select(".rwidth>tbody>tr>th");
	            	Elements num2=doc2.select(".rwidth>tbody>tr>td");
	            	
	            	Elements per=doc2.select(".per_table>tbody>tr>th");
	            	Elements num3=doc2.select(".per_table>tbody>tr>td");
	            	
	            	Elements same=doc2.select(".gray>table>tbody>tr>th");
	            	Elements num4=doc2.select(".gray>table>tbody>tr>td");

	            	
     
	            	%>
	            	
	            	<div style="position:absolute; top:180px; left:1000px;">
						<table border="2" align="left" >
							<tr align="center" bgcolor="#4e73df">
								<th colspan="2" width="400" height="40" style="color:white">투자 정보</th>
							</tr>
							
							<tr align="center" style="bgcolor:skyblue">
								<th><%= siga.get(0).text()%></th>
								<%= num1.get(0)%>
							</tr>
							<tr align="center">
								<th><%= siga.get(1).text()%></th>
								<%= num1.get(1)%>
							</tr>
							<tr align="center">
								<th><%= siga.get(2).text()%></th>
								<%= num1.get(2)%>
							</tr>
							<tr align="center">
								<th><%= siga.get(3).text()%></th>
								<%= num1.get(3)%>
							</tr>
							<!-- --------------------------------- -->
							<tr align="center">
								<th><%= same.get(0).text()%></th>
								<%= num4.get(0)%>
							</tr>
							<tr align="center">
								<th><%= same.get(1).text()%></th>
								<%= num4.get(1)%>
							</tr>
							<tr align="center">
								<%= same.get(2)%>
								<%= num4.get(2)%>
							</tr>
							<!-- --------------------------------- -->
							<tr align="center">
								<%= tuja.get(0)%>
								<%= num2.get(0)%>
							</tr>
							<tr align="center">
								<%= tuja.get(1)%>
								<%= num2.get(1)%>
							</tr>
							
							<!-- --------------------------------- -->
							<tr align="center">
								<%= per.get(0)%>
								<%= num3.get(0)%>
							</tr>
							<tr align="center">
								<%= per.get(1)%>
								<%= num3.get(1)%>
							</tr>
							<tr align="center">
								<%= per.get(2)%>
								<%= num3.get(2)%>
							</tr>
							<tr align="center">
								<%= per.get(3)%>
								<%= num3.get(3)%>
							</tr>
							
							<!-- --------------------------------- -->
							<tr align="center">
								<%= same.get(2)%>
								<%= num4.get(2)%>
							</tr>
							<tr align="center">
								<th><%= same.get(3).text()%></th>
								<%= num4.get(3)%>
							</tr>							
							
							
							
						</table>
          			</div>
            	    

					       	
            

		          </div>
            	

                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
          
                    
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2021</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

        </div>
        <!-- End of Content Wrapper -->

    </div>
    <!-- End of Page Wrapper -->

    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>

    <!-- Logout Modal-->
    <!-- 
    <div class="modal fade" id="logoutModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel"
        aria-hidden="true">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Ready to Leave?</h5>
                    <button class="close" type="button" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">×</span>
                    </button>
                </div>
                <div class="modal-body">Select "Logout" below if you are ready to end your current session.</div>
                <div class="modal-footer">
                    <button class="btn btn-secondary" type="button" data-dismiss="modal">Cancel</button>
                    <a class="btn btn-primary" href="login.html">Logout</a>
                </div>
            </div>
        </div>
    </div>
     -->

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/chart.js/Chart.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-pie-demo.js"></script>

</body>

</html>