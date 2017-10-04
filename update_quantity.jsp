<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String id=request.getParameter("id");
String qty=request.getParameter("qty");
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
Statement st3=c.createStatement();
st3.executeUpdate("delete from tbl_cart where product_id='"+id+"' and user_id='"+session.getAttribute("user")+"'");
Statement st1=c.createStatement();
ResultSet cat=st1.executeQuery("select * from tbl_products where id='"+id+"'");
int amnt=0;
int dsnt=0;
if(cat.next())
{
    amnt=cat.getInt("unit_price")*Integer.parseInt(qty);
    dsnt=cat.getInt("discount")*Integer.parseInt(qty);
    Statement st2=c.createStatement();
   st2.executeUpdate("insert into tbl_cart value(NULL,'"+session.getAttribute("user")+"','"+cat.getInt("id")+"','"+qty+"','"+amnt+"','"+dsnt+"')");
}
response.sendRedirect("view_cart.jsp");
%>