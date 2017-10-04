<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String username=request.getParameter("username");
String password=request.getParameter("password");

int status;

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 ResultSet log=st.executeQuery("select * from tbl_login where username='"+username+"' and password='"+password+"' and usertype='2'");
if(log.next())
{
   session.setAttribute("branch",log.getInt("user_id"));
   response.sendRedirect("index.jsp");
}
else
{
    session.setAttribute("error","Login Failed");
    response.sendRedirect("../index.jsp");
}
%>