<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.text.DecimalFormat" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
	
    <title>MAIN</title>
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

</head>

<body id="page-top">

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

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">HOME</h1>                       
                    </div>

                    <!-- Content Row -->
					<!-- Illustrations -->
					<div class="row">	
						<div class="col-xl-8 col-lg-5">				
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">Introduction</h6>
                                </div>
                                <div class="card-body">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 30rem;"
                                            src="img/illustrationimage.png" alt="...">
                                    </div>
                                    <p>앤트플레닛에 오신 것을 환영합니다! 자유롭게 포트폴리오를 작성하고 
                                    다른 사람들과 공유하며 투자 시야를 넓힐 수 있는 사이트입니다. 
                                    포트폴리오의 수익률은 자동으로 주식 시장과 연동되며 다른 사람들의 투자 내역과 수익률을 참고해볼 수 있습니다.
									게시판에서도 자유롭게 고수들에게 의견을 구할 수 있으니 자유롭게 활용하시기 바랍니다.</p>                               
                                </div>
                            </div>
                         </div>
                           <!-- Pie Chart -->
       <%  
	
		int total_pur = 0, total_eval = 0, val_pns = 0;
    	float eval_ror = 0;
		int rownum = 0;
		Connection conn = null;
		Statement stmt = null;
		String sql = null;
		ResultSet rs = null;
		ResultSet rs2 = null;
		DecimalFormat decFormat = new DecimalFormat("###,###");
		
		if(session.getAttribute("userID")!=null){
	    	userID=(String)session.getAttribute("userID");
	    }

		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "select * from portfolio where id = '" + userID + "'";
			rs = stmt.executeQuery(sql);
			sql = "select * from stocks";
		}
		catch(Exception e){
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
		rs.last();
		rownum = rs.getRow();
		String[] name = new String[rownum];
		String[] bal = new String[rownum];
		String[] numof = new String[rownum];
		String[] juga = new String[rownum];
		String[] eval = new String[rownum];
		int i= 0;
		int defer;
		rs.beforeFirst();
		stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
		while(rs.next()){
			name[i] = rs.getString("name");
			bal[i] = rs.getString("balances");
			numof[i] = rs.getString("numof");
			total_pur += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs.getString("balances"));
			sql = "select * from stocks where code=" + rs.getString("code");
			rs2 = stmt.executeQuery(sql);
			rs2.next();
			total_eval += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs2.getString("juga").replace(",",""));
			juga[i] = rs2.getString("juga");
			defer = Integer.parseInt(rs2.getString("juga").replace(",","")) - Integer.parseInt(rs.getString("balances"));
			eval[i] = Integer.toString(defer * Integer.parseInt(rs.getString("numof")));
			i++;
		}
		val_pns = total_eval - total_pur;
		eval_ror = (float)val_pns/total_eval * 100;
		String[] ratios = new String[rownum];
		
		
		float k = 0;
		float l = 0;
		for(int j=0; j < rownum; j++){
			l = (float)Integer.parseInt(juga[j].replace(",","")) * Integer.parseInt(numof[j]);
			k = l / total_eval * 100;
			ratios[j] = Integer.toString((int)k);
		}
		
		try{
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
			conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			sql = "SELECT * FROM user ORDER BY RAND()";
			rs = stmt.executeQuery(sql);
		}catch(Exception e){
			out.println("DB 연동 오류입니다.:" + e.getMessage());
		}
		
		rs.next();
		String someoneID[] = new String[3];
		for(i=0; i < 3; i++){
			someoneID[i] = rs.getString("userID");
			rs.next();
		}
		// others info 1
		   
			try{
				Class.forName("com.mysql.jdbc.Driver");
				String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
				conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				sql = "select * from portfolio where id = '" + someoneID[0] + "'";
				rs = stmt.executeQuery(sql);
				sql = "select * from stocks";
			}
			catch(Exception e){
				out.println("DB 연동 오류입니다.:" + e.getMessage());
			}
			rs.last();
			int rownum2 = rs.getRow();
			String[] name2 = new String[rownum2];
			String[] bal2 = new String[rownum2];
			String[] numof2 = new String[rownum2];
			String[] juga2 = new String[rownum2];
			String[] eval2 = new String[rownum2];
			i= 0;
			int defer2 = 0;
			rs.beforeFirst();
			stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
			while(rs.next()){
				name2[i] = rs.getString("name");
				bal2[i] = rs.getString("balances");
				numof2[i] = rs.getString("numof");
				total_pur += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs.getString("balances"));
				sql = "select * from stocks where code=" + rs.getString("code");
				rs2 = stmt.executeQuery(sql);
				rs2.next();
				total_eval += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs2.getString("juga").replace(",",""));
				juga2[i] = rs2.getString("juga");
				defer2 = Integer.parseInt(rs2.getString("juga").replace(",","")) - Integer.parseInt(rs.getString("balances"));
				eval2[i] = Integer.toString(defer2 * Integer.parseInt(rs.getString("numof")));
				i++;
			}
			val_pns = total_eval - total_pur;
			eval_ror = (float)val_pns/total_eval * 100;
			String[] ratios2 = new String[rownum2];
			
			
			k = 0;
			l= 0;
			for(int j=0; j < rownum2; j++){
				l = (float)Integer.parseInt(juga2[j].replace(",","")) * Integer.parseInt(numof2[j]);
				k = l / total_eval * 100;
				ratios2[j] = Integer.toString((int)k);
			}
			
			
			// others info 2 
			  
			   
				try{
					Class.forName("com.mysql.jdbc.Driver");
					String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
					conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
					stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					sql = "select * from portfolio where id = '" + someoneID[1] + "'";
					rs = stmt.executeQuery(sql);
					sql = "select * from stocks";
				}
				catch(Exception e){
					out.println("DB 연동 오류입니다.:" + e.getMessage());
				}
				rs.last();
				int rownum3 = rs.getRow();
				String[] name3 = new String[rownum3];
				String[] bal3 = new String[rownum3];
				String[] numof3 = new String[rownum3];
				String[] juga3 = new String[rownum3];
				String[] eval3 = new String[rownum3];
				i= 0;
				int defer3 = 0;
				rs.beforeFirst();
				stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
				while(rs.next()){
					name3[i] = rs.getString("name");
					bal3[i] = rs.getString("balances");
					numof3[i] = rs.getString("numof");
					total_pur += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs.getString("balances"));
					sql = "select * from stocks where code=" + rs.getString("code");
					rs2 = stmt.executeQuery(sql);
					rs2.next();
					total_eval += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs2.getString("juga").replace(",",""));
					juga3[i] = rs2.getString("juga");
					defer3 = Integer.parseInt(rs2.getString("juga").replace(",","")) - Integer.parseInt(rs.getString("balances"));
					eval3[i] = Integer.toString(defer3 * Integer.parseInt(rs.getString("numof")));
					i++;
				}
				val_pns = total_eval - total_pur;
				eval_ror = (float)val_pns/total_eval * 100;
				String[] ratios3 = new String[rownum3];
				
				
				k = 0;
				l= 0;
				for(int j=0; j < rownum3; j++){
					l = (float)Integer.parseInt(juga3[j].replace(",","")) * Integer.parseInt(numof3[j]);
					k = l / total_eval * 100;
					ratios3[j] = Integer.toString((int)k);
				}
	
			
				   
					try{
						Class.forName("com.mysql.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/janghb3730?serverTimezone=UTC";
						conn = DriverManager.getConnection(url, "janghb3730", "aa20211212");
						stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
						sql = "select * from portfolio where id = '" + someoneID[2] + "'";
						rs = stmt.executeQuery(sql);
						sql = "select * from stocks";
					}
					catch(Exception e){
						out.println("DB 연동 오류입니다.:" + e.getMessage());
					}
					rs.last();
					int rownum4 = rs.getRow();
					String[] name4 = new String[rownum4];
					String[] bal4 = new String[rownum4];
					String[] numof4 = new String[rownum4];
					String[] juga4 = new String[rownum4];
					String[] eval4 = new String[rownum4];
					i= 0;
					int defer4 = 0;
					rs.beforeFirst();
					stmt = conn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_UPDATABLE);
					while(rs.next()){
						name4[i] = rs.getString("name");
						bal4[i] = rs.getString("balances");
						numof4[i] = rs.getString("numof");
						total_pur += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs.getString("balances"));
						sql = "select * from stocks where code=" + rs.getString("code");
						rs2 = stmt.executeQuery(sql);
						rs2.next();
						total_eval += Integer.parseInt(rs.getString("numof"))*Integer.parseInt(rs2.getString("juga").replace(",",""));
						juga4[i] = rs2.getString("juga");
						defer4 = Integer.parseInt(rs2.getString("juga").replace(",","")) - Integer.parseInt(rs.getString("balances"));
						eval4[i] = Integer.toString(defer4 * Integer.parseInt(rs.getString("numof")));
						i++;
					}
					val_pns = total_eval - total_pur;
					eval_ror = (float)val_pns/total_eval * 100;
					String[] ratios4 = new String[rownum4];									
					k = 0;
					l= 0;
					for(int j=0; j < rownum4; j++){
						l = (float)Integer.parseInt(juga4[j].replace(",","")) * Integer.parseInt(numof4[j]);
						k = l / total_eval * 100;
						ratios4[j] = Integer.toString((int)k);
					}		
					
					// end info process
	%>
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-4">
                                    <h6 class="m-0 font-weight-bold text-primary">My portfolio</h6>
                                </div>
                            	<div class="card-body">
                            	<% if (userID != null && rownum != 0){%>
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart"></canvas>
                                    </div>
                                    <%if(rownum > 2){%>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> <%=name[0]%>
                                        </span>
                                        
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> <%=name[1]%>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i><%=name[2]%>
                                        </span>
                                    </div>
                                    <%} %>
                                <%}%>
                                
                            	 </div>
                             </div>                            
                        </div>
                    </div>
                    <div class="row">
                    	<div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-4">
                                    <h6 class="m-0 font-weight-bold text-primary">Other's Portfolio</h6>
                                </div>
                            	<div class="card-body">
                            
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart2"></canvas>
                                    </div>
                                    <%if(rownum2 > 2){%>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> <%=name2[0]%>
                                        </span>
                                        
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> <%=name2[1]%>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i><%=name2[2]%>
                                        </span>
                                    </div>
                                    <%} %>                          
                                
                            	 </div>
                             </div>                            
                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-4">
                                    <h6 class="m-0 font-weight-bold text-primary">Other's Portfolio</h6>
                                </div>
                            	<div class="card-body">                        
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart3"></canvas>
                                    </div>
                                    <%if(rownum3 > 2){%>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> <%=name3[0]%>
                                        </span>
                                        
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> <%=name3[1]%>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i><%=name3[2]%>
                                        </span>
                                    </div>
                                    <%} %>
                                
                            	 </div>
                             </div>                            
                        </div>
                        <div class="col-xl-4 col-lg-5">
                            <div class="card shadow mb-4">
                                <!-- Card Header - Dropdown -->
                                <div class="card-header py-4">
                                    <h6 class="m-0 font-weight-bold text-primary">Other's Portfolio</h6>
                                </div>
                            	<div class="card-body">
                                    <div class="chart-pie pt-4 pb-2">
                                        <canvas id="myPieChart4"></canvas>
                                    </div>
                                    <%if(rownum4 > 2){%>
                                    <div class="mt-4 text-center small">
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-primary"></i> <%=name4[0]%>
                                        </span>
                                        
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-success"></i> <%=name4[1]%>
                                        </span>
                                        <span class="mr-2">
                                            <i class="fas fa-circle text-info"></i><%=name4[2]%>
                                        </span>
                                    </div>
                                    <%} %>
                                
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
    ㄴ
 	<script src="js/demo/chart-pie-demo.js"></script>
 	
 	
    <script>
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: [<%for(String label : name){%>'<%=label%>',<%}%>],
	    datasets: [{
	      data: [<%for(String data : ratios){%> <%=data%>,<%}%>],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	</script>
	
	<script>
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart2");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: [<%for(String label : name2){%>'<%=label%>',<%}%>],
	    datasets: [{
	      data: [<%for(String data : ratios2){%> <%=data%>,<%}%>],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	</script>
	<script>
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart3");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: [<%for(String label : name3){%>'<%=label%>',<%}%>],
	    datasets: [{
	      data: [<%for(String data : ratios3){%> <%=data%>,<%}%>],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	</script>
	<script>
	// Set new default font family and font color to mimic Bootstrap's default styling
	Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
	Chart.defaults.global.defaultFontColor = '#858796';

	// Pie Chart Example
	var ctx = document.getElementById("myPieChart4");
	var myPieChart = new Chart(ctx, {
	  type: 'doughnut',
	  data: {
	    labels: [<%for(String label : name4){%>'<%=label%>',<%}%>],
	    datasets: [{
	      data: [<%for(String data : ratios4){%> <%=data%>,<%}%>],
	      backgroundColor: ['#4e73df', '#1cc88a', '#36b9cc'],
	      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
	      hoverBorderColor: "rgba(234, 236, 244, 1)",
	    }],
	  },
	  options: {
	    maintainAspectRatio: false,
	    tooltips: {
	      backgroundColor: "rgb(255,255,255)",
	      bodyFontColor: "#858796",
	      borderColor: '#dddfeb',
	      borderWidth: 1,
	      xPadding: 15,
	      yPadding: 15,
	      displayColors: false,
	      caretPadding: 10,
	    },
	    legend: {
	      display: false
	    },
	    cutoutPercentage: 80,
	  },
	});
	</script>
</body>

</html>
