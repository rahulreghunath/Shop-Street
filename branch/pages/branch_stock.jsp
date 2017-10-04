<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Branch Stokes
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Branck Stocks</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
        <div class="box-body">
           <div class="panel panel-default">
              <div class="panel-body">
                  <div class="col-md-6 col-xs-10 form-group">
                       <label class="control-label">Select Category</label>
                        <select name="category" class="form-control" id="category" >
                           <option value="0">Select Category</option>
                            <%
                            Statement st=c.createStatement();
                            ResultSet cat=st.executeQuery("select * from tbl_product_category");
                            while(cat.next())
                            {
                                %><option value="<% out.print(cat.getInt("id")); %>"><% out.print(cat.getString("name")); %></option><%
                            }
                             %>
                        </select>
                    </div>
                    <div class="col-md-6 col-xs-10 form-group">
                       <label class="control-label">Select Product</label>
                        <select name="product" id="product" class="form-control">
                            <option value="0">Select Product</option>
                        </select>
                    </div>

              </div>
            </div>
            <div id="result">
                
            </div> 
        </div> 
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<%@ include file="footer.jsp" %>
<script>
    $('#category').change(function(){
        cate=$(this).val();
        $.ajax({
        url: 'get_products.jsp',
        type: 'POST',
        data: 'category='+cate,
        dataType: 'html'
        })
        .done(function(data){
            //console.log(data);	 
            $('#product').html(data); // load response 
        })
        .fail(function(){
            $('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
    });
    $('#product').change(function(){
        product=$(this).val();
        $.ajax({
        url: 'get_b_stock.jsp',
        type: 'POST',
        data: 'product='+product,
        dataType: 'html'
        })
        .done(function(data){
            //console.log(data);	 
            $('#result').html(data); // load response 
        })
        .fail(function(){
            $('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
            $('#modal-loader').hide();
          });
    });
</script>