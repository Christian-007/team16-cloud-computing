import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.annotation.WebServlet;
import  javax.servlet.http.*;
import  java.sql.*;

@WebServlet("/ScheduleServlet")
public class ScheduleServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try{
			String title = request.getParameter("title");
			String day = request.getParameter("day");
			String time = request.getParameter("time");
			String dbDriver = "com.mysql.jdbc.Driver" ;
// 			Class.forName(dbDriver) ;
			Connection conn = (Connection) DriverManager.getConnection("jdbc:mysql://stusql.dcs.shef.ac.uk/team040","team040","9ead4a29");
			  String sqlInsert = "insert into calandar (event,day,time) values ('" + title + "', '" + day + "','" + time + "')";
			  Statement stmt = (Statement) conn.createStatement();
			  int countInserted = stmt.executeUpdate(sqlInsert);
			  stmt.close();
			  conn.close();
			  response.sendRedirect("index.jsp");

		}
		catch (SQLException e) {
			   e.printStackTrace();
		  }
	}
}
