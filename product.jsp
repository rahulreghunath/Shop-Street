<%@ include file="header.jsp" %>

<%
String product=request.getParameter("product");
   Statement st4=c.createStatement();
    ResultSet prd=st4.executeQuery("select * from tbl_products where id='"+product+"'");%>

	<!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                       <% if(prd.next())
                       { 
                       Statement st1=c.createStatement();
                        ResultSet cat=st1.executeQuery("select * from tbl_product_category where id='"+prd.getInt("category_id")+"'");
                        if(cat.next())
                        {
                       %>
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="index.jsp"></a>
  <a href="category.jsp?id=<% out.print(prd.getInt("category_id"));%>"><% out.print(cat.getString("name"));%></a>
 <span> <% out.print(prd.getString("name"));%></span>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
             left_column      ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 ">
                    
<div class="centerColumn" id="productGeneral">
    <div class="wrapper bot-border"> 
    <!--bof Prev/Next bottom position -->
      </div>
  <div class="tie">
    <div class="tie-indent">
      <div class="page-content"> 
      <!--bof Form start--> 
        <form role="form" name="cart_quantity" action="cart.jsp" method="get">
 
        <!--eof Form start-->
          
                  
        <!--bof Category Icon -->
          
                  
        
      <div class="row">
        <div class="main-image col-xs-12 col-sm-5">
          <div id="fb-root"></div>
          <!--bof Main Product Image -->
                     


<div id="productMainImage" class="pull-left image-block">
	<span class="image"><a href="images/<% out.print(prd.getString("image"));%>"><img src="images/<% out.print(prd.getString("image"));%>" class="img-responsive" alt="<% out.print(prd.getString("name"));%>" title=" <% out.print(prd.getString("name"));%> " width="155" height="155" /><span class="zoom"></span></a></span>
	
</div>                      
          <!--eof Main Product Image--> 
          <!--bof Additional Product Images -->
                              <ul id="productAdditionalImages">
            
    <li class="additionalImages centeredContent back" style="width:20%;">
      <span><img src="images/<% out.print(prd.getString("image"));%>" class="img-responsive" alt="<% out.print(prd.getString("name"));%>" title=" <% out.print(prd.getString("name"));%> " width="230" height="230" /></span></li>  
       
 
</ul>          </ul>
              <!--eof Additional Product Images -->
    </div>
          <div class="pb-center-column col-xs-12 col-sm-7"> 
            <!--bof free ship icon  -->
                        <!--eof free ship icon  -->
            <h2 class="title_product"><% out.print(prd.getString("name"));%></h2>
            <!--bof Product description --><br>
                        <div id="shortDescription" class="description"><% out.print(prd.getString("product_desc"));%></div>
                        <!--eof Product description -->
           
                        <!--eof Product details list  --> 
            <div class="wrapper atrib2"> 
              <!--bof Attributes Module -->                            
              
            <div class="add_to_cart_block"> 
              <!--bof Add to Cart Box -->
                                                        <div id="prod-price">
                <span class="normalprice">Rs <% out.print(prd.getInt("unit_price"));%></span> <span class="productSalePrice" style="font-size:25px">Rs <% out.print(prd.getInt("unit_price")-prd.getInt("discount"));%></span>             </div>
              <div class="clearfix"></div>
              
                                          <!--eof Add to Cart Box--> 
            </div>
            </div>
              <div id="button_product">
                <div class="add_to_cart_row"><strong class="fleft text2"><input type="number" class="form-control" name="quantity" value="1"  size="8" max="<% out.print(prd.getInt("stock")+prd.getInt("branch_stock"));%>" required title="maxium <% out.print(prd.getInt("stock")+prd.getInt("branch_stock"));%>"/><input type="hidden" name="id" value="<% out.print(prd.getInt("id"));%>" /></strong><span class="buttonRow"><input <% if(prd.getInt("stock")+prd.getInt("branch_stock")>0){ %> type="submit" value="Add to Cart" <% }else { %>type="button" value="OUT OF STOCK, ORDER SOON"<%} %>class="btn btn-success add-to-cart"/></span></div>              </div>
              <!-- bof Social Media Icons -->
                            <!-- eof Social Media Icons -->
          </div>
        </div>
        <!--bof Quantity Discounts table -->
                <!--eof Quantity Discounts table --> 
        
        <!--bof also related products module-->
        
        			<div class="centerBoxWrapper" id="relatedProducts">
            <h2 class="centerBoxHeading">Related Products</h2>            <div class="row">
			<% Statement side3=c.createStatement();
    ResultSet sider3=side3.executeQuery("select * from tbl_products where category_id='"+cat.getInt("id")+"' and id!='"+prd.getInt("id")+"' order by rand() limit 4");
    while(sider3.next())
           {
           %>
    <div class="col-xs-12 col-sm-3"><div data-match-height="items-e" class="product-col"><div class="img"><a href="product.jsp?product=<% out.print(sider3.getInt("id"));%>"><img src="images/<% out.print(sider3.getString("image"));%>" class="img-responsive" alt="<% out.print(sider3.getString("name"));%>" title=" <% out.print(sider3.getString("name"));%>" width="230" height="230" /></a></div><div class="prod-info"><a class="product-name name" href="product.jsp?product=<% out.print(sider3.getInt("id"));%>"><% out.print(sider3.getString("name"));%></a></div></div></div>
    <% }%>
<br class="clearBoth" />
 
			</div>
            </div>

		        
        <!--eof also related products module--> 
        <br />

        
        
        
        <!--bof also purchased products module-->
        
        <!--eof also purchased products module--> 
        
        <!--bof Form close-->
        </form>
        <!--bof Form close--> 
        
      </div>
    </div>
  </div>
</div>        </div>
      
                </div>
        </div>
              </div>  
      <div class="clearfix"></div>
        <!--bof-custom block display-->
          <!-- bof tm custom block -->
<!-- eof tm custom block -->
 
        <!--eof-custom block display--> 
    </div>
  </section> 
  <% }
  } %>
<!-- ========== FOOTER ========== -->
   <%@ include file="footer.jsp" %>