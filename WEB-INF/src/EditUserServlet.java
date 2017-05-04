import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

/**
 * Created by Spencer on 2017/5/1.
 */

public class EditUserServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	// Email validation regex
    	String EMAIL_REGEX = "^[\\w-_\\.+]*[\\w-_\\.]\\@([\\w]+\\.)+[\\w]+[\\w]$";

    	// Get all of the submitted fields and current user ID
    	HttpSession session = request.getSession(true);	    
    	int userID = (Integer) session.getAttribute("userID");
    	String email = request.getParameter("email");
		String lname = request.getParameter("lname");
		String fname = request.getParameter("fname");
		String phone = request.getParameter("phone");

		if(email.isEmpty() || email.matches(EMAIL_REGEX)==false || fname.isEmpty() || lname.isEmpty() || phone.isEmpty() ){
			response.getWriter().write("false");
		}else {
			try {
	            PreparedStatement pstmt1;
	            String dbDriver = "com.mysql.jdbc.Driver" ;
	            String dbURL = "jdbc:mysql://localhost:3306/platform?useSSL=false" ;
	            String dbUser = "root" ;
	            String dbPassword = "sunardi" ;
	            Connection conn;
	            conn = (Connection) DriverManager.getConnection(dbURL, dbUser, dbPassword);

	            String sql =  "update users set email='" + email + "', fname='" + fname + "', lname='" + lname + "', phone='" + phone + "' where id='" + userID + "'";
	            pstmt1 = (PreparedStatement) conn.prepareStatement(sql);
	            pstmt1.executeUpdate();
	            pstmt1.close();
	            conn.close();
	            session.setAttribute("currentUser", email);
	            response.getWriter().write("true");

	    	}catch (Exception e){
	        	e.printStackTrace();
	    	}
		}
    	
    }

}
