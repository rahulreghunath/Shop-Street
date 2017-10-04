<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Product Details
      </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> Product Details</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
      <!-- Default box --> 
      <div class="box">
        <div class="box-body">
           <%@ include file="msgbox.jsp" %>
            <table id="table" class="table table-bordered table-hover text-center">
                <thead>
                    <th class="col-md-1">Sl.no</th>
                    <th class="col-md-3">Product Name</th>
                    <th class="col-md-2">Product Id</th>
                    <th class="col-md-1">Price</th>
                    <th class="col-md-1">Discount</th>
                    <th class="col-md-1">Stock</th>
                    <th class="col-md-2">Stock On Branches</th>
                    <th class="col-md-1">Options</th>
                </thead>
                <% Statement st=c.createStatement();
                int i=1;
 ResultSet prd=st.executeQuery("select * from tbl_products");
               %>
                <tbody>
                   <% while(prd.next())
                   {
                   %>
                    <tr>
                       <td>
                           <% out.print(i);i++;%>
                       </td>
                        <td>
                            <% out.print(prd.getString("name"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("product_id"));%>
                        </td>
                        <td>
                            <% out.print(prd.getInt("unit_price"));%>
                        </td>
                        <td>
                            <% out.print(prd.getInt("discount"));%>
                        </td>
                        <td>
                            <% out.print(prd.getInt("stock"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("branch_stock"));%>
                        </td>
                        <td>
                            <button id="delete" class="btn btn-danger" data-id="<% out.print(prd.getInt("id"));%>" type="button" data-stock="<% out.print(prd.getInt("stock")); %>">Delete</button>
                        </td>
                    </tr>
                    <% } %>
                </tbody>
            </table>
        </div> 
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<%@ include file="footer.jsp" %>
<script src="../plugins/datatables/jquery.dataTables.min.js"></script>
<script src="../plugins/datatables/dataTables.bootstrap.min.js"></script>
<script>
  $(function () {
    $('#table').DataTable({
      "paging": true,
      "lengthChange": true,
      "searching": true,
      "ordering": true,
      "info": true,
      "autoWidth": false
    });
  });
    $(document).on('click', '#delete', function(){
       dq=$(this).data("stock");
        id=$(this).data("id");
        if(dq!==0)
            {
                alert(dq+" Quantities in Stock, Can't Delete Product in Stock")
            }
        else
            {
                window.location="delete_product.jsp?id="+id;
            }
    });
</script>