<%@ include file="header.jsp" %>

<%
String cate=request.getParameter("id");
Statement st1=c.createStatement();
ResultSet cat=st1.executeQuery("select * from tbl_product_category where id='"+cate+"'");
if(cat.next())
{

   Statement st4=c.createStatement();
    ResultSet prd=st4.executeQuery("select * from tbl_products where category_id='"+cate+"'");%>

	<!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">
 <h3><% out.print(cat.getString("name"));%></h3>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
      col-sm-9        left_column      col-sm-12 ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 with_col ">
                    <div class="centerColumn" id="advSearchResultsDefault">

<div class="heading"><h1>Search Results</h1></div>

<div id="productListing">


<div class="clearfix"></div>

<div class="tie tie-margin1">
	<div class="tie-indent">
		
				
		
		<ul class="product_list row list">
        <%
        if(prd.next())
        {  prd.beforeFirst();
        //String a=prd.getString("name");
        //out.print(a);
        while(prd.next())
        {
        %><li class="col-xs-12">
        <div class="product-container">
            <div class="row">
                                                <div class="img">
                                        <a href='product.jsp?product=<% out.print(prd.getInt("id"));%>'><img src="images/<% out.print(prd.getString("image"));%>" class="img-responsive" alt="Arai Tour-X3 Long Way Down Motorcycle Helmet" title=" Arai Tour-X3 Long Way Down Motorcycle Helmet " width="155" height="155" class="listingProductImage" /></a>                                </div>
                                                                <div class="center-block col-xs-4 col-xs-7 col-md-4">
                                    <h5 itemprop="name">
                        <a class="product-name name" href='product.jsp?product=<% out.print(prd.getInt("id"));%>'><% out.print(prd.getString("name"));%></a>
                    </h5>
                    <div class="text">
						<span class="list-desc"><% out.print(prd.getString("product_desc"));%></span>
						<span class="grid-desc"><% out.print(prd.getString("product_desc"));%></span>
						</div>                                </div>
                                                                <div class="product-buttons">
                                    <div class="content_price col-xs-5 col-md-12">
                                        <span itemprop="price" class="price product-price">
                                        <span class="productSalePrice" style="text-decoration: line-through">
                                           Rs <% out.print(prd.getInt("unit_price"));%>
                                            </span><div class="clearfix"></div>
                                        <span class="productSalePrice" style="font-size:25px">Rs <% out.print(prd.getInt("unit_price")-prd.getInt("discount"));%></span></span><div class="clearfix"></div><div class="button"><a class="btn add-to-cart" href="cart.jsp?id=<% out.print(prd.getInt("id"));%>"><span class="cssButton normal_button button  button_add_to_cart" onmouseover="this.className='cssButtonHover normal_button button  button_add_to_cart button_add_to_cartHover'" onmouseout="this.className='cssButton normal_button button  button_add_to_cart'">&nbsp;Add to Cart&nbsp;</span></a></div><div class="button1"><a class="btn" href='product.jsp?product=<% out.print(prd.getInt("id"));%>'><span class="cssButton normal_button button  button_goto_prod_details" onmouseover="this.className='cssButtonHover normal_button button  button_goto_prod_details button_goto_prod_detailsHover'" onmouseout="this.className='cssButton normal_button button  button_goto_prod_details'">&nbsp;Details&nbsp;</span></a></div><br />                                    </div>
                                </div>
                                            </div>
        </div>
    </li>
      <% }}
      else
      {
      %>
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="index.jsp"></a>
 <span> No Product Found</span>
</div>
                    </div>
      </div>
      <%
      } %>  
    </ul>		
		
		</div>



	<div class="clearfix"></div>
</div>
</div>
<div class="clearfix"></div>


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