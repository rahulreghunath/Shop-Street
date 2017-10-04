<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String username=request.getParameter("email_address");
String password=request.getParameter("password");

int status;

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
 Statement st=c.createStatement();
 ResultSet log=st.executeQuery("select * from tbl_login where username='"+username+"' and password='"+password+"' and usertype='3'");
if(log.next())
{
   session.setAttribute("user",log.getInt("user_id"));
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
}
else
{
    session.setAttribute("error","Login Failed");
    response.sendRedirect("login.jsp");
}
%>