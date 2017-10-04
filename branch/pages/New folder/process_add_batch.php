<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String name=request.getParameter("name");
String regno=request.getParameter("regno");
String address=request.getParameter("address");
String place=request.getParameter("place");
String state=request.getParameter("state");
String pin=request.getParameter("pin");
String username=request.getParameter("username");
String password=request.getParameter("password");

int status;

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 status=st.executeUpdate("insert into tbl_branch
value(NULL,'"+name+"','"+regno+"','"+address+"','"+place+"','"+state+"','"+pin+"')");
if(status==1)
{
    session.setAttribute("message","Branch Added Successfully");
}
else
{
    session.setAttribute("message","Branch not added");
}
response.sendRedirect("add_product.jsp");
%>