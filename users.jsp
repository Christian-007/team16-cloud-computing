<%@page import = "java.sql.*" %>
<%@page import = "javax.sql.*" %>
<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
<div id="user-lists" class="container">
	<div class="panel panel-default">
		<!-- Default panel contents -->
		<div class="panel-heading">
			<h4>List of Registered Users</h4>
		</div>

		<!-- Table -->
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
		</table>
	</div>
</div>

<jsp:include page="/WEB-INF/views/footer.jsp"></jsp:include>