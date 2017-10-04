<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>
<%@ page import="java.util.*"%>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
int qty=0;
String product=request.getParameter("product");
String qnty=request.getParameter("qnty");
  qty=Integer.parseInt(request.getParameter("qnty"));
    Statement st4=c.createStatement();
     ResultSet pr=st4.executeQuery("select * from tbl_products where id='"+product+"'");
     if(pr.first())
     {
     
     int vv=pr.getInt("stock");
     if(vv<qty)
     {
     out.print("Not sufficient quantity available, (" +pr.getInt("stock")+" available )");
     }
     }
     %>