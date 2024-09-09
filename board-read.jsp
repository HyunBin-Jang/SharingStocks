</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>게시판</title>

    <!-- Custom fonts for this template-->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

</head>

    <!-- Page Wrapper -->
 <body id="page-top">
	  <%
    String userID=null;
    if(session.getAttribute("userID")!=null){
    	userID=(String)session.getAttribute("userID");
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
                        class="d-none d-sm-inline-block form-inline mr-auto ml-md-3 my-2 my-md-0 mw-100 navbar-search">
                        <div class="input-group">
                            <input type="text" class="form-control bg-light border-0 small" placeholder="Search for..."
                                aria-label="Search" aria-describedby="basic-addon2">
                            <div class="input-group-append">
                                <button class="btn btn-primary" type="button">
                                    <i class="fas fa-search fa-sm"></i>
                                </button>
                            </div>
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
                <div class="container-fluid">

                		<center><h2> 게시글 내용 </h2></center>
						<center>
						<%
							int id, ref = 0;
							String user = "", title="", content="";
							Connection conn = null;
							Statement stmt = null;
							ResultSet rs = null;
					
						id = Integer.parseInt(request.getParameter("id"));
					
						try{
							Class.forName("com.mysql.jdbc.Driver");
							String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
							conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
							stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
							String sql = "select * from board order by ref desc, id asc ";
							rs = stmt.executeQuery(sql);
						}
						catch(Exception e){
							out.println("DB 연동 오류입니다.:" + e.getMessage());
						}
					
						while(rs.next()){
							if(rs.getInt("id")==id){
								ref = id;
								user = rs.getString("user");
								title = rs.getString("title");
								content = rs.getString("content");
								}
						}
						%>
					
						<table border="0" width="500">
						<tr>
							<td width="100"> 글 쓴 이 : </td>
							<td><%=user%></td>
						</tr>
						<tr>
							<td> 글 제 목 : </td>
							<td><%= title %></td>
						</tr>
						<tr>
							<td> 글 내 용 : </td>
							<td><%= content %></td>
						</tr>
						</table><br><br>
					
						
						  <a href="board-insert.jsp?ref=<%= ref %>&flag=r" class="btn btn-secondary btn-icon-split">
                             <span class="icon text-white-50">
                                 <i class="fas fa-arrow-right"></i>
                             </span>
                             <span class="text">답글 쓰기</span></a>

                        <a href="board-delete-pwd.jsp?id=<%= id %>" class="btn btn-secondary btn-icon-split">
                             <span class="icon text-white-50">
                                 <i class="fas fa-arrow-right"></i>
                             </span>
                             <span class="text">게시글 삭제</span></a>
                             
                        <a href="board	.jsp" class="btn btn-secondary btn-icon-split">
                             <span class="icon text-white-50">
                                 <i class="fas fa-arrow-right"></i>
                             </span>
                             <span class="text">게시글 목록 보기</span></a>

				</div>
                <!-- /.container-fluid -->

            </div>
            <!-- End of Main Content -->

            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
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
	
    <!-- Bootstrap core JavaScript-->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	
    <!-- Core plugin JavaScript-->
    <script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/chart.js/Chart.min.js"></script>
    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>
    <script src="js/demo/chart-area-demo.js"></script>
    <script src="js/demo/chart-bar-demo.js"></script>
    
</body>

</html>