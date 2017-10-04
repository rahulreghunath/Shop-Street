<%@ include file="header.jsp" %>
  <!-- =============================================== -->
<%
  Statement dlt=c.createStatement();
 dlt.executeUpdate("delete from temp_cart");
 %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         Add Branch Supplies
      </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Add Branch Supplies</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->  
      <div class="box"> 
        <div class="box-body">
          <%@ include file="msgbox.jsp" %>
           <div class="panel-group col-md-5">
    <div class="panel panel-default">
      <div class="panel-heading">Add Products</div>
      <div class="panel-body">
            <div class="form-horizontal">
              <div class="form-group">
               <div id="msg" class="col-md-10 col-md-offset-2 col-xs-10" style="color:#e00a0a">
                  </div>
                </div>
               <div class="form-group">
                    <label class="control-label col-md-4 col-xs-2">Branch</label>
                    <div class="col-md-7 col-xs-10">
                        <select name="category" class="form-control" id="branch">
                           <option value="0">Select Branch</option>
                            <%
                            Statement st1=c.createStatement();
                            ResultSet cat1=st1.executeQuery("select * from tbl_branch");
                            while(cat1.next())
                            {
                                %><option value="<% out.print(cat1.getInt("b_id")); %>"><% out.print(cat1.getString("b_name")); %></option><%
                            }
                             %>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4 col-xs-2">Category</label>
                    <div class="col-md-7 col-xs-10">
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
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4 col-xs-2">Product Name</label>
                    <div class="col-md-7 col-xs-10">
                        <select name="product" id="product" class="form-control">
                            <option value="0">Select Product</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-4 col-xs-2">Quantity</label>
                    <div class="col-md-7 col-xs-10">
                        <input type="number" class="form-control" min="1" name="qnty" id="qnty">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-7 col-md-offset-4 col-xs-10">
                        <button type="button" id="add" class="btn btn-default" style="width:100%">Add</button>
                    </div>
                </div>
            </div>
                </div>
          </div>
        </div>
        <div class="panel-group col-md-7">
    <div class="panel panel-default">
      <div class="panel-heading">CART</div>
      <div class="panel-body" id="cart" style="min-height:274px">
       <h1 style="text-align:center">Add Products</h1>
        </div>
            </div>
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
    $('#add').click(function(){
        
        branch=$('#branch').val();
        product=$('#product').val();
        qnty=$('#qnty').val();
        if(branch=="0" || product=="0" || qnty=="0" || qnty=="")
            {
                alert("Enter Correct Details");
            }
        else
            {
                $("#branch").prop('disabled', true);
                
                $.ajax({
                url: 'add_cart.jsp',
                type: 'POST',
                data: 'branch='+branch+'&product='+product+'&qnty='+qnty,
                dataType: 'html'
                })
                .done(function(data){
                    //console.log(data);	 
                    $('#cart').html(data); // load response 
                })
                .fail(function(){
                    $('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
                    $('#modal-loader').hide();
                  });
            }
    });
    $(document).on('click', '#remove', function(){
        id=$(this).data('id');
        branch=$('#branch').val();
        $.ajax({
                url: 'remove_cart.jsp',
                type: 'POST',
                data: 'id='+id+'&branch='+branch,
                dataType: 'html'
                })
                .done(function(data){
                    //console.log(data);	 
                    $('#cart').html(data); // load response 
                })
                .fail(function(){
                    $('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
                    $('#modal-loader').hide();
                  });
    });
    $("#qnty").keyup(function(){
        product=$('#product').val();
        qnty=$('#qnty').val();
        $.ajax({
                url: 'check_quantity.jsp',
                type: 'POST',
                data: 'product='+product+'&qnty='+qnty,
                dataType: 'html'
                })
                .done(function(data){
                    console.log(data);	
                    $('#msg').html('');
                    if(data.length>10)
                        {
                            $('#msg').html(data);
                        }
                
                })
                .fail(function(){
                    $('#dynamic-content').html('<i class="glyphicon glyphicon-info-sign"></i> Something went wrong, Please try again...');
                    $('#modal-loader').hide();
                  });
    });
    $("#product").change(function(){
       $('#msg').html(''); 
    });
</script>