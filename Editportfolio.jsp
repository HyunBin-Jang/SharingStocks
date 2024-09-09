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
<!DOCTYPE html>
<html lang="en"><script src="http://code.jquery.com/jquery.min.js"></script>
<head>
	<title>포트폴리오 수정</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

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

<body class="bg-gradient-primary">
		<%
    String userID=null;
    if(session.getAttribute("userID")!=null){
    	userID=(String)session.getAttribute("userID");
    }
    %>
<nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

               <!-- Sidebar Toggle (Topbar) -->
               <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                </button>

                  
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
    <div class="container">
        <div class="card o-hidden border-0 shadow-lg my-5">
            <div class="card-body p-0">
              <div class="row">
              <div class="col-lg-3"></div>
	                <div class="col-lg-6">
                        <div class="p-5 my-3 py-2">
                                <div class="text-center">
                                    <h1 class="h4 text-gray-900 mb-4">포트폴리오 수정</h1>
                                </div>
                             	<div class="col-sm-10 mb-3 mb-sm-0">
                                 	<form class = "form-inline" action="#" onclick = "button_click()">
                                 		 <div class="form-group row">
                                 		 
<!-- 	                                       <input type="text" class="form-control form-control-user" id="jongmok" name = "jongmok" -->
<!--	                                           placeholder="종목명">&nbsp;&nbsp;&nbsp;&nbsp;                              	 -->
											<select id="result_name" name="result_name" >
												<% 

													request.setCharacterEncoding("UTF-8");
													String realPath = application.getRealPath("WEB-INF/jsons/kospi.json");
													FileReader fr = new FileReader(realPath);
													JSONArray js = null;
													JSONObject jo = null;

													try{    
														js = (JSONArray) new JSONParser().parse(fr);
													}
													catch(Exception e){
														out.println(e.getMessage());
													}
												
												
													for(int i=0;i<js.size(); i++){ 
														jo = (JSONObject)js.get(i);
												%>
												<option value=<%= String.valueOf(jo.get("name"))%>> <%=String.valueOf(jo.get("name")) %></option>
												<%} %>
											</select>
													
											<script>
												$('select').select2();
											</script>
	                                 	  </div>              
	                                 	  
<!-- 										&nbsp;&nbsp;&nbsp;<input type = "button" value = "선택" onclick = "button_click()"> -->
	                                 	  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input type = "submit" value="검색"> 
										</form>
	                                 	                   
 								  </div>
 								  <br><br>
 								  <div class="form-group row mt-3">
									<% 
									String name = request.getParameter("result_name");
									for(int i=0;i<js.size(); i++){ 
										jo = (JSONObject)js.get(i);
										if(jo.get("name").equals(name)) break;
									}
									String code = String.valueOf(jo.get("code")); 
									if(name != null || code != null){
									%>
										종목명 : <div id="selectname" class = "mr-4"><%=name%></div> 
										종목코드  :  <div id="selectcode" class = "mr-4"><%=code%></div> 
										&nbsp;&nbsp;&nbsp;<input type = "button" value = "선택" onclick = "button_click()">
									<%}%>
								  </div>
								  <div class="form-group row">
	                                  <div class="col-sm-5">
	                                   	   <input type="text" class="form-control form-control-user" id="numof" name = "numof" 
	                                   	       onchange = "print_numof()"  placeholder="주 수">
	                                  </div> 
	                                  <div class="col-sm-5">
	                                   	   <input type="text" class="form-control form-control-user" name = "balances" id = "balances" 
	                                   	   		onchange = "print_bal()" placeholder="평균 매입가">
	                                  </div>   
	                              </div>
	                              <div class="form-group row">
<%-- 	                             	종목명 : <div id="selectname" class = "mr-4"><%=name%></div>  --%>
	                              
	                              	종목명 : <div id = "jongmokname" class="mr-3"></div> 
	                              	주 수: <div id = "printnumof" class="mr-3"></div> 
	                              	평균 매입가 : <div id = "printbalances" class="mr-3"></div></div>                          
                            	   
                            	    <div style = "float : left">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                            	    <div style = "float : left">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                            	    <div style = "float : left">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                            	    <div style = "float : left">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                            	    <div style = "float : left">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                            	    
  	                            	<form action = "add_portfolio.jsp" method = "post" style="float : left">
			                            <input type = "hidden" name = "jongmok_db" id="jongmok_db">
			                            <input type = "hidden" name = "code_db" id="code_db">
			                           	<input type = "hidden" name = "numof_db" id="numof_db">
			                           	<input type = "hidden" name = "bal_db" id="bal_db">
			                           	<input type = "submit" value = "추가">
		                           	</form>
		                           		                           	
		                           			                        
		                            <div style = "float : left">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</div>
		                            <div style = "float : left">&nbsp&nbsp&nbsp&nbsp&nbsp</div>
                     					<form action = "delete_portfolio.jsp" method = "post" style="float : left">
			                            <input type = "hidden" name = "jongmok_db2" id="jongmok_db2">			                         
			                           	<input type = "submit" value = "삭제">
		                           	</form>
                            </div>                                          	
                    </div>
              </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
	<script>
	function button_click() {
		const name = document.getElementById("selectname");
		const code = document.getElementById("selectcode");
		document.getElementById("jongmok_db").value = name.innerText;
		document.getElementById("jongmok_db2").value = name.innerText;
		document.getElementById("code_db").value = code.innerText;
		document.getElementById("jongmokname").innerText = name.innerText;
	}
	function print_numof()  {
		  const numof = document.getElementById("numof").value;
		  document.getElementById("printnumof").innerText = numof;
		  document.getElementById("numof_db").value = numof;
	}
	function print_bal()  {
		  const bal = document.getElementById("balances").value;
		  document.getElementById("printbalances").innerText = bal;
		  document.getElementById("bal_db").value = bal;
	}
</script>
</body>

</html>