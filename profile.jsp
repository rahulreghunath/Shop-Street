<%@ include file="header.jsp" %>
	<!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a href="index.jsp" class="home"></a>
 <span> My Account</span>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
      col-sm-9        left_column      col-sm-12 ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 with_col ">
                    <div class="centerColumn" id="accountDefault">

<div class="heading"><h1>My Account Information</h1></div>
<br class="clearBoth" />
<%@ include file="admin/pages/msgbox.jsp" %>
<% Statement st3=c.createStatement();
    ResultSet ct=st3.executeQuery("select * from tbl_orders where user_id='"+session.getAttribute("user")+"'");
    if(ct.next())
    { ct.beforeFirst();
    %>
<table class="table table-bordered" width="100%" border="0" cellpadding="0" cellspacing="0" id="prevOrders">
<caption><h2>Previous Orders</h2></caption>
    <tr class="tableHeading">
    <th scope="col">Order ID</th>
    <th scope="col">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</th>
    <th scope="col">Product Name</th>
    <th scope="col">Quantity</th>
    <th scope="col">Status</th>
    <th scope="col">Total</th>
  </tr>
  <% while(ct.next())
  { 
  Statement st4=c.createStatement();
    ResultSet prd=st4.executeQuery("select * from tbl_products where id='"+ct.getInt("product_id")+"'");
         if(prd.next())
         {  %>
  <tr>
    <td width="70px"><% out.print(ct.getString("order_id"));%></td>
    <td width="30px"><% out.print(ct.getString("date"));%></td>
      <td width="190px"><a href="product.jsp?product=<% out.print(prd.getInt("id"));%>"><% out.print(prd.getString("name"));%></a></td>
    <td width="30px"><% out.print(ct.getInt("quantity"));%></td>
      <td width="150px"><% if(ct.getInt("status")==1){ out.print("Delivered");}else { out.print("ACTIVE");%>&nbsp;&nbsp;&nbsp;&nbsp;<a href="cancel_order.jsp?id=<% out.print(ct.getString("id"));%>" data-toggle="tooltip" title="<% out.print(ct.getInt("quantity")+" quantity is reserved for you. Cancel if you dont need this"); %>"><label class="label label-danger">Cancel</label></a><%}%></td>
    <td width="70px" align="right">INR <% out.print(ct.getInt("amount"));%></td>
  </tr>
<% } } %>

</table>
<% }else {%><caption><h2>No Previous Orders</h2></caption><% }%>
<br class="clearBoth" />
<%@ include file="new_products.jsp" %>

<br class="clearBoth" />
</div>        </div>
      
                </div>
        </div>
             <%@ include file="sidebar.jsp" %>
                </div>  
      <div class="clearfix"></div>
        <!--bof-custom block display-->
          <!-- bof tm custom block -->
<!-- eof tm custom block -->
 
        <!--eof-custom block display--> 
    </div>
  </section> 
<!-- ========== FOOTER ========== -->
  <%@ include file="footer.jsp" %>
  <script>
$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip(); 
});
</script>