<%@page import = "java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	if (session.getAttribute("currentUser") == null) {
    	response.sendRedirect("../../logout.jsp");
	}
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Assignment Reminder</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/font-awesome/css/font-awesome.min.css">
    <script src="scripts/jquery.js"></script>
    <script src="scripts/bootstrap.min.js"></script>
  </head>
  
  <body>
    <div class="container">
      <h2>Assignment Reminder</h2>
      <hr>
    	
      <form action="../../schedule" method="post">
      <p><strong>Assignment:</strong> <input type="text" name="title" size="35"></p>
      <strong>Deadline: </strong>
      <SELECT name="day">
      <OPTION value="sun">Sunday</OPTION>
      <OPTION value="mon">Monday</OPTION>
      <OPTION value="tue">Tuesday</OPTION>
      <OPTION value="wed">Wednesday</OPTION>
      <OPTION value="thu">Thursday</OPTION>
      <OPTION value="fri">Friday</OPTION>
      <OPTION value="sat">Saturday</OPTION>
      </SELECT> 
      <span>
        <SELECT name="time">
          <OPTION value="9">9:00am</OPTION>
          <OPTION value="10">10:00am</OPTION>
          <OPTION value="11">11:00am</OPTION>
          <OPTION value="12">12:00pm</OPTION>
          <OPTION value="13">1:00pm</OPTION>
          <OPTION value="14">2:00pm</OPTION>
          <OPTION value="15">3:00pm</OPTION>
          <OPTION value="16">4:00pm</OPTION>
          <OPTION value="17">5:00pm</OPTION>
          <OPTION value="18">6:00pm</OPTION>
        </SELECT> 
        <input type="submit" name="Submit" value="Add Course">
      </span>
      <BR>
      </FORM>
      <br>
      <div class="table-responsive">
      	<table class="table table-bordered">
          <thead>
            <tr>
              <th></th>
              <th>Sunday</th>
              <th>Monday</th>
              <th>Tuesday</th>
              <th>Wednesday</th>
              <th>Thursday</th>
              <th>Friday</th>
              <th>Saturday</th>
            </tr>
          </thead>

          <% 
          String[] days={"sun","mon","tue","wed","thu","fri","sat"};
          String dbDriver = "com.mysql.jdbc.Driver" ;
          Class.forName(dbDriver) ;
          Connection conn2 = DriverManager.getConnection("jdbc:mysql://stusql.dcs.shef.ac.uk/team040","team040","9ead4a29");
          
          for(int i=9; i<=18; i++){

          %>
          <tr>
            <td><%= i %>:00</td>
          <%
            for(int j=0; j<7; j++){
              String sql2= "SELECT * from calandar where day='"+ days[j] +  "' and time='" + i + "'";
              Statement statement2 = conn2.createStatement();
              ResultSet rset = statement2.executeQuery(sql2);
              %>
              <td>
              <%
              while(rset.next()){
          %>
            <%=rset.getString("event")%> /
          <%
            }%>
            </td>
            <%
            }
          }
          %>
        </tr>
        
      		
      	</table>
      </div>
    </div>
  </body>

</html>



