<%@ include file="header.jsp" %>
	

	   




	<!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="index.jsp"></a>
 <span> Checkout</span>
 <span> <% if(session.getAttribute("success")!=null)
{ %>Success - Thank You <% }else{ %>Failed -Retry<% } %></span>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
      col-sm-9        left_column      col-sm-12 ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 with_col ">
                    
<div class="centerColumn" id="checkoutSuccess">
<!--bof -gift certificate- send or spend box-->
<!--eof -gift certificate- send or spend box-->
<% if(session.getAttribute("success")!=null)
{ %>
<div class="heading"><h1>Thank You! We Appreciate your Business!</h1></div>
<div id="checkoutSuccessOrderNumber"><strong>Your Order Number is: </strong><% out.print(session.getAttribute("success"));%></%></div>
<!--<div id="checkoutSuccessMainContent" class="content">
<p><strong>Checkout Success Sample Text ...</strong></p><p>A few words about the approximate shipping time or your processing policy would be put here. </p>
<p>This section of text is from the Define Pages Editor located under Tools in the Admin.</p></div>-->
<!-- bof payment-method-alerts -->
<!-- eof payment-method-alerts -->
<!--bof logoff-->
<div id="checkoutSuccessLogoff">
Thank you for shopping.</div>
</div>
<!--eof logoff-->
<br class="clearBoth" />
<!--bof -product notifications box-->
<!--eof -product notifications box-->



<!--bof -product downloads module-->


<!--eof -product downloads module-->

<div id="checkoutSuccessOrderLink">You can view your order history by going to the <a href="profile.jsp">My Account</a>.</div>


    <h3 id="checkoutSuccessThanks" class="centeredContent">Thanks for shopping with us online!</h3><% } else { %>
    <div class="alert alert-danger alert-dismissable">
  <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
  <strong>Order Failed!</strong> There was a problem with your payment.
</div>
    </div><% } %>
   <%@ include file="new_products.jsp" %>
   
    
</div>        </div>
      
                </div><%@ include file="sidebar.jsp" %>
        </div>
              
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