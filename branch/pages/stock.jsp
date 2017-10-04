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
                </thead>
                <% Statement st=c.createStatement();
                int i=1;
                 ResultSet stk=st.executeQuery("select * from branch_stock where branch_id='"+session.getAttribute("branch")+"'");
               %>
                <tbody>
                   <% while(stk.next())
                   {
                   Statement st1=c.createStatement();
                   ResultSet prd=st1.executeQuery("select * from tbl_products where id='"+stk.getInt("product_id")+"'");
                   if(prd.next())
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
                            <% out.print(stk.getInt("stock"));%>
                        </td>
                    </tr>
                    <% }
                    } %>
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
</script>