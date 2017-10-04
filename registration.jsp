<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");
int lastid=0;
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
String fname=request.getParameter("firstname");
String lname=request.getParameter("lastname");
String address=request.getParameter("street_address");
String phone=request.getParameter("telephone");
String city=request.getParameter("city");
String state=request.getParameter("state");
String pin=request.getParameter("postcode");
String email=request.getParameter("email_address");
String password=request.getParameter("password");

String qry="insert into tbl_registration values(NULL,'"+fname+"','"+lname+"','"+address+"','"+phone+"','"+city+"','"+state+"','"+pin+"','"+email+"')";
 Statement rg=c.createStatement();
 
rg.executeUpdate(qry);
Statement st=c.createStatement();
ResultSet rp = st.executeQuery("select max(id) as last_id from tbl_registration");
if(rp.next())
{
lastid=rp.getInt("last_id");
}

Statement rg1=c.createStatement();

rg1.executeUpdate("insert into tbl_login values('"+email+"','"+lastid+"','"+password+"','3')");
session.setAttribute("user",lastid);
if(session.getAttribute("cart")!=null)
    {
       int amnt=0;
       int dsnt=0;
       
        Statement st1=c.createStatement();
    ResultSet cat=st1.executeQuery("select * from tbl_products where id='"+session.getAttribute("cart")+"'");
    if(cat.next())
    {
        amnt=cat.getInt("unit_price")*(Integer) session.getAttribute("qty");
        dsnt=cat.getInt("discount")*(Integer) session.getAttribute("qty");
    
    Statement st3=c.createStatement();
    ResultSet ct=st3.executeQuery("select * from tbl_cart where product_id='"+session.getAttribute("cart")+"' and user_id='"+session.getAttribute("user")+"'");
    if(!ct.next())
    {
    Statement st2=c.createStatement();
   st2.executeUpdate("insert into tbl_cart value(NULL,'"+session.getAttribute("user")+"','"+cat.getInt("id")+"','"+session.getAttribute("qty")+"','"+amnt+"','"+dsnt+"')");
    }
    }
      session.setAttribute("cart",null);
      session.setAttribute("qty",null);
       response.sendRedirect("view_cart.jsp");
    }
    else
    {
   response.sendRedirect("index.jsp");
    }
%>