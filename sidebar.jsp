   <aside class="column left_column col-xs-12 col-sm-3">
	               	<div id="tm_categories_block" class="module_block">
		<div class="module-heading">
		</div>
   <% Statement side=c.createStatement();
    ResultSet sider=side.executeQuery("select * from tbl_product_category");%>
        <div id="tm_categories" class="clearfix">
			<ul class="level_1 has_sub no_active">
			<% while(sider.next())
        { 
        Statement side1=c.createStatement();
    ResultSet sider1=side1.executeQuery("select * from tbl_products where category_id='"+sider.getInt("id")+"'");
        %>
			<li class="level_1 has_sub no_active"><a class="category-top" href="http://localhost:8080/spare/category.jsp?id=<% out.print(sider.getInt("id"));%>" title="<% out.print(sider.getString("name"));%>"><span><% out.print(sider.getString("name")); %></span></a><ul class="level_2 has_sub no_active">
			<% while(sider1.next())
			{ %>
			<li class="level_2 no_sub no_active"><a class="category-top" href="http://localhost:8080/spare/product.jsp?product=<% out.print(sider1.getString("id"));%>" title="<% out.print(sider1.getString("name"));%>"><span><% out.print(sider1.getString("name"));%></%></span></a></li><% }%></ul></li>
			<% } %></%></ul>		</div></div>

<!--// bof: specials //-->
        <div class="module_block" id="module_specials">
          <div class="module-heading">
            <h3 class="module-head"><a href="">Specials</a></h3>
          </div>
          <% Statement side3=c.createStatement();
    ResultSet sider3=side3.executeQuery("select * from tbl_products where discount > 70 order by rand() limit 2");%>
          <div class="block_content">
           <%
           while(sider3.next())
           {%>
            <div class="sideBoxContent centeredContent"><div class="img"><a href="http://localhost:8080/spare/product.jsp?product=<% out.print(sider3.getInt("id"));%>"><img src="http://localhost:8080/spare/images/<% out.print(sider3.getString("image"));%>" class="img-responsive" alt="<% out.print(sider3.getString("name"));%>" title=" <% out.print(sider3.getString("name"));%> " width="230" height="230" /></a><br /></div><div class="sb-info"><a class="name" href="http://localhost:8080/spare/product.jsp?product=<% out.print(sider3.getInt("id"));%>"><% out.print(sider3.getString("name"));%></a><div class="text"></div><div class="price">&nbsp;<span class="productSpecialPrice"> Rs <% out.print(sider3.getInt("unit_price")-sider3.getInt("discount"));%></span><span class="normalprice"> Rs <% out.print(sider3.getInt("unit_price"));%> </span><span class="productPriceDiscount"> Rs <% out.print(sider3.getInt("discount"));%> off</span></div></div></div>  <% } %>        </div>
        </div>
<!--// eof: specials //-->
        </aside>