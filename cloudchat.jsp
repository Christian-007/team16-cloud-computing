	<div class="well">
		<%
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
		<p class="chat-bubble"><%=rset.getString("message")%></p>
		<%
			} catch(SQLException ex) {
		    	ex.printStackTrace();
		  	}
		  }
		%>
	</div>
	<div class="row">
		<form action="">
			<div class="col-xs-10">
				<input name="chat" type="text" class="form-control" id="chat" placeholder="Say a Word" required>
			</div>
			<div class="col-xs-2">
				<button type="submit" id="submit_chat" class="btn btn-default">Send</button> 
			</div>
		</form>	
	</div>
				<!-- <div class="chatbox">
					<div class="topbox" >
						<font color="white">CloudChat</font>
					
					</div>
					<div class="chatlogs">
						<input type="text" id="inputId" />
						<input type="button" id="buttonId" value="EntryID" onclick="postID();" />
						<br/>
						<br/>
						<textarea id="txtArea" readonly="readonly" rows="22" cols="45"></textarea>
						<br/>

					<div class="bottmbox" >
						<input type="text" id="textInput" size="35" disabled="true" />
						<input type="button" id="bttn" value="Send" disabled="true" onclick="postMessage();" />	
					</div>
					</div>
				</div> -->