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
	<div class="row">
		<div class="col-sm-6 col-xs-12">
			<h2>Music Player</h2>
			<hr>		
			<div class="container">
				<jsp:include page="/musicplayer.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-sm-6 col-xs-12">
			<h2>Comment Posting</h2>
			<hr>		
			<div class="well">
				<%
					
					if(session.getAttribute("userID") != null){
					}
					try (
				     // Step 1: Allocate a database 'Connection' object
				     java.sql.Connection conn = DriverManager.getConnection(
				           "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");

				     	Statement stmt = conn.createStatement();
				  	) {
						String strSelect = "select * from comments";
				        ResultSet rset = stmt.executeQuery(strSelect);
				        while(rset.next()) {
					%>
					<span class="owner"><%=rset.getString("owner")%>: </span><p class="chat-bubble"><%=rset.getString("message")%></p>
					<%
						} 
				  }
				%>
			</div>
			<div class="row">
				<form action="sendComment" method="post">
					<div class="col-sm-10 col-xs-12">
						<input name="chat" type="text" class="form-control" id="chat" placeholder="Say a Word" required>
					</div>
					<div class="col-sm-2 col-xs-12">
						<button type="submit" data-userid='<%=session.getAttribute("userID") %>' id="submit_chat" class="btn btn-default">Send</button> 
					</div>
				</form>	
			</div>
		</div>
	</div>
	

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
						<!-- <a target="_blank" href="../<%=app_name.substring(0, app_name.length() - 4)%>">Open</a> -->
						 <a class="open-app" data-appuserid="<%=appUserID%>" data-link="../<%=app_name.substring(0, app_name.length() - 4)%>" href="#" data-toggle="modal" data-target="#openAppModal">Open</a> 
						 <%
						 	if(session.getAttribute("userID") != null) 
						 		if(session.getAttribute("userID").equals(appUserID)){
						 %>
						 <span> / </span>
						 <a class="delete-app" data-appuserid="<%=appUserID%>" href="#" data-toggle="modal" data-target="#deleteAppModal">Delete</a> 
						 <%
						 }
						 %>
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
			</tbody> 
		</table> 
	</div>
	
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>