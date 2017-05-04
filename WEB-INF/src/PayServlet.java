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
        int appUserID = Integer.parseInt(req.getParameter("appUserID"));
        int userID = (Integer) session.getAttribute("userID");

        try {
            PreparedStatement pstmt1; PreparedStatement pstmt2;
            PreparedStatement pstmt3; PreparedStatement pstmt4;
            PreparedStatement pstmt5; PreparedStatement pstmt6;

            Connection conn1;
            conn1 = (Connection) DriverManager.getConnection(dbURL, dbUser, dbPassword);
            Statement stmt1 = conn1.createStatement(); Statement stmt2 = conn1.createStatement();
            Statement stmt3 = conn1.createStatement(); Statement stmt4 = conn1.createStatement();
            Statement stmt5 = conn1.createStatement(); Statement stmt6 = conn1.createStatement();
            Statement stmt7 = conn1.createStatement();

            String str1 = "select * from users WHERE id= '" + userID + "'";
            String str2 = "select * from users WHERE lname= 'Lio'";
            String str3 = "select * from users WHERE lname= 'Melleng'";
            String str4 = "select * from users WHERE lname= 'Yang'";
            String str5 = "select * from users WHERE lname= 'Another'";
            String str6= "select * from users WHERE id='" + appUserID + "'";

            ResultSet rset1 = stmt1.executeQuery(str1);
            ResultSet rset2 = stmt2.executeQuery(str2);
            ResultSet rset3 = stmt3.executeQuery(str3);
            ResultSet rset4 = stmt4.executeQuery(str4);
            ResultSet rset5 = stmt5.executeQuery(str5);
            ResultSet rset6 = stmt7.executeQuery(str6);

            String sqlApp = "select * from applications where user_id='"+ appUserID +"'";
            ResultSet rsetApp = stmt6.executeQuery(sqlApp);
            if(rsetApp.next() && rset1.next() && rset2.next() && rset3.next() && rset4.next() && rset5.next() && rset6.next()){
                
                if(session.getAttribute("userID").equals(rsetApp.getInt(6)) || session.getAttribute("userID").equals(rset2.getInt(1))||session.getAttribute("userID").equals(rset3.getInt(1))||session.getAttribute("userID").equals(rset4.getInt(1))||session.getAttribute("userID").equals(rset5.getInt(1))){
                    res.getWriter().write("true");
                }else {

                    int current = rset1.getInt(7);
                    int current2 = rset2.getInt(7);
                    int current3 = rset3.getInt(7);
                    int current4 = rset4.getInt(7);
                    int current5 = rset5.getInt(7);
                    int current6 = rset6.getInt(7);

                    if(current >= 100){
                        int newCredit = current - 100;
                        int newCredit2 = current2 + 25;
                        int newCredit3 = current3 + 25;
                        int newCredit4 = current4 + 25;
                        int newCredit5 = current5 + 25;
                        int newCredit6 = current6 + 25;

                        String sql =  "update users set credit='" + newCredit + "' WHERE id= '" + userID +"'";
                        String sql2 =  "update users set credit='" + newCredit2 + "'WHERE lname='Lio'";
                        String sql3 =  "update users set credit='" + newCredit3 + "'WHERE lname='Melleng'";
                        String sql4 =  "update users set credit='" + newCredit4 + "'WHERE lname= 'Yang'";
                        String sql5 =  "update users set credit='" + newCredit5 + "'WHERE lname= 'Another'";
                        String sql6 =  "update users set credit='" + newCredit6 + "'WHERE id='" + appUserID + "'";

                        pstmt1 = (PreparedStatement) conn1.prepareStatement(sql);
                        pstmt2 = (PreparedStatement) conn1.prepareStatement(sql2);
                        pstmt3 = (PreparedStatement) conn1.prepareStatement(sql3);
                        pstmt4 = (PreparedStatement) conn1.prepareStatement(sql4);
                        pstmt5 = (PreparedStatement) conn1.prepareStatement(sql5);
                        pstmt6 = (PreparedStatement) conn1.prepareStatement(sql6);

                        pstmt1.executeUpdate();
                        pstmt1.close();
                        pstmt2.executeUpdate();
                        pstmt2.close();
                        pstmt3.executeUpdate();
                        pstmt3.close();
                        pstmt4.executeUpdate();
                        pstmt4.close();
                        pstmt5.executeUpdate();
                        pstmt5.close();
                        pstmt6.executeUpdate();
                        pstmt6.close();

                        conn1.close();
                        session.setAttribute("myPeanut", newCredit);
                        res.getWriter().write("true");
                    }else {
                        res.getWriter().write("false");
                    }
                }
            }
        } catch (Exception e){
            e.printStackTrace();
            res.getWriter().write("exception");
        }
        
    }

}