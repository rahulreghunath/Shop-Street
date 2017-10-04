<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String id=request.getParameter("id");
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
st.executeUpdate("delete from tbl_cart where id='"+id+"'");
 response.sendRedirect("view_cart.jsp");
 %>