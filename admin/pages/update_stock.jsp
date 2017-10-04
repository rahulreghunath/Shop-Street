<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         Update Stock
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Update Stock</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->  
      <div class="box">
       
        <div class="box-body">
          <%@ include file="msgbox.jsp" %>
            <form class="form-horizontal col-md-10 col-md-offset-2" action="process_update_stock.jsp" id="form1" method="post">
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Category</label>
                    <div class="col-md-5 col-xs-10">
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
                    <label class="control-label col-md-2 col-xs-2">Product</label>
                    <div class="col-md-5 col-xs-10">
                    <select name="product" id="product" class="form-control">
                            <option value="0">Select Product</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Update Type</label>
                    <div class="col-md-5 col-xs-10">
                        <select name="type" class="form-control" id="qnd">
                            <option value="1">Add Quantity</option>
                            <option value="0">Remove Quantity</option>
                        </select>
                    </div>
                </div>
                 <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Stock</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="stock" id="stock" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">New Price</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="price" id="price" class="form-control" placeholder="In Rupees">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">New Discount</label>
                    <div class="col-md-5 col-xs-10">
                        <input id="discount" type="text" name="discount" class="form-control" placeholder="In Rupees" >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-5 col-xs-10 col-md-offset-2">
                        <button type="button" id="btn" class="btn btn-success" style="width:100%">ADD PRODUCT</button>
                    </div>
                </div>
            </form>
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
    $('#qnd').change(function(){
       if($(this).val()=="0")
           {
               $("#price").attr("readonly", "readonly"); 
               $("#discount").attr("readonly", "readonly"); 
           }
        else
            {
                $("#price").removeAttr("readonly"); 
               $("#discount").removeAttr("readonly"); 
            }
    });
    var stock=0;
    var error=0;
    $('#product').change(function(){
        product=$(this).val();
        $.ajax({
        url: 'get_price.jsp',
        type: 'POST',
        data: 'product='+product+'&type=1',
        dataType: 'html'
        })
        .done(function(data){
            //console.log(data);	 
            $('#price').val(data); // load response 
        });
        $.ajax({
        url: 'get_price.jsp',
        type: 'POST',
        data: 'product='+product+'&type=2',
        dataType: 'html'
        })
        .done(function(data){
            //console.log(data);	 
            $('#discount').val(data); // load response 
        });
        $.ajax({
        url: 'get_price.jsp',
        type: 'POST',
        data: 'product='+product+'&type=3',
        dataType: 'html'
        })
        .done(function(data){
            //console.log(data);
            stock=data;
           
        });
    });
    $('#stock').change(function(){
       if($('#qnd').val()=="0")
           {
               if($('#stock').val() >Number(stock))
                   {
                       alert("Can'r remove "+$(this).val()+" quantities only "+stock+" pieces left");
                       $('#stock').val('');
                       error=1
                       
                   }
               else
                   {
                       error=0;
                   }
           }
    });
    $('#btn').click(function(){
        
       if($('#product').val()!=="0" && $('#stock').val()!=="0" && error==0)
           {
               alert("sds");
               $('#form1').submit();
           }
        else
            {
                alert("Enter Correct Details");
            }
    });
   $(document).ready(function() {
            $('#form1').bootstrapValidator({
            fields: { 
            'category': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product Category is required and can\'t be empty'
                    } } },
            'product': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product is required and can\'t be empty'
                    } } },
            'type': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Type is required and can\'t be empty'
                    } } },
            'stock': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Stock is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid Stock'
                    } } },
            'discount': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The New  Discount is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid New  Discount'
                    } } },
            'price': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The New Price is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid New Price'
                    } } },
            }
            });
            });


</script>