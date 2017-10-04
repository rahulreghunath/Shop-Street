<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
String id=request.getParameter("id");
 int qty=1;
 Statement st1=c.createStatement();
    ResultSet cat=st1.executeQuery("select * from tbl_products where id='"+id+"'");
    if(cat.next())
    {
        if((cat.getInt("stock")+cat.getInt("branch_stock"))==0)
       {
           response.sendRedirect("product.jsp?product="+id);
       }
    
if(request.getParameter("quantity")!=null)
    {
        qty=Integer.parseInt(request.getParameter("quantity"));
    }
if(session.getAttribute("user")!=null)
{
    int amnt=0;
    int dsnt=0;
    Statement st3=c.createStatement();
    ResultSet ct=st3.executeQuery("select * from tbl_cart where product_id='"+id+"' and user_id='"+session.getAttribute("user")+"'");
    if(!ct.next())
    { 
        amnt=cat.getInt("unit_price")*qty;
        dsnt=cat.getInt("discount")*qty;
      out.print(cat.getString("name"));
    Statement st2=c.createStatement();
   st2.executeUpdate("insert into tbl_cart values(NULL,'"+session.getAttribute("user")+"','"+cat.getInt("id")+"','"+qty+"','"+amnt+"','"+dsnt+"')");
    }
    response.sendRedirect("view_cart.jsp");
}
else
{
session.setAttribute("cart",id);
session.setAttribute("qty",qty);
response.sendRedirect("login.jsp");
}
}
%>