<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
int qty;

Statement st5=c.createStatement();
ResultSet ord=st5.executeQuery("select * from tbl_orders where id='"+id+"'");
if(ord.next())
{
    Statement st6=c.createStatement();
    ResultSet prd=st6.executeQuery("select * from tbl_products where id='"+ord.getInt("product_id")+"'");
    if(prd.next())
    {
        Statement st1=c.createStatement();
        qty=prd.getInt("branch_stock")+ord.getInt("quantity");
        st1.executeUpdate("update tbl_products set branch_stock='"+qty+"'");
    }
}
Statement st=c.createStatement();
st.executeUpdate("delete from tbl_orders where id='"+id+"'");
session.setAttribute("error","Your Order Cancelled Successfully");
response.sendRedirect("profile.jsp");
 %>