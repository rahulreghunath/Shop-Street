<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         Add Product
      </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Add Course</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box -->  
      <div class="box">
       
        <div class="box-body">
          <%@ include file="msgbox.jsp" %>
            <form id="form1" class="form-horizontal col-md-10 col-md-offset-2" action="process_add_product.jsp" method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Product Name</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="name" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Product Id</label>
                    <div class="col-md-5 col-xs-10">
                       <% Random no=new Random(); int num=no.nextInt(9000)+10000;
                       String pid="PRDT"+String.valueOf(num); 
                       Statement st1=c.createStatement();
                       ResultSet id=st1.executeQuery("select * from tbl_products where product_id='"+pid+"'");
                       if(id.next())
                       {
                            num=no.nextInt(9000)+10000;
                            pid="PRDT"+String.valueOf(num); 
                        }
                       %>
                        <input type="text" name="id" class="form-control" value="<% out.print(pid);%>" readonly>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Category</label>
                    <div class="col-md-5 col-xs-10">
                        <select name="category" class="form-control">
                           <option value>Select Category</option>
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
                    <label class="control-label col-md-2 col-xs-2">Description</label>
                    <div class="col-md-5 col-xs-10">
                        <textarea name="desc" class="form-control"></textarea>
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Image</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="file" name="image" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Unit Price</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="price" id="amount" class="form-control" placeholder="In Rupees" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Discount</label>
                    <div class="col-md-5 col-xs-10">
                        <input id="discount" type="text" name="discount" class="form-control" placeholder="In Rupees" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Stock</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="stock" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-5 col-xs-10 col-md-offset-2">
                        <button class="btn btn-success" style="width:100%">ADD PRODUCT</button>
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
     
            $(document).ready(function() {
            $('#form1').bootstrapValidator({
            fields: { 
            'name': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product Name is required and can\'t be empty'
                    } } },
            'category': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product Category is required and can\'t be empty'
                    } } },
            'desc': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product Description is required and can\'t be empty'
                    },stringLength: {
                    max: 500,
                    message: 'The Product Description must be less than 500 characters long'
                } } },
            'image': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product Image is required and can\'t be empty'
                    } } },
            'price': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Price is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid Price'
                    } } },
            'discount': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Discount is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid Discount'
                    } } },
            'stock': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Stock is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid Stock'
                    } } }}
            });
            });
                
</script>