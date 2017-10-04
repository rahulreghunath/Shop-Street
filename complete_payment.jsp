<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<% Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root",""); 
Random no=new Random(); int num=no.nextInt(9000)+10000;
String oid="ORD"+String.valueOf(num);  
if(request.getParameter("otp").equals("123456"))
{
  int amt,st,qtt=1,bs,hs,stock,bstock,a,b;
   Statement st3=c.createStatement();
    ResultSet ct=st3.executeQuery("select * from tbl_cart where user_id='"+session.getAttribute("user")+"'");
    while(ct.next())
    {
        Statement st4=c.createStatement();
        ResultSet brs=st4.executeQuery("select * from branch_stock where branch_id='"+request.getParameter("branch")+"' and product_id='"+ct.getInt("product_id")+"'");
        if(brs.next())
        {
            Statement st6=c.createStatement();
            ResultSet prd=st6.executeQuery("select * from tbl_products where id='"+ct.getInt("product_id")+"'");
            if(prd.next())
            {
                if(brs.getInt("stock")>ct.getInt("quantity"))
                {
                    qtt=prd.getInt("branch_stock")-ct.getInt("quantity");
                    Statement st5=c.createStatement();
                    st5.executeUpdate("update tbl_products set branch_stock='"+qtt+"' where id='"+ct.getInt("product_id")+"'");
                }
                else
                {
                    hs=ct.getInt("quantity")-brs.getInt("stock");
                    bs=ct.getInt("quantity")-hs; 
                    stock=prd.getInt("stock")-hs;
                    bstock=prd.getInt("branch_stock")-bs;
                    Statement st7=c.createStatement();
                    st7.executeUpdate("update tbl_products set branch_stock='"+bstock+"',stock='"+stock+"' where id='"+ct.getInt("product_id")+"'");
                }
            }
            
        }
       amt=ct.getInt("amount")-ct.getInt("discount");
        Statement st2=c.createStatement();
        st2.executeUpdate("insert into tbl_orders values(NULL,'"+oid+"','"+request.getParameter("branch")+"','"+ct.getInt("product_id")+"','"+session.getAttribute("user")+"','"+ct.getInt("quantity")+"','"+amt+"','0',CURDATE())");
    }
    session.setAttribute("success",oid);
    Statement st9=c.createStatement();
st9.executeUpdate("delete from tbl_cart where user_id='"+session.getAttribute("user")+"'");
}
%>
<body><table align='center'><tr><td><STRONG>Transaction is being processed,</STRONG></td></tr><tr><td><font color='blue'>Please wait <i class="fa fa-spinner fa-pulse fa-fw"></i>
<span class="sr-only"></font></td></tr><tr><td>(Please do not press 'Refresh' or 'Back' button )</td></tr></table><h2>
<script>
    setTimeout(function(){ window.location="complete_order.jsp"; }, 5000);
</script>