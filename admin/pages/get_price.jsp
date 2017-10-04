<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String product=request.getParameter("product");
String type=request.getParameter("type");
Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
Statement st=c.createStatement();
    ResultSet mid=st.executeQuery("select * from tbl_products where id='"+product+"'");
    if(mid.next())
     {
        if(Integer.parseInt(type)==1)
        {  
                out.print(mid.getInt("unit_price"));
        }
        if(Integer.parseInt(type)==2)
        {  
                out.print(mid.getInt("discount"));
        }
        
        if(Integer.parseInt(type)==3)
        {  
                out.print(mid.getInt("stock"));
        }
    }


%>