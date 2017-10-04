<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String id=request.getParameter("id");

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");

Statement st5=c.createStatement();
ResultSet ord=st5.executeQuery("select * from tbl_orders where id='"+id+"'");
if(ord.next())
{

    Statement st1=c.createStatement();
    ResultSet prd=st1.executeQuery("select * from tbl_products where id='"+ord.getInt("product_id")+"'");
    if(prd.next())
     {
        Statement st=c.createStatement();
 
            int stk=prd.getInt("branch_stock")+ord.getInt("quantity");
            out.print("update tbl_products set branch_stock='"+stk+"' where id='"+ord.getInt("product_id")+"'");
            st.executeUpdate("update tbl_products set branch_stock='"+stk+"' where id='"+ord.getInt("product_id")+"'");
    }
}
Statement st7=c.createStatement();
st7.executeUpdate("delete from tbl_orders where id='"+id+"'");
session.setAttribute("message","Order Cancalled!");
response.sendRedirect("orders.jsp");
%>