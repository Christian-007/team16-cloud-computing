import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

public  class  LoginServlet  extends  HttpServlet {

	public  void  doPost(HttpServletRequest  req, HttpServletResponse  res) throws  ServletException,  IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		res.setContentType("text/html");
		PrintWriter  out  =   res.getWriter();
		out.println("<html><body>");
		out.println("<p>" + email + "</p>");
		out.println("<p>" + password + "</p>");
		out.println("</body></html>");

		try {
			Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
			Statement stmt = conn.createStatement();
			ResultSet rs;
			rs = stmt.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
			if (rs.next()) {
			    
			    //out.println("welcome " + userid);
			    //out.println("<a href='logout.jsp'>Log out</a>");
			    HttpSession session = req.getSession(true);	    
				session.setAttribute("currentUser", email); 
				res.sendRedirect("index.jsp");
			} else {
			    out.println("Invalid password <a href='login.jsp'>try again</a>");
			}
		} catch(SQLException ex) {
			ex.printStackTrace();
		}

		// Redirect to a success page.
		// res.sendRedirect("success.jsp");
	}
}
