<html>
    <head>
        <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
String id = request.getParameter("userId");
String driverName = "com.mysql.jdbc.Driver";
String connectionUrl = "jdbc:mysql://localhost:3306/";
String dbName = "inventory";
String userId = "root";
String password = "root";

try {
Class.forName(driverName);
} catch (ClassNotFoundException e) {
e.printStackTrace();
}

Connection connection = null;
Statement statement = null;
ResultSet resultSet = null;
%>
        <title> Box Slide Hover Effects</title>
        <link rel="stylesheet" type="text/css" href="Styles2.css">
        <style>
            td,th{
                border: 1px solid white;
            }
            

            
            
            
            table{
width:800px;
margin:auto;
text-align: center;
table-layout: fixed;
            }
            table, tr,th,td{
                padding: 20px;
                color: white;
                border: 0.05px solid #080808;
                border-collapse: collapse;
                font-size:18px;
            }
            td:hover{
                background: grey;
            }
        </style>
    </head>
    <body>
        <ul>
            <li>
            <div class="content" style="overflow:scroll;">
                <h2>AVAILABLE STOCK</h2>
               
                <div>
                
                <table style="border:1px solid #000000;color:#FFF;">
                  
                    <tr>
                        <th>ItemId</th>
                        <th>Item Name</th>
                       
                    </tr>
                    <%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");
statement=connection.createStatement();
String sql ="SELECT * FROM item";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#000000">

<td><%=resultSet.getString("itemid") %></td>
<td><%=resultSet.getString("name") %></td>



</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>

                </table>
                </div>
            </div>    
            </li>
            <li>
                <div class="content" style="overflow:scroll;">
                    <h2>PRICES</h2>
                    <table style="border:1px solid #000000;color:#FFF;">
                            <tr>
                                <th>ItemID</th>
                                <th>Price</th>
                                
                            </tr>
                           <%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");
statement=connection.createStatement();
String sql ="SELECT * FROM price";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#000000">

<td><%=resultSet.getString("itemid") %></td>
<td><%=resultSet.getString("individual_price") %></td>



</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
                        </table>
                </div>    
            </li>
            <li>
                <div class="content" style=" overflow: scroll;">
                    <h2>STOCK</h2>
                    <p>
                    </p>
                    <table style="border:1px solid #000000;color:#FFF;">
                            <tr>
                                <th>ItemId</th>
                                <th>Quantity</th>
                                
                            </tr>
                           <%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");
statement=connection.createStatement();
String sql ="SELECT * FROM stock";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#000000">

<td><%=resultSet.getString("itemid") %></td>
<td><%=resultSet.getString("quantity") %></td>



</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
                        </table>
                </div>    
            </li>
            <li>
                <div class="content"  style="overflow:scroll;">
                    <h2>ITEM HISTORY</h2>
                    <p>
                    </p>
                    <table style="border:1px solid #000000;color:#FFF;">
                            <tr>
                                <th>ItemId</th>
                                <th>Item Name</th>
                                <th>Phone</th>
                            </tr>
                            <%
try{ 
connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/inventory?autoReconnect=true&useSSL=false","root","root");

statement=connection.createStatement();
String sql ="SELECT * FROM supplier";

resultSet = statement.executeQuery(sql);
while(resultSet.next()){
%>
<tr bgcolor="#000000">

<td><%=resultSet.getString("itemid") %></td>
<td><%=resultSet.getString("suppliername") %></td>
<td><%=resultSet.getString("contact") %></td>


</tr>

<% 
}

} catch (Exception e) {
e.printStackTrace();
}
%>
</table>
                        </table>
                </div>    
            </li>
            <li>
                    <form  action="InsertValuesServlet" method="POST">
                <div class="content">
                    <h2>Adding stuff</h2>
                    <table class="table">
                    <tr>
                        <td><label for="ItemID">ItemID </label></td>
                        <td><input type="text" id="ItemID" name="ItemID"></td>
                    </tr>  
                    <tr>
                        <td><label for="ItemName">Item Name</label></td>
                        <td><input type="text" id="ItemName" name="ItemName"></td>
                    </tr>  
                    <tr>
                        <td><label for="ItemPrice">Item Price</label></td>
                        <td><input type="text" id="ItemPrice" name="ItemPrice"></td>
                    </tr>
                    <tr>
                        <td><label for="SupplierName">Supplier Name</label></td>
                        <td><input type="text" id="SupplierName" name="SupplierName" ></td>
                    </tr>
                    <tr>
                        <td><label for="SupplierContact">Supplier Contact</label></td>
                        <td><input type="text" id="SupplierContact" name="SupplierContact" ></td>
                    </tr>        
                    <tr>
                        <td><label for="Quantity">Quantity</label></td>
                        <td><input type="text" id="Quantity" name="Quantity" ></td>
                    </tr>
                    </table> 
                    <input type="submit" id="Quantity" name="Quantity" ><br><br><br>
                        <a href="Tarun.html">Creator Details</a>
                </div>   
                </form>
            </li>
        </ul>
    </body>
</html>