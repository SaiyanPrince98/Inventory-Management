<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@ page import ="java.sql.*"%>
        <%@ page import ="javax.sql.*"%>
        <%
            try{
            String username=request.getParameter("usr");
            String password=request.getParameter("pwd");
           
            
                 Class.forName("com.mysql.jdbc.Driver").newInstance();
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");
                
                String Query="select * from ims_signup where usernamesignup=? and passwordsignup=?";
                PreparedStatement psm=con.prepareStatement(Query);
                psm.setString(1,username);
                psm.setString(2,password);
                ResultSet rs=psm.executeQuery();
                if(rs.next())
                    response.sendRedirect("copySecond.jsp");
                else
                    out.println("Login failed!");
            }catch(Exception e){
                out.println(e);
            }
            
        %>
    </body>
</html>