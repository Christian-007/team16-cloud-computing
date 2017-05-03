import  java.io.*;
import  javax.servlet.*;
import  javax.servlet.http.*;
import  java.sql.*;

public  class  PayServlet  extends  HttpServlet {

    public  void  doPost(HttpServletRequest  req, HttpServletResponse  res) throws  ServletException,  IOException {  
        HttpSession session = req.getSession(true);    
        String dbDriver = "com.mysql.jdbc.Driver" ;
        String dbURL = "jdbc:mysql://localhost:3306/platform?useSSL=false";
        String dbUser = "root";
        String dbPassword = "sunardi";
        
        try {
            PreparedStatement pstmt1;
            Connection conn1;
            conn1 = (Connection) DriverManager.getConnection(dbURL, dbUser, dbPassword);

            Statement stmt1 = conn1.createStatement();
            String str1 = "select * from users WHERE id= '" + session.getAttribute("userID") + "'";
            ResultSet rset1 = stmt1.executeQuery(str1);

            if(rset1.next()){
                int current = rset1.getInt(7);
                if(current >= 100){
                    int newCredit = current - 100;
                    String sql =  "update users set credit='" + newCredit + "'WHERE id= '"+ session.getAttribute("userID")+"'";
                    pstmt1 = (PreparedStatement) conn1.prepareStatement(sql);
                    pstmt1.executeUpdate();
                    pstmt1.close();
                    conn1.close();
                    session.setAttribute("myPeanut", newCredit);
                    res.getWriter().write("true");
                }
                else{
                    res.getWriter().write("false");
                }
            }
        } catch (Exception e){
            e.printStackTrace();
            res.getWriter().write("false");
        }
    }

}