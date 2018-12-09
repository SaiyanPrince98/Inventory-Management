<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <%@ page import ="java.sql.*" %>
        <%@ page import ="javax.sql.*" %>
        <%
            String username=request.getParameter("usernamesignup");
            String email=request.getParameter("emailsignup");
            String password=request.getParameter("passwordsignup");
            String c_password=request.getParameter("passwordsignup_confirm");
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");
            if(password.equals(c_password))
            {
            CallableStatement calstat=con.prepareCall("{call new_procedure(?,?,?)}");
            calstat.setString(1,username);
            calstat.setString(2,email);
            calstat.setString(3,password);
            ResultSet rs = calstat.executeQuery();
            con.close();
            calstat.close();
            response.sendRedirect("index.html");
            //out.println("Your data has been inserted into table.");
            }
            else 
            {
                
            }
        %>
    </body>
</html>