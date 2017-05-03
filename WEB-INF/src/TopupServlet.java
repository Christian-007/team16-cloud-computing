import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

/**
 * Created by Spencer on 2017/5/1.
 */

public class TopupServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession(true);	    
    	int userID = (Integer) session.getAttribute("userID");
    	int topupCredit = Integer.parseInt(request.getParameter("topupAmount"));

    	if(topupCredit < 1) {
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

	            String sql1= "SELECT * from users WHERE id='" + userID + "'";
	            Statement statement = conn.createStatement();
	            ResultSet rs1 = statement.executeQuery(sql1);
	            
	            if(rs1.next()){
	                int currentCredit = rs1.getInt(7);
	                int newCredit = topupCredit + currentCredit;
	                String sql =  "update users set credit='" + newCredit + "' where id='" + userID + "'";
	                pstmt1 = (PreparedStatement) conn.prepareStatement(sql);
	                pstmt1.executeUpdate();
	                pstmt1.close();
	                conn.close();
	                session.setAttribute("myPeanut", newCredit);
	                response.getWriter().write("true");
	            }
        	}catch (Exception e){
            	e.printStackTrace();
        	}
    	}
    }

}
