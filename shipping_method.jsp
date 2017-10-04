<%@ include file="header.jsp" %>

	<% Statement usrs=c.createStatement();
ResultSet usr=usrs.executeQuery("select * from tbl_registration where id='"+session.getAttribute("user")+"'");
                                                                               if(usr.next()){ %><!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="https://livedemo00.template-help.com/zencart_54030/"></a>
  <a >Checkout</a>
 <span> Billing Details</span>
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

<div class="heading"><h1>Order Details</h1></div>

<h2 id="checkoutShippingHeadingAddress">Billing Information:</h2>

<div id="checkoutShipto" class="floatingBox">
<address style="text-transform: capitalize" class=""><% out.print(usr.getString("fname")+" "+usr.getString("lname"));%><br /> <% out.print(usr.getString("address"));%><br /> <% out.print(usr.getString("city"));%><br /> <% out.print(usr.getString("state"));%><br /> <% out.print("Pin: "+usr.getString("pin"));%></address>
</div>
<div class="floatingBox important">Your bill will be generated with this address</div>
<br class="clearBoth" />


<h2 id="checkoutShippingHeadingMethod">Select Branch:</h2>


<div id="checkoutShippingContentChoose" class="important">Please select the preferred branch to to receive item.</div>
<form action="payment.jsp" method="post">
<% Statement bh=c.createStatement();
ResultSet bch=bh.executeQuery("select * from tbl_branch");
                                            %></%>
<div class="form-group">
    <select name="branch" class="form-control" required>
      <option value> </option>
       <% while(bch.next())
       {%>
        <option style="text-transform: capitalize" value="<% out.print(bch.getString("b_id"));%>"><% out.print(bch.getString("b_place"));%></option>
        <% } %>
    </select>
</div>
      
<fieldset id="checkoutOrderTotals">
<legend id="checkoutPaymentHeadingTotal">Your Total</legend>
<div id="otsubtotal">
    <div class="totalBox larger forward" style="font-size:20px"><% Statement stc1=c.createStatement();
    ResultSet cr1=stc1.executeQuery("select sum(discount),sum(amount)-sum(discount) as total from tbl_cart where user_id='"+session.getAttribute("user")+"'");
      if(cr1.next())
      {
      out.print("Rs "+cr1.getInt("total"));
      %>.0</div>
    <div class="lineTitle larger forward">Sub-Total:</div>
</div>
<br class="clearBoth" />
<div id="otshipping">
    <div class="totalBox larger forward" style="font-size:20px">Rs 0</div>
    <div class="lineTitle larger forward">Delivery:</div>
</div>
<br class="clearBoth" />
<div id="ottotal">
    <div class="totalBox larger forward"><% out.print("Rs "+cr1.getInt("total")); %></div>
    <div class="lineTitle larger forward">Total:</div>
</div>
<div id="ottotal">
    <div class="totalBox larger forward" style="font-size:20px;color:#000"><% out.print("Rs "+cr1.getInt(1)); %></div>
    <div class="lineTitle larger forward">You Save:</div>
</div>
<% } %>
<br class="clearBoth" />
</fieldset>

<div class="buttonRow forward"><input type="submit" class="btn btn-success add-to-cart" value="Continue" /></div>
<div class="buttonRow back"><br><strong>Continue to Step 2</strong>- choose your payment method.</div>

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