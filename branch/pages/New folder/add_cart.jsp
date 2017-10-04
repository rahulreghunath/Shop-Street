<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String branch=request.getParameter("branch");
String product=request.getParameter("product");
String qnty=request.getParameter("qnty");

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");


Statement st1=c.createStatement();
 st1.executeUpdate("insert into temp_cart value(NULL,'"+branch+"','"+product+"','"+qnty+"')");

 Statement st=c.createStatement();
 ResultSet mid=st.executeQuery("select * from temp_cart");
 
 Statement stb=c.createStatement();
 ResultSet brn=stb.executeQuery("select * from tbl_branch where b_id='"+branch+"'");
 
 int i=1;
 %>
 <div style="font-size:23px;font-weight:bold;padding-bottom:15px">
 <%
if(brn.next())
 {
    out.print("Branch Name : ");
     out.print(brn.getString("b_name"));
 } 
 %>
     </div>

 <table class="table table-bordered ">
     <th>Sl.no</th>
     <th>Product Name</th>
     <th>Quantity</th>
     <th>Unit Price</th>
     <th>Sub Total</th>
     <th></th>
<%
int r;
int grand=0;
 while(mid.next())
 {
    Statement st2=c.createStatement();
    r=mid.getInt("product");
     ResultSet prd=st2.executeQuery("select * from tbl_products where id='"+r+"'");
     if(prd.next())
     {
     grand=grand+prd.getInt("unit_price")*mid.getInt("quantity");
     %>
     <tr>
         <td><% out.print(i); %></td>
         <td><% out.print(prd.getString("name")); %></td>
         <td><% out.print(mid.getInt("quantity")); %></td>
         <td><% out.print(prd.getInt("unit_price")); %></td>
          <td><% out.print(prd.getInt("unit_price")*mid.getInt("quantity")); %></td>
          <td class="text-center"><i style="cursor:pointer" id="remove" data-id="<% out.print(mid.getInt("id")); %>" class="fa fa-times-circle fa-2x" title="Remove from cart" aria-hidden="true"></i></td>
         </tr>
     <%
     i++;
     }
 }
%> 
        <td class="text-center" style="font-size:18px;font-weight:bold" colspan="6">Grand Total Rs <u><% out.print(grand); %></u>/- Only</td>
         </table>   
         <div class="col-md-6" style="padding-left:0px">    
             <a href="complete_supply.jsp"><button type="button" class="btn btn-info" style="width:100%">Proceed</button></a>
         </div>
         <div class="col-md-6" style="padding-right:0px">    
             <a href="branch_supplies.jsp"><button type="button" class="btn btn-info" style="width:100%">Clear</button></a>
         </div>