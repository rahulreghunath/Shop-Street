<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String branch=request.getParameter("branch");
String sem=request.getParameter("sem");
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 ResultSet mid=st.executeQuery("select * from students where branch='"+branch+"' and semester='"+sem+"'");
 
 while(mid.next())
 {
     %>
     <option value="<% out.print(mid.getInt("sl")); %>"><% out.print(mid.getStringnt("name")); %></option>
     <%
 }
%>    