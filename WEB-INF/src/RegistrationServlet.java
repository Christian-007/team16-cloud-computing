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
		int defaultPeanut = 1000; // Give a reward of 1000 Peanuts for signing up
		res.setContentType("text/html");
		PrintWriter  out  =   res.getWriter();
		try (
			Connection conn = DriverManager.getConnection(
               "jdbc:mysql://localhost:3306/platform?useSSL=false", "root", "sunardi");
			Statement stmt = conn.createStatement();
		) {
			// INSERT a record
			String sqlInsert = "insert into users (fname,lname,email,phone,password, credit) values ('" + fname + "', '" + lname + "', '" + email + "', '" + phone + "', '" + password  + "', '" + defaultPeanut + "')";
			System.out.println("The SQL query is: " + sqlInsert);  // Echo for debugging
			int countInserted = stmt.executeUpdate(sqlInsert);
			System.out.println(countInserted + " records inserted.\n");

			// SELECT the inserted record to get the ID
			ResultSet rs;
			rs = stmt.executeQuery("select * from users where email='" + email + "' and password='" + password + "'");
			if (rs.next()) {
            	// Set session attribute
			    int userID = rs.getInt("id");
				HttpSession session = req.getSession(true);	    
				session.setAttribute("currentUser", email);
				session.setAttribute("userID", userID);
				session.setAttribute("myPeanut", defaultPeanut);
				res.sendRedirect("index.jsp");

				res.getWriter().write("true"); // set validation message for jquery ajax
				// Redirect user if it's successful and send session attribute to index.jsp
				
				
				// use this when not using jquery ajax
				// res.sendRedirect("index.jsp");
			} else {
				// Set validation message for jquery ajax
			    res.getWriter().write("false");
			}
	 
		} catch(SQLException ex) {
			ex.printStackTrace();
		}

		// Redirect to a success page.
		// res.sendRedirect("success.jsp");
	}
}
