<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");

String id=request.getParameter("id");
Statement st=c.createStatement();
ResultSet ord=st.executeQuery("select * from tbl_orders where order_id='"+id+"'");
int qt=0;
while(ord.next())
{
    Statement st0=c.createStatement();
   ResultSet prd1=st0.executeQuery("select * from branch_stock where product_id='"+ord.getInt("product_id")+"' and branch_id='"+session.getAttribute("branch")+"'");
    if(prd1.next())
    {
        qt=prd1.getInt("stock")-ord.getInt("quantity");
        Statement st2=c.createStatement();
        st2.executeUpdate("update branch_stock set stock='"+qt+"' where product_id='"+ord.getInt("product_id")+"' and branch_id='"+session.getAttribute("branch")+"'");
    }
}
Statement st3=c.createStatement();
st3.executeUpdate("update tbl_orders set status='1' where order_id='"+id+"'");
session.setAttribute("message","Order Successfully Completed!");
response.sendRedirect("orders.jsp");
%>