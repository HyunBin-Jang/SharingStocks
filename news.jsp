<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>News</title>

    <!-- Custom fonts for this template -->
    <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template -->
    <link href="css/sb-admin-2.min.css" rel="stylesheet">

    <!-- Custom styles for this page -->
    <link href="vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

</head>

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

				<% 
				final String Url = "https://finance.naver.com/news/";
				final String Url2 = "https://finance.naver.com";
				Document doc = null;
				
				doc = Jsoup.connect(Url).get();
				Elements elem = doc.select(".summary_block li>a");
				Elements images = doc.select(".firstArticle a>img");
				%>
                <!-- Begin Page Content -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Stock Market News</h1>
                    <p class="mb-4"> 아래의 금융 정보는 각 콘텐츠 제공업체제공업체 상세설명로부터 받는 투자 참고사항이며,<br>
                    오류가 발생하거나 지연될 수 있습니다. 
                    제공된 정보에 의한 투자 결과에 법적인 책임을 지지 않습니다.
                    </p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">News</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                            	<div class="container">
								    <div class="row">
								        <div class="col-md-6">
									        <table class="table" id="dataTable" width="100%" cellspacing="0">
									        	<thead>
			                                    	시황·전망<br><br>
			                                    </thead>
												<img src = <%=images.get(0).attr("src")%> style="float: right; width:80px; height:80px;">
		                                		<ul style="list-style: none;">
			                                		<%for(int i=0; i < 5; i++){ %>
			                                		<li><a href = <%= Url2 + elem.get(i).attr("href")%>><%=elem.get(i).text()%></a></li>
			                                		<%} %>
		                       					</ul>
	                              		 	 </table>
                            		    </div>
								        <div class="col-md-6">
								        	 <table class="table" id="dataTable" width="100%" cellspacing="0">
								        	 	<thead>
			                                    	기업·종목분석<br><br>
			                                    </thead>
								        	 	<img src = <%=images.get(1).attr("src")%> style="float: right; width:80px; height:80px;">
		                                		<ul style="list-style: none;">
			                                		<%for(int i=5; i < 10; i++){ %>
			                                		<li><a href = <%= Url2 + elem.get(i).attr("href")%>><%=elem.get(i).text()%></a></li>
			                                		<%} %>
		                       					</ul>
	                              		 	 </table>
	                              		</div>
								        <div class="col-md-6">
								        	 <table class="table" id="dataTable" width="100%" cellspacing="0">
								        	 	<thead>
			                                    	해외 증시<br><br>
			                                    </thead>
								        	 	<img src = <%=images.get(2).attr("src")%> style="float: right; width:80px; height:80px;">
		                                		<ul style="list-style: none;">
			                                		<%for(int i=10; i < 15; i++){ %>
			                                		<li><a href = <%= Url2 + elem.get(i).attr("href")%>><%=elem.get(i).text()%></a></li>
			                                		<%} %>
		                       					</ul>
	                              		 	 </table>
	                              		</div>
								        <div class="col-md-6">
								        	 <table class="table" id="dataTable" width="100%" cellspacing="0">
								        	 	<thead>
			                                    	채권·선물<br><br>
			                                    </thead>
								        	 	<img src = <%=images.get(3).attr("src")%> style="float: right; width:80px; height:80px;">
		                                		<ul style="list-style: none;">
			                                		<%for(int i=15; i < 20; i++){ %>
			                                		<li><a href = <%= Url2 + elem.get(i).attr("href")%>><%=elem.get(i).text()%></a></li>
			                                		<%} %>
		                       					</ul>
	                              		 	 </table>
	                              		</div>
								        <div class="col-md-6">
								        	 <table class="table" id="dataTable" width="100%" cellspacing="0">
								        	 	<thead>
			                                    	공시·메모<br><br>
			                                    </thead>
		                                		<ul style="list-style: none;">
			                                		<%for(int i=20; i < 25; i++){ %>
			                                		<li><a href = <%= Url2 + elem.get(i).attr("href")%>><%=elem.get(i).text()%></a></li>
			                                		<%} %>
		                       					</ul>
	                              		 	 </table>
	                              		</div>
								        <div class="col-md-6">
								        	 <table class="table" id="dataTable" width="100%" cellspacing="0">
								        	 	<thead>
			                                    	환율<br><br>
			                                    </thead>
								        	 	<img src = <%=images.get(4).attr("src")%> style="float: right; width:80px; height:80px;">
		                                		<ul style="list-style: none;">
			                                		<%for(int i=25; i < 30; i++){ %>
			                                		<li><a href = <%= Url2 + elem.get(i).attr("href")%>><%=elem.get(i).text()%></a></li>
			                                		<%} %>
		                       					</ul>
	                              		 	 </table>
	                              		 </div>
								    </div>
								</div>
                          
                            </div>
                        </div>
                    </div>

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
                        <span aria-hidden="true">Ã</span>
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

    <!-- Custom scripts for all pages-->
    <script src="js/sb-admin-2.min.js"></script>

    <!-- Page level plugins -->
    <script src="vendor/datatables/jquery.dataTables.min.js"></script>
    <script src="vendor/datatables/dataTables.bootstrap4.min.js"></script>

    <!-- Page level custom scripts -->
    <script src="js/demo/datatables-demo.js"></script>

</body>

</html>