<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>

<%

String product=request.getParameter("product");

Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root","");
Statement st1=c.createStatement();
Statement st=c.createStatement();
ResultSet prd=st.executeQuery("select * from tbl_products where id='"+product+"'");
if(prd.next())
{
    %>
        <div class="panel panel-default">
  <div class="panel-body">
      <div style="text-align:center;padding-bottom:20px">
         PRODUCT NAME : <strong> <% out.print(prd.getString("name"));%></strong><br>
        PRODUCT ID :<strong> <% out.print(prd.getString("product_id"));%></strong>
        </div>
        <table class="table table-bordered table-hover" >
            <th>Sl.no</th> 
            <th>Branch name</th>
            <th>Regno</th>
            <th>Stock</th>
    <%
    ResultSet stk=st1.executeQuery("select * from branch_stock where product_id='"+product+"'");
    int i=1;
    if(stk.next())
     {
        stk.beforeFirst();
        while(stk.next())
        {
            Statement st3=c.createStatement();
            ResultSet brc=st3.executeQuery("select * from tbl_branch where b_id='"+stk.getInt("branch_id")+"'");
            if(brc.next())
            {
        
                %>
                <tr>
                    <td>
                        <% out.print(i); i++;%>
                    </td>
                    <td>
                        <% out.print(brc.getString("b_name"));%>
                    </td>
                    <td>
                        <% out.print(brc.getString("b_regno"));%>
                    </td>
                    <td>
                        <% out.print(stk.getInt("stock"));%>
                    </td>
                </tr>
                <%
            }
        }
    }
    else
    {
        %>
            <tr>
            <td colspan="4">
            Not Supplied to or no Stock in any Branch
            </td>
            <tr>
            <%
    }
}
%>
    </table>
    </div>
    </div>