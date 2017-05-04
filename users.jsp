<%@page import = "java.sql.*" %>
<%@page import = "javax.sql.*" %>
<%
	if (session.getAttribute("currentUser") == null) {
    	response.sendRedirect("logout.jsp");
	}

%>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div id="user-lists" class="container">
	<div class="personal">
		<h4>
			<i class="fa fa-user" aria-hidden="true"></i> Personal Details
			<a href="#" class="edit-personal pull-right" data-toggle="modal" data-target="#editDetailsModal">Edit</a>
		</h4>
		<hr>
		<%
			int userID = 0;

			if (session.getAttribute("userID") != null) {
				userID = (Integer) session.getAttribute("userID");
			}

			try (
		     // Step 1: Allocate a database 'Connection' object
		     java.sql.Connection conn = DriverManager.getConnection(
		           "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
		           // MySQL: "jdbc:mysql://hostname:port/databaseName", "username", "password"

		     // Step 2: Allocate a 'Statement' object in the Connection
		     	Statement stmt = conn.createStatement();
		  	) {
				String strSelect = "select * from users where id='" + userID + "'";
				String credit = "";
				ResultSet rset = stmt.executeQuery(strSelect);
		        while(rset.next()) {   // Move the cursor to the next row
		        	credit = (String) rset.getString("credit");
		%>
		<p class="labelName">My Peanut <span><button data-amount="<%=credit%>" data-toggle="modal" data-target="#topupModal" class="btn btn-default topup">TOP UP</button></span></p>
		<p class="credit-text"><%=credit%></p>
		<hr>
		<p class="labelName">Email Address</p>
		<p class="user-email"><%=rset.getString("email")%></p>
		<hr>
		<p class="labelName">Name</p>
		<p class="fullName" data-fname="<%=rset.getString("fname")%>" data-lname="<%=rset.getString("lname")%>"><%=rset.getString("fname") + " " + rset.getString("lname")%></p>
		<hr>
		<p class="labelName">Phone Number</p>
		<p class="user-phone"><%=rset.getString("phone")%></p>
		<hr>
		<p class="labelName">Password</p>
		<button data-toggle="modal" data-target="#passwordModal" class="btn btn-default">Change Password</button>
		<hr>
		<%
		        	// out.println(rset.getString("app_name"));
		        	// out.println(rset.getString("password"));
		        }
		  	} catch(SQLException ex) {
		    	ex.printStackTrace();
		  	}
		%>
	</div>
	<!--<div class="panel panel-default">
		
		<div class="panel-heading">
			<h4><i class="fa fa-user" aria-hidden="true"></i> Personal Details</h4>
		</div>
		<div class="panel-body">
		</div>
		
		<table class="table">
			<thead>
			  	<tr>
			  		<td>#ID</td>
			  		<td>First Name</td>
			  		<td>Last Name</td>
			  		<td>Email</td>
			  		<td>Phone Number</td>
			  		<td>Password</td>
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
					String strSelect = "select * from users";
			        //out.println("The SQL query is: " + strSelect);  // Echo For debugging
			        ResultSet rset = stmt.executeQuery(strSelect);
			        while(rset.next()) {   // Move the cursor to the next row
			%>
		  		<tr>
			  		<td><%=rset.getInt("id") %></td>
			  		<td><%=rset.getString("fname") %></td>
			  		<td><%=rset.getString("lname") %></td>
			  		<td><%=rset.getString("email") %></td>
			  		<td><%=rset.getString("phone") %></td>
			  		<td><%=rset.getString("password") %></td>
			  	</tr>
		  	<%
			        	// out.println(rset.getInt("id"));
			        	// out.println(rset.getString("fname"));
			        	// out.println(rset.getString("lname"));
			        	// out.println(rset.getString("phone"));
			        	// out.println(rset.getString("password"));
			        }
			  	} catch(SQLException ex) {
			    	ex.printStackTrace();
			  	}
			%>
		  	</tbody>
		</table>-->
	</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>