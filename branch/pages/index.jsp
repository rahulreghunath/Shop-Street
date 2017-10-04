<%@ include file="header.jsp" %>
  <!-- =============================================== -->
<% Statement st11=c.createStatement();
   ResultSet ord7=st11.executeQuery("select COUNT(*) as count from tbl_orders where branch_id='"+session.getAttribute("branch")+"' and  status='0'");
   int total=0,total2=0,total3=0;
   if(ord7.next())
   {
        total=ord7.getInt("count");
   }
   Statement st21=c.createStatement();
   ResultSet ord1=st21.executeQuery("select COUNT(*) as count from tbl_orders where branch_id='"+session.getAttribute("branch")+"'");
   if(ord1.next())
   {
        total2=ord1.getInt("count");
   }
   Statement st3=c.createStatement();
   ResultSet ord3=st3.executeQuery("select COUNT(*) as count from branch_stock where branch_id='"+session.getAttribute("branch")+"' and stock <'10'");
   if(ord3.next())
   {
        total3=ord3.getInt("count");
   }
   %>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Dashboard
        <small>Control panel</small>
      </h1>
      <ol class="breadcrumb">
        <li class="active"><i class="fa fa-dashboard"></i> Home</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
    <div class="row">
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-aqua">
            <div class="inner">
              <h3><% out.print(total);%></h3>

              <p>Active Orders</p>
            </div>
            <div class="icon">
              <i class="ion ion-bag"></i>
            </div>
            <a href="orders.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-green">
            <div class="inner">
              <h3><% out.print(total2);%></h3>

              <p>All Orders</p>
            </div>
            <div class="icon">
              <i class="ion ion-stats-bars"></i>
            </div>
            <a href="all_orders.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
        <div class="col-lg-4 col-xs-6">
          <!-- small box -->
          <div class="small-box bg-red">
            <div class="inner">
              <h3><% out.print(total3);%></h3>

              <p>Restore Points</p>
            </div>
            <div class="icon">
              <i class="ion ion-pie-graph"></i>
            </div>
            <a href="restore.jsp" class="small-box-footer">More info <i class="fa fa-arrow-circle-right"></i></a>
          </div>
        </div>
        <!-- ./col -->
      </div>
      <!-- Default box --> 
      <div class="box">
      <div class="box-header with-border text-center">
          <h3 class="box-title">ACTIVE ORDERS</h3>
        </div>
        <div class="box-body">
        <table id="table" class="table table-bordered table-hover text-center">
                <thead>
                    <th class="col-md-1">Sl.no</th>
                    <th class="col-md-1">Order Id</th>
                    <th class="col-md-1">Product Id</th>
                    <th class="col-md-2">Product Name</th>
                    <th class="col-md-2">Buyer Name</th>
                    <th class="col-md-2">Address</th>
                    <th class="col-md-1">Phone</th>
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
                        
                    </tr>
                       <% }
                        }
                    }
                   }
else
{
    %><tr>
        <td colspan="7">No New Orders</td>
        <%
}
                       %>
                           </table>
        </div> 
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<%@ include file="footer.jsp" %>