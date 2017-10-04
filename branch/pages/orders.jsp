<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Active Orders
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active"> Active Orders</li>
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
                    <th class="col-md-1">Order Id</th>
                    <th class="col-md-1">Product Id</th>
                    <th class="col-md-2">Product Name</th>
                    <th class="col-md-2">Buyer Name</th>
                    <th class="col-md-2">Address</th>
                    <th class="col-md-1">Phone</th>
                    <th class="col-md-2">Options</th>
                </thead>
                <% Statement st=c.createStatement();
                int i=1;
 ResultSet ord=st.executeQuery("select * from tbl_orders where branch_id='"+session.getAttribute("branch")+"' and status='0'");
               %>
                <tbody>
                  <% 
                   if(ord.next())
                  {
                  ord.beforeFirst();
                    while(ord.next())
                   {
                       Statement st1=c.createStatement();
                       ResultSet prd=st1.executeQuery("select * from tbl_products where id='"+ord.getInt("product_id")+"'");
                        if(prd.next())
                        {
                            Statement st2=c.createStatement();
                           ResultSet usr=st2.executeQuery("select * from tbl_registration where id='"+ord.getInt("user_id")+"'");
                            if(usr.next())
                        {
                   %>
                    <tr>
                       <td>
                           <% out.print(i);i++;%>
                       </td>
                        <td>
                            <% out.print(ord.getString("order_id"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("product_id"));%>
                        </td>
                        <td>
                            <% out.print(prd.getString("name"));%>
                        </td>
                        <td>
                            <% out.print(usr.getString("fname"));%>
                        </td>
                        <td>
                            <% out.print(usr.getString("address"));%>
                        </td>
                        <td>
                            <% out.print(usr.getString("mobile"));%>
                        </td>
                        <td>
                            <button id="delete" class="btn btn-danger" data-id="<% out.print(ord.getInt("id"));%>" type="button">Cancel</button>
                                <button class="btn btn-success" id="confirm" type="button" data-id="<% out.print(ord.getString("order_id"));%>">Deliver</button>
                        </td>
                    </tr>
                    <% }}}
                   %>
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
                       <%
                   }
                    else 
                    {
                        %>
                            <tr>
                                <td colspan="8">
                            No New Orders
                                </td>
                            </tr>
                            
                            <%
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
 
    $(document).on('click', '#delete', function(){
        id=$(this).data("id");
        if(confirm("Are you wish to delete the order?")==true)
            {
                 window.location="delete_order.jsp?id="+id;
            }
    });
$(document).on('click', '#confirm', function(){
        id=$(this).data("id");
        window.location="bill.jsp?id="+id;
    });
</script>