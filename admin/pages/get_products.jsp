<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String category=request.getParameter("category");

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 ResultSet mid=st.executeQuery("select * from tbl_products where category_id='"+category+"'");
 if(mid.next())
 {
 mid.beforeFirst();
 %>
 <option value="0">Select Product</option>
 
<%
 while(mid.next())
 {
     %>
     <option value="<% out.print(mid.getInt("id")); %>"><% out.print(mid.getString("name")+" [ "+mid.getString("product_id")+" ]"); %></option>
     <%
 }
 }
 else
 {
  %>
  <option selected disabled>No products in this category</option>
  <%
 }
%>    