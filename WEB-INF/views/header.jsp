<!DOCTYPE html>
<html>
  <head>
  	<% 
  		String p = request.getParameter("p");
  		if(p == null){
			p = "home";
  		}
   		String pagePath = "WEB-INF/views/"+ p + ".jsp";
   		String url = request.getRequestURL().toString();
   		String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
		String[] array = url.split("/") ;
	%>
	
    <meta charset=""UTF-8”/>
    <title>Home Page</title>
 	
 	<!-- Vendor CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet">

	<!-- Style CSS -->
	<link href="css/style.css" rel="stylesheet">

  </head>
  <body>
  	<!-- Navigation Bar -->
  	<nav class="navbar navbar-default">
		<div class="container-fluid">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">
					<i class="fa fa-cloud" aria-hidden="true"></i>
					Cloud Platform
				</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav navbar-right">
					<li><a class="peanut" href="users.jsp">My Peanut: <%= session.getAttribute("myPeanut") %></a></li>
					<li><a href="index.jsp"><i class="fa fa-th-large" aria-hidden="true"></i> APPLICATIONS</a></li>
					<!-- <li><a href="users.jsp"><i class="fa fa-user" aria-hidden="true"></i> USERS</a></li> -->
					<li><a href="#" data-toggle="modal" data-target="#uploadModal"><i class="fa fa-upload" aria-hidden="true"></i> UPLOAD</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Welcome, <%= session.getAttribute("currentUser") %><span class="caret"></span></a>
						<ul class="dropdown-menu">
							<li><a href="users.jsp">Settings</a></li>
							<li role="separator" class="divider"></li>
							<li><a href="logout.jsp">Logout</a></li>
						</ul>
					</li>
				</ul>
			</div><!-- /.navbar-collapse -->
		</div>
	</nav>
	
	<jsp:include page="/WEB-INF/views/openAppModal.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/uploadModal.jsp"></jsp:include>
	<jsp:include page="/WEB-INF/views/topupModal.jsp"></jsp:include>