import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

public  class  RegistrationServlet  extends  HttpServlet {
	public  void  doGet(HttpServletRequest  req, HttpServletResponse  res) throws  ServletException,  IOException {
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");
		try (
			Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
			Statement stmt = conn.createStatement();
		) {
			// INSERT a record
			String sqlInsert = "insert into users (fname,lname,email,phone,password) values ('" + fname + "', '" + lname + "', '" + email + "', '" + phone + "', '" + password + "')";
			System.out.println("The SQL query is: " + sqlInsert);  // Echo for debugging
			int countInserted = stmt.executeUpdate(sqlInsert);
			System.out.println(countInserted + " records inserted.\n");
	 
		} catch(SQLException ex) {
			ex.printStackTrace();
		}
	}

	public  void  doPost(HttpServletRequest  req, HttpServletResponse  res) throws  ServletException,  IOException {
		String fname = req.getParameter("fname");
		String lname = req.getParameter("lname");
		String email = req.getParameter("email");
		String phone = req.getParameter("phone");
		String password = req.getParameter("password");
		res.setContentType("text/html");
		PrintWriter  out  =   res.getWriter();
		try (
			Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
			Statement stmt = conn.createStatement();
		) {
			// INSERT a record
			String sqlInsert = "insert into users (fname,lname,email,phone,password) values ('" + fname + "', '" + lname + "', '" + email + "', '" + phone + "', '" + password + "')";
			System.out.println("The SQL query is: " + sqlInsert);  // Echo for debugging
			int countInserted = stmt.executeUpdate(sqlInsert);
			System.out.println(countInserted + " records inserted.\n");

			HttpSession session = req.getSession(true);	    
			session.setAttribute("currentUser", email); 
			res.sendRedirect("index.jsp");

			// out.println("<html><body>");
			// out.println("Successfully registered!");
			// out.println("</body></html>");
	 
		} catch(SQLException ex) {
			ex.printStackTrace();
		}

		// Redirect to a success page.
		// res.sendRedirect("success.jsp");
	}
}
