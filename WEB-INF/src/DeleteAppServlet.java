import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

/**
 * Created by Spencer on 2017/5/1.
 */

public class DeleteAppServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(true);     
        int appUserID = Integer.parseInt(request.getParameter("appUserID"));
        // int topupCredit = Integer.parseInt(request.getParameter("topupAmount"));
       
        try {
            PreparedStatement pstmt1;
            String dbDriver = "com.mysql.jdbc.Driver" ;
            String dbURL = "jdbc:mysql://localhost:3306/platform?useSSL=false" ;
            String dbUser = "root" ;
            String dbPassword = "sunardi" ;
            Connection conn;
            conn = (Connection) DriverManager.getConnection(dbURL, dbUser, dbPassword);

            String sql1= "DELETE from applications WHERE user_id='" + appUserID + "'";
            pstmt1 = (PreparedStatement) conn.prepareStatement(sql1);
            pstmt1.executeUpdate();
            pstmt1.close();
            conn.close();
            
            response.getWriter().write("true");

        }catch (Exception e){
            e.printStackTrace();
            response.getWriter().write("Exception");
        }

    }

}
