import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

public  class  SendCommentServlet  extends  HttpServlet {

	public  void  doPost(HttpServletRequest  req, HttpServletResponse  res) throws  ServletException,  IOException {
		HttpSession session = req.getSession(true);
		int userID = (Integer) session.getAttribute("userID");
		String message = req.getParameter("chat");
		try (
			Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
			Statement stmt = conn.createStatement();
		) {

			String sql1= "SELECT * from users WHERE id='" + userID + "'";
            Statement statement = conn.createStatement();
            ResultSet rs1 = statement.executeQuery(sql1);
            
            if(rs1.next()){
            	String owner = rs1.getString("fname");
				// INSERT a record
				String sqlInsert = "insert into comments (message,owner) values ('" + message + "', '" + owner + "')";
				int countInserted = stmt.executeUpdate(sqlInsert);
			}
	 		// Redirect to a success page.
			res.sendRedirect("index.jsp");

		} catch(SQLException ex) {
			ex.printStackTrace();
		}

	}
}
