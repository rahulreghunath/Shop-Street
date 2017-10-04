<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
    
<%
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
   
 Statement st=c.createStatement();
 ResultSet crt=st.executeQuery("select * from temp_cart");
 int pr;
 int br;
 int qt;
 int blnc;
 while(crt.next())
 {
    pr=crt.getInt("product");
     br=crt.getInt("branch");
     qt=crt.getInt("quantity");
     
     Statement st3=c.createStatement();
     ResultSet ppr=st3.executeQuery("select * from tbl_products where id='"+pr+"'");
     if(ppr.first())
     {
     blnc=ppr.getInt("stock")-qt;
     int brst=ppr.getInt("branch_stock")+qt;
     Statement st1=c.createStatement();
     
     st1.executeUpdate("update tbl_products set stock='"+blnc+"',branch_stock='"+brst+"' where id='"+pr+"'");
     }
     
     Statement st4=c.createStatement();
     ResultSet pppr=st4.executeQuery("select * from branch_stock where branch_id='"+br+"' and product_id='"+pr+"'");
     if(pppr.next())
     {
         Statement st5=c.createStatement();
         int stk=pppr.getInt("stock")+qt;
         st5.executeUpdate("update branch_stock set stock='"+stk+"' where branch_id='"+br+"' and product_id='"+pr+"'");
     }
     else
    {
     Statement stb=c.createStatement();
stb.executeUpdate("insert into branch_stock values(NULL,'"+br+"','"+pr+"','"+qt+"')");
}
session.setAttribute("message","Branch Supplies added Successfully");
 }
 response.sendRedirect("branch_supplies.jsp");
 
 %>