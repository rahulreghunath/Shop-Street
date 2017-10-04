<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Branches
      </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> Branches</li>
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
                    <th class="col-md-2">Branch Name</th>
                    <th class="col-md-1">Regno</th>
                    <th class="col-md-2">Address</th>
                    <th class="col-md-1">Mobile Number</th>
                    <th class="col-md-1">Phone Number</th>
                    <th class="col-md-2">Place</th>
                    <th class="col-md-1">State</th>
                    <th class="col-md-1">Pin Code</th>
                </thead>
                <% Statement st=c.createStatement();
                int i=1;
 ResultSet prd=st.executeQuery("select * from tbl_branch");
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
                            <% out.print(prd.getString("b_name"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("b_regno"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("b_address"));%>
                        </td>
                        <td>
                            <% out.print(prd.getInt("mobile"));%>
                        </td>
                        <td>
                            <% out.print(prd.getInt("phone"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("b_place"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("b_state"));%>
                        </td>
                        <td>
                            <% out.print(prd.getInt("b_pin"));%>
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