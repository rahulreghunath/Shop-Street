<header>
      <link href="https://fonts.googleapis.com/css?family=Orbitron:900" rel="stylesheet">
      <script src="https://use.fontawesome.com/dd7ef74423.js"></script>
       <style>
    .logo {
        padding:5px 10px 5px 10px;
        font-size:30px;
        font-weight:bold;
        background-color:#fff;
        color:#980026;
        border-bottom-left-radius: 16px;
        border-top-right-radius: 16px;
        float: left !important;
        font-family: 'Orbitron', sans-serif;
    }
    .logo:hover {
        background-color:#980026;
        color:#fff;
        box-shadow: 10px 10px 30px #888;
        transition: .5s ease-out;
    }
   .logo:hover > .anim {
       animation-play-state: running;
   }
   .anim {
       animation: spin 5s linear infinite;
       animation-play-state: paused; 
   }
    @keyframes spin {
      100% {transform: rotate(1turn); }
    }
</style>
        <div class="nav">
                <div class="container">
                    <div class="row">
                        <nav>
                            <div class="col-xs-12 col-md-8">
                                <div id="ezpages" class="clearfix">
                                                                            <nav> 
  <ul class="ez-menu">
      
                <li class="  first">  
                    <a href="http://localhost:8080/spare/">  
                        <span>Home</span>   
                    </a>  
                </li>    
               
              
                <li class="  ">  
                    <a href="http://localhost:8080/spare/all_products.jsp">  
                        <span>All Products</span>   
                    </a>  
                </li>  
              
  </ul>
</nav>

                                                                    </div>
                            </div>
                            <div class="col-xs-12 col-md-4">
                                <ul class="socials">
                                    <li><a href="#"><i class="fa fa-facebook-square"></i></a></li>
                                    <li><a href="#"><i class="fa fa-twitter-square"></i></a></li>
                                    <li><a href="#"><i class="fa fa-google-plus-square"></i></a></li>
                                    <li><a href="#"><i class="fa fa-youtube-square"></i></a></li>
                                    <li><a href="#"><i class="fa fa-instagram"></i></a></li>
                                </ul>
                            </div>
                        </nav>
                    </div>
                </div>
            </div>
            <div class="bottom" style="padding:30px 0px 33px 0px">
                <div class="container">
                    <div class="row clearfix">
                        <div class="col-xs-12 col-sm-4 col-md-4" style="padding:0px">
                            <!-- ========== LOGO ========== -->
                                <a href="http://localhost:8080/spare/"><div class="logo">SHOP <i class="fa anim fa-motorcycle" aria-hidden="true"></i> STREET </div></a>
                            <!-- ========================== -->
                        </div>
                        <div id="search_block" class="col-xs-12 col-sm-4 col-md-4 clearfix">
                           <!-- ========== SEARCH ========== -->
                           <form name="quick_find_header" action="http://localhost:8080/spare/search.jsp" method="post" class="form-inline form-search pull-right">
                                   <label class="sr-only" for="searchInput">Search</label>
                                   <input class="form-control" id="searchInput" type="text" name="keyword" placeholder="SEARCH"/>
                                   <button type="submit" class="button-search"><i class="fa fa-search"></i></button>
                           </form>
                           <!-- ============================ -->
                        </div>
                        <div class="col-xs-12 col-sm-4 col-md-4">
                                <i class="menu_btn fa fa-bars"></i>
                                <div class="header_user_info customer_links">
                                    <!-- ========== NAVIGATION LINKS ========== -->  
                                                                                <% if(session.getAttribute("user")!=null)
                                                                                {
                                                                                Statement usrs=c.createStatement();
ResultSet usr=usrs.executeQuery("select * from tbl_registration where id='"+session.getAttribute("user")+"'");
                                                                               if(usr.next()){
                                                                                %><a class="" href="http://localhost:8080/spare/profile.jsp"><% out.print(usr.getString("fname"));%></a>   
                                          
                                                                                    <a class="home" href="http://localhost:8080/spare/view_cart.jsp">Shopping Cart</a>
                                                                          <a class="" href="http://localhost:8080/spare/logout.jsp">Logout</a><% }}
                                                                           else
                                                                           { %>
                                                                               <a class="" href="http://localhost:8080/spare/login.jsp">Log In</a>
                                                                          <% } %>
                                                                            <!-- ====================================== -->
                                </div>
                                <div class="shopping_cart" id="shopping_cart">
                                <!-- ========== SHOPPING CART ========== -->
                                 
                                                                         <div class="shop-box-wrap">
                                        <span class="cart_title" >Shopping Cart:</span>                                    </div>
                                    <div class="shopping_cart_content" id="shopping_cart_content" >
                                        
                                        <% 
                                        if(session.getAttribute("user")!=null)
                                        {%><ul class="cart-down"><%
                    Statement sth=c.createStatement();
    ResultSet crh=sth.executeQuery("select * from tbl_cart where user_id='"+session.getAttribute("user")+"'");
      if(crh.next())
      {
    crh.beforeFirst();
      while(crh.next())
      {
      
       Statement sth4=c.createStatement();
    ResultSet prdh=sth4.executeQuery("select * from tbl_products where id='"+crh.getInt("product_id")+"'");
         if(prdh.next())
         { %> %><li class="cart_item">
						<a class="cart-img" href="http://localhost:8080/spare/product.jsp?product=<% out.print(prdh.getInt("id"));%>"><img src="http://localhost:8080/spare/images/<% out.print(prdh.getString("image"));%>"/></a>
						<div class="center-info">
							<a class="cart-name" href="http://localhost:8080/spare/product.jsp?product=<% out.print(prdh.getInt("id"));%>"><% out.print(prdh.getString("name"));%></a>
							<div class="prod-info">
								<span class="quantity"><% out.print(crh.getInt("quantity"));%> <em class="spr">x</em> </span><span class="cart-price">Rs <% out.print(crh.getInt("amount")-crh.getInt("discount"));%></span>
							</div>
						</div><a class="delete" href="http://localhost:8080/spare/delete_cart.jsp?id=<% out.print(crh.getInt("id"));%>"> </a></li><% }} %><div class="cart-price-total"><strong>Total:</strong>&nbsp;<span><% Statement stc11=c.createStatement();
    ResultSet cr11=stc11.executeQuery("select sum(amount)-sum(discount) as total from tbl_cart where user_id='"+session.getAttribute("user")+"'");
      if(cr11.next())
      {
      out.print("Rs "+cr11.getInt("total"));
      }%></span></div><div class="cart-bottom">
	<a class="btn btn-success" href="http://localhost:8080/spare/view_cart.jsp"><span class="cssButton">Cart</span></a>
	<a class="btn btn-success1" href="http://localhost:8080/spare/checkout.jsp"><span class="cssButton normal_button button  button_checkout" onmouseover="this.className='cssButtonHover normal_button button  button_checkout button_checkoutHover'" onmouseout="this.className='cssButton normal_button button  button_checkout'">&nbsp;Checkout&nbsp;</span></a></div></ul>                                    
                                <% }
                                    else
                                    {
                                        %><div class="none"> Your cart is empty</div>
                                            <%
                                    }}
                                else
                                   { %>
                                   <div class="none"> Your cart is empty</div>
                                <% } %>
                                </div> 
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                	</header>