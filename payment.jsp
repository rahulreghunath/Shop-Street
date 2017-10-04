<%@ include file="header.jsp" %>
    <% if(session.getAttribute("user")==null)
{
    response.sendRedirect("login.jsp");
}
%>

	<% Statement usrs=c.createStatement();
ResultSet usr=usrs.executeQuery("select * from tbl_registration where id='"+session.getAttribute("user")+"'");
                                                                               if(usr.next()){ %><!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="index.jsp"></a>
  <a >Checkout</a>
  <a>Billing Details</a>
 <span> Payment</span>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
      col-sm-9        left_column      col-sm-12 ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 with_col ">
                    <div class="centerColumn" id="checkoutShipping">

<div class="heading"><h1>Payment  Details</h1></div>

<h2 id="checkoutShippingHeadingAddress">Debit Card Details:</h2>
<form method="post" action="bank.jsp">

<div class="form-group">
   <label>Name on Card</label>
    <input type="text" class="form-control" name="name" required pattern="[a-zA-Z ]+$" title="Enter Name">
</div>
<div class="form-group">
   <label>Card Number</label>
    <input type="number" class="form-control" name="number" required title="Enter 16 digit card number">
</div>      
<div class="form-group">
   <label>Expiration date</label>
    <input type="date" class="form-control" required>
</div>
<div class="form-group">
   <label>CVV</label>
    <input type="number" class="form-control" name="cvv" maxlength="3" required>
</div>
<div cl
<div class="buttonRow forward"><input type="submit" class="btn btn-success add-to-cart" value="Place Your Order " /></div>
<div class="buttonRow back"><br></div>
<input type="hidden" name="branch" value="<% out.print(request.getParameter("branch")); %>">
</form>
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
  <% } %>
<!-- ========== FOOTER ========== -->
  <%@ include file="footer.jsp" %>