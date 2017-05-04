import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

/**
 * Created by Spencer on 2017/5/1.
 */

public class ChangePasswordServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	// Get all of the submitted fields and current user ID
    	HttpSession session = request.getSession(true);	    
    	int userID = (Integer) session.getAttribute("userID");
    	String oldPassword = request.getParameter("oldPassword");
    	String newPassword = request.getParameter("newPassword");

    	if(oldPassword.isEmpty() || newPassword.isEmpty()){
    		response.getWriter().write("empty");
    	}else {
    		try {
	            PreparedStatement pstmt1;
	            String dbDriver = "com.mysql.jdbc.Driver" ;
	            String dbURL = "jdbc:mysql://localhost:3306/platform?useSSL=false" ;
	            String dbUser = "root" ;
	            String dbPassword = "sunardi" ;
	            Connection conn;
	            conn = (Connection) DriverManager.getConnection(dbURL, dbUser, dbPassword);

	            String sql1= "SELECT * from users WHERE id='" + userID + "'";
	            Statement statement = conn.createStatement();
	            ResultSet rs1 = statement.executeQuery(sql1);
	            
	            if(rs1.next()){
	            	String password = rs1.getString("password");

	            	// Check if the inputted old password is correct
	            	if(password.equals(oldPassword)) {
	            		String sql2 =  "update users set password='" + newPassword + "' where id='" + userID + "'";
			            pstmt1 = (PreparedStatement) conn.prepareStatement(sql2);
			            pstmt1.executeUpdate();
			            pstmt1.close();
			            conn.close();

			            response.getWriter().write("true");
	            	}else {
	            		response.getWriter().write("false");
	            	}
		        }

	    	}catch (Exception e){
	        	e.printStackTrace();
	    	}
    	}
		
		
    	
    }

}
