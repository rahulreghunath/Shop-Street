<%@ include file="header.jsp" %>
<% if(session.getAttribute("user")==null)
{
    response.sendRedirect("login.jsp");
}
%>
	<!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="index.jsp"></a>
 <span> The Shopping Cart</span>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
      col-sm-9        left_column      col-sm-12 ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 with_col ">
                    <div class="centerColumn" id="shoppingCartDefault">

<div class="heading"><h1>Your Shopping Cart Contents</h1></div>

 <% Statement stc=c.createStatement();
    ResultSet cr=stc.executeQuery("select * from tbl_cart where user_id='"+session.getAttribute("user")+"'");
      if(cr.next())
      { %>
<div class="tie text2">
  <div class="tie-indent">
  
  


<form role="form" name="cart_quantity"  method="post"><input type="hidden" name="securityToken" value="f8f753ae89f8ce57a90b81c495ab9331" />

  <br class="clearBoth" />


<table class="table table-bordered" border="0" width="100%" cellspacing="0" cellpadding="0" id="cartContentsDisplay">
     <tr class="tableHeading">
       <th>Sl.no</th>
        <th scope="col" id="scProductImg"></th>
        <th scope="col" id="scProductsHeading">Item Name</th>
        <th scope="col" id="scUnitHeading">Unit</th>
        <th scope="col" id="scQuantityHeading">Quantity</th>
        <th scope="col" id="scTotalHeading">Discount</th>
        <th scope="col" id="scRemoveHeading">Sub Total</th>
        <th scope="col" id="scUpdateQuantity">Delete</th>
     </tr>
         <!-- Loop through all products /-->
       <% int i=1;
      cr.beforeFirst();
      while(cr.next())
      {
      
       Statement st4=c.createStatement();
    ResultSet prd=st4.executeQuery("select * from tbl_products where id='"+cr.getInt("product_id")+"'");
         if(prd.next())
         { %>
          <tr class="rowEven">
          <td><% out.print(i);i++;%></%></td>
        <td class="cartProductDisplay">
            <a href="product.jsp?product=<% out.print(prd.getInt("id"));%>">
                <span id="cartImage"><img src="images/<% out.print(prd.getString("image"));%>" class="img-responsive" alt="DUNLOP 250-450F TIRE COMBO" title=" DUNLOP 250-450F TIRE COMBO " width="150" height="150" /></span>
            </a>
        </td>
       
       <td class="cartProductDisplay">
<a href="product.jsp?product=<% out.print(prd.getInt("id"));%>"><span id="cartProdTitle" class="heading"><% out.print(prd.getString("name"));%><span class="alert bold"></span></span></a>
<br class="clearBoth" />


       </td>
       <td class="cartUnitDisplay price" data-title="Unit price">Rs <% out.print(prd.getInt("unit_price"));%></%></td>
       
       
       <td class="cartQuantity">
        <input type="text"  size="2" id="qty" data-id="<% out.print(prd.getInt("id"));%>" value="<% out.print(cr.getInt("quantity"));%>" /><span class="alert bold"></span>       </td>
       
       
       <td class="cartTotalDisplay" data-title="Total">Rs <% out.print(cr.getInt("discount"));%></td>
       <td class="cartRemoveItemDisplay">
       
Rs <% out.print(cr.getInt("amount")-cr.getInt("discount"));%></td>

        <td class="cartQuantityUpdate buttonRow">
            <a href="delete_cart.jsp?id=<% out.print(cr.getInt("id"));%>"><i class="fa fa-trash-o fa-2x" aria-hidden="true" title="<% out.print("Delete "+prd.getString("name"));%>"></i></a> </td>
 
     </tr>
      <% }
      }
 %>
       <!-- Finished loop through all products /-->
      </table>
    
   </div>

</div>

    <div id="cartSubTotal">Total Itam: <b><% out.print(i-1);%></b> &nbsp;&nbsp;<b>Grand-Total:</b>&nbsp;&nbsp;<span class="price" style="padding-right:20px;font-size:20px">
   <% Statement stc1=c.createStatement();
    ResultSet cr1=stc1.executeQuery("select sum(amount)-sum(discount) as total from tbl_cart where user_id='"+session.getAttribute("user")+"'");
      if(cr1.next())
      {
      out.print("Rs "+cr1.getInt("total"));
      }%></span></div>
     
<br class="clearBoth" />

<!--bof shopping cart buttons-->

<div class="wrapper">
  
  <div class="shcart_btn">
  <div class="btn cont_shop"><a href="index.jsp"><span class="cssButton normal_button button  button_continue_shopping" onmouseover="this.className='cssButtonHover normal_button button  button_continue_shopping button_continue_shoppingHover'" onmouseout="this.className='cssButton normal_button button  button_continue_shopping'">&nbsp;Continue Shopping&nbsp;</span></a></div>
    <a class="btn" href="checkout.jsp"><span class="cssButton normal_button button  button_checkout" onmouseover="this.className='cssButtonHover normal_button button  button_checkout button_checkoutHover'" onmouseout="this.className='cssButton normal_button button  button_checkout'">&nbsp;Checkout&nbsp;</span></a>  
           
       </div>
  
</div>


</form><% }
else{ %>
<h2 id="cartEmptyText">Your Shopping Cart is empty.</h2>
<% } %>



<!-- ** BEGIN PAYPAL EXPRESS CHECKOUT ** -->
<!-- ** END PAYPAL EXPRESS CHECKOUT ** -->

  <div class="clear"></div>
  
</div>
      <br/>
       <%@ include file="new_products.jsp" %>
        </div>
      
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
    $(document).on('change', '#qty', function(){
         id=$(this).data('id');
         qty=$(this).val();
        window.location="update_quantity.jsp?id="+id+"&qty="+qty;
     });
</script>