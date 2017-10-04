<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String product=request.getParameter("product");
String type=request.getParameter("type");
String stock=request.getParameter("stock");

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");

Statement st1=c.createStatement();
ResultSet prd=st1.executeQuery("select * from tbl_products where id='"+product+"'");
if(prd.next())
 {
    Statement st=c.createStatement();

    if(Integer.parseInt(type)==1)
    { 
        String price=request.getParameter("price");
        String disc=request.getParameter("discount");
        int stk=prd.getInt("stock")+Integer.parseInt(stock);
        st.executeUpdate("update tbl_products set stock='"+stk+"',unit_price='"+price+"',discount='"+disc+"' where id='"+product+"'");
    }
    if(Integer.parseInt(type)==0)
    { 
        int stk=prd.getInt("stock")-Integer.parseInt(stock);
        st.executeUpdate("update tbl_products set stock='"+stk+"' where id='"+product+"'");
    }
}
session.setAttribute("message","Product Stock Updated");
response.sendRedirect("update_stock.jsp");
%>