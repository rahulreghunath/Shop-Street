<%  Statement stn4=c.createStatement();
    ResultSet npd=stn4.executeQuery("select * from tbl_products order by rand() limit 8");
    %>
<div class="centerBoxWrapper" id="whatsNew">
<h2 class="centerBoxHeading">Featured Products</h2><ul class="prod-list1 w25">
<% while(npd.next())
   { %>
    <li class="centerBoxContentsFeatured centeredContent back  i1" style="width:25%;"><div data-match-height="items-g" class="product-col">
				<h5><a class="product-name name" href="http://localhost:8080/spare/product.jsp?product=<% out.print(npd.getInt("id"));%>"><% out.print(npd.getString("name"));%></%></a></h5>
				<div class="img">
					<a href="http://localhost:8080/spare/product.jsp?product=<% out.print(npd.getInt("id"));%>"><img src="http://localhost:8080/spare/images/<% out.print(npd.getString("image"));%>" class="img-responsive" alt="<% out.print(npd.getString("name"));%>" title="<% out.print(npd.getString("name"));%>" width="155" height="155" /></a>
				</div>
				<div class="prod-info">
					<div class="price">
						<strong><span class="productSalePrice">Rs <% out.print(npd.getInt("unit_price"));%></span></strong>
					</div>
					<div class="text">
						<% out.print(npd.getString("product_desc"));%>
					</div>
						<div class="product-buttons">
							<div class="button"><a class="btn add-to-cart" href="http://localhost:8080/spare/cart.jsp?id=<% out.print(npd.getInt("id"));%>"><span class="cssButton normal_button button  button_add_to_cart" onmouseover="this.className='cssButtonHover normal_button button  button_add_to_cart button_add_to_cartHover'" onmouseout="this.className='cssButton normal_button button  button_add_to_cart'">&nbsp;Add to Cart&nbsp;</span></a></div>
							<div class="button1"><a class="btn products-button" href="http://localhost:8080/spare/product.jsp?product=<% out.print(npd.getInt("id"));%>"><span class="cssButton normal_button button  button_goto_prod_details" onmouseover="this.className='cssButtonHover normal_button button  button_goto_prod_details button_goto_prod_detailsHover'" onmouseout="this.className='cssButton normal_button button  button_goto_prod_details'">&nbsp;Details&nbsp;</span></a></div>
						</div>
				</div>
			</div></li> 
			<% } %>
 
</ul>
</div>