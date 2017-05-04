<%@page import = "java.sql.*" %>
<%@page import = "javax.sql.*" %>
<%
	if (session.getAttribute("currentUser") == null) {
    	response.sendRedirect("logout.jsp");
	}
%>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>

<div id="home" class="container">
	<!-- <a href="../MapsFinder">Link</a> -->
	<h2>Applications</h2>
	<hr>
	<div class="table-responsive"> 
		<table class="table table-bordered table-striped"> 
			<colgroup> 
				<col class="col-xs-2"> 
				<col class="col-xs-2"> 
				<col class="col-xs-7"> 
				<col class="col-xs-1"> 
			</colgroup> 
			<thead> 
				<tr> 
					<th>Icon</th> 
					<th>Name</th>
					<th>Description</th>
					<th></th>
				</tr> 
			</thead> 
			<tbody> 
				<%
					try (
				     // Step 1: Allocate a database 'Connection' object
				     java.sql.Connection conn = DriverManager.getConnection(
				           "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
				           // MySQL: "jdbc:mysql://hostname:port/databaseName", "username", "password"

				     // Step 2: Allocate a 'Statement' object in the Connection
				     	Statement stmt = conn.createStatement();
				  	) {
						String strSelect = "select * from applications";
						int appUserID = 0;
						String app_name = "";
						String icon = "";
				        //out.println("The SQL query is: " + strSelect);  // Echo For debugging
				        ResultSet rset = stmt.executeQuery(strSelect);
				        while(rset.next()) {   // Move the cursor to the next row
				        app_name = (String) rset.getString("file_name");
				        icon = (String) rset.getString("icon_name");
				        appUserID = rset.getInt("user_id");
				%>
				<tr> 
					<td><img src="images/<%=icon %>" alt="" class="img-responsive"></td>
					<td><%=rset.getString("app_name")%></td> 
					<td><%=rset.getString("description") %></td> 
					<td>
						<!-- <a target="_blank" href="uploadedFiles/<%=app_name.substring(0, app_name.length() - 4)%>">Open</a> -->
						 <a class="open-app" data-appuserid="<%=appUserID%>" data-link="uploadedFiles/<%=app_name.substring(0, app_name.length() - 4)%>" href="#" data-toggle="modal" data-target="#openAppModal">Open</a> 
					</td> 
				</tr> 
				<%
				        	// out.println(rset.getString("app_name"));
				        	// out.println(rset.getString("password"));
				        }
				  	} catch(SQLException ex) {
				    	ex.printStackTrace();
				  	}
				%>
				<!-- <tr> 
					<td><i class="fa fa-steam fa-2x" aria-hidden="true"></i></td>
					<td>Steam</td> 
					<td>This app allows user to steami-fy any devices that have steam capability.</td> 
					<td>
						<a href="#">Open</a>
						<span>/</span>
						<a href="#">Edit</a>
					</td> 
				</tr>  -->
			</tbody> 
		</table> 
	</div>
	<!-- <div class="row text-center">
		<div class="col-sm-3 col-xs-12">
			<div class="thumbnail">
				<i class="fa fa-cloud fa-3x" aria-hidden="true"></i>
				<p>Cloud Platform</p>
				<a href="#">Edit</a>
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="thumbnail">
				<i class="fa fa-steam fa-3x" aria-hidden="true"></i>
				<p>Steam</p>
				<a href="#">Edit</a>
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="thumbnail">
				<i class="fa fa-facebook fa-3x" aria-hidden="true"></i>
				<p>Facebook</p>
				<a href="#">Edit</a>
			</div>
		</div>
		<div class="col-sm-3 col-xs-12">
			<div class="thumbnail">
				<i class="fa fa-apple fa-3x" aria-hidden="true"></i>
				<p>Apple</p>
				<a href="#">Edit</a>
			</div>
		</div>
	</div> -->
	<!-- <div class="text-center">
		<h2>REGISTRATION</h2>
		<hr class="hor-line">
		<p>
			This is a registration form to create a user account for accessing the platform.
		</p>
		<form action="registration" method="POST" id="submit-form"> 
			<div class="row">
				<div class="col-sm-6">
					<div class="form-group">
						<input type="text" name="fname" class="form-control" id="firstname" placeholder="First Name">
					</div>	
				</div>
				<div class="col-sm-6">
					<div class="form-group">
						<input type="text" name="lname" class="form-control" id="lastname" placeholder="Last Name">
					</div>	
				</div>
			</div>
			<div class="form-group">
				<input type="email" name="email" class="form-control" id="email" placeholder="Sheffield Email Address">
			</div>
			<div class="form-group">
				<input type="text" name="phone" class="form-control" id="phone" placeholder="Phone Number">
			</div>
			<div class="form-group">
				<input type="password" name="password" class="form-control" id="password" placeholder="Password">
			</div>
			<button type="submit" class="btn btn-default">CREATE ACCOUNT</button> 
		</form>
	</div> -->
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>