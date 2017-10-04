<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String name=request.getParameter("name");
int status;

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 status=st.executeUpdate("insert into tbl_product_category value(NULL,'"+name+"')");
if(status==1)
{
    session.setAttribute("message","Product Category Added Successfully");
}
else
{
    session.setAttribute("message","Product Category not added");
}
response.sendRedirect("add_product_category.jsp");
%>