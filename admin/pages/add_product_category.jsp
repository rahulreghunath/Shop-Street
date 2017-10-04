<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Add Product Category
      </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Add Product Category</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
        <div class="box-body">
           <%@ include file="msgbox.jsp" %>
            <form class="form-horizontal col-md-10 col-md-offset-2" action="process_add_category.jsp" method="post" id="form1">
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Product Name</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="name" class="form-control" required>
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
<link rel="stylesheet" href="../../validation/dist/css/bootstrapValidator.css"/>
    
<script type="text/javascript" src="../../validation/dist/js/bootstrapValidator.js"></script>
<script>
    $(document).ready(function() {
            $('#form1').bootstrapValidator({
            fields: { 
            'name': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Product Catrgory Name is required and can\'t be empty'
                    } } }}
            });
            });
</script>