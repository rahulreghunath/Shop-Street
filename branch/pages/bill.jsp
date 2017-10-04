<%@ include file="header.jsp" %>
  <!-- =============================================== -->

<style>
    .name {
        text-transform: capitalize;
        text-align: left;
    }
    .company {
        text-transform: capitalize;
        text-align: right;
    }
    .btn-warning {
        text-transform: uppercase;
    }
    @media print {
        #p-btn {
            display: none;
        }
        footer {
            display: none;
        }
        header {
            display: none;
        }
        .btn-warning {
            display :none;
        }
        .qq {
            display :none;
        }
        ::-webkit-scrollbar { 
    display: none; 
}
}
</style>
  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
        Orders
      </h1>
      <ol class="breadcrumb">
        <li><a href="index.jsp"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Orders</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
        <div class="box-body">
            <%
               String id=request.getParameter("id");
               Statement st=c.createStatement();
               String idd="";
         ResultSet ord=st.executeQuery("select * from tbl_orders where order_id='"+id+"'");
           if(ord.next())
          {
          idd=ord.getString("order_id");
          Statement st1=c.createStatement();
           ResultSet prd=st1.executeQuery("select * from tbl_products where id='"+ord.getInt("product_id")+"'");
            if(prd.next())
            {
                Statement st2=c.createStatement();
               ResultSet usr=st2.executeQuery("select * from tbl_registration where id='"+ord.getInt("user_id")+"'");
                if(usr.next())
                {
                    %><div class="col-md-10 col-md-offset-1 myDivToPrint" id="print">
                    <div class="panel-body" style="border:1px solid #ccc">
                     <div class="text-center">
                     <h4>INVOICE</h4>
                </div>
                      <div class="col-md-6 ">
                      <p>
                          <div class="name">To</div>
                          <div class="name"><% out.print(usr.getString("fname")+" "+usr.getString("lname")); %></div>
                          <div class="name"><% out.print(usr.getString("address")); %></div>
                          <div class="name"><% out.print(usr.getString("city")); %></div>
                          <div class="name"><% out.print(usr.getString("state")); %></div>
                          <div class="name">Pin : <% out.print(usr.getString("pin")); %></div>
                          <div class="name">Mobile : <% out.print(usr.getString("mobile")); %></div>
                          <br>
                          <div class="name">Order Id : <% out.print(ord.getString("order_id"));} }}%></div>
                      </p>
                    </div>
                      <div class="col-md-6" style="float:right">
                         <h2 style="text-align:right">Shop Street</h2>
                          <div class="company">
                              Shop Street Private Limited
                          </div>
                          <div class="company">
                              Address
                            </div>
                          <div class="company">
                                Place
                          </div>
                          
                      </div>
                       <div class="col-md-12">
                           <table class="table table-bordered">
                               <th>Item Code</th>
                               <th>Item Name</th>
                               <th>Qty</th>
                               <th>MRP</th>
                               <th>Total Discount</th>
                               <th>Sub Total</th>
                           <% ord.beforeFirst();
                                int total=0;
                            while(ord.next())
                            {
                                Statement st0=c.createStatement();
                               ResultSet prd1=st0.executeQuery("select * from tbl_products where id='"+ord.getInt("product_id")+"'");
                                if(prd1.next())
                                {
                                    %>
                                        <tr>
                                            <td>
                                                <% out.print(prd1.getString("product_id"));%>
                                            </td>
            
                                            <td>
                                                <% out.print(prd1.getString("name"));%>
                                                    </td>
                                            <td>
                                                <% out.print(ord.getInt("quantity"));%>
                                                    </td>
                                            <td>
                                                <% out.print(prd1.getInt("unit_price"));%>
                                                    </td>
                                                    <td>
                                                <% out.print((prd1.getInt("unit_price")*ord.getInt("quantity"))-ord.getInt("amount"));%>
                                                    </td>
                                                    <td>
                                                <% out.print(ord.getInt("amount")); total=total+ord.getInt("amount");%>
                                                    </td>
                                            
                                        <tr>
                                        <%
                                }
                            }
                           %>
                           <tr>
                               <td colspan="5" class="text-right">
                                   Total VAT Amount
                               </td>
                               <td>
                                   0.00
                               </td>
                           </tr>
                           <tr>
                               <td colspan="5" class="text-right">
                                   Shipping Charges
                               </td>
                               <td>
                                   0.00
                               </td>
                           </tr>
                           <tr>
                               <td colspan="5" class="text-right">
                                   Total Amount
                               </td>
                               <td>
                                   Rs <% out.print(total); %>
                               </td>
                           </tr>
                           <tr>
                               <td colspan="5" class="text-right">
                                   Grand Total
                               </td>
                               <td>
                                   Rs <% out.print(total); %>
                               </td>
                           </tr>
                           </table>
                           <div>
                           * This is a computer generated bill Invoice and required no signature and stamp
                       </div>
                              </div>
                               </div>
        </div> 
        <div class="col-md-10 col-md-offset-1" style="padding-top:5px">
                          <button id="p-btn" class="btn btn-info" style="width:100%">PRINT</button>
                           </div>
                           <div class="col-md-10 col-md-offset-1" style="padding-top:5px">
                          <a class="qq" href="update_order_status.jsp?id=<% out.print(idd); %>"> <button  class="btn btn-warning" style="width:100%">Delivered</button></a>
                           </div>
                           
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
<%@ include file="footer.jsp" %>
<script>
    $('#p-btn').click(function(){
       window.print();
    });
</script>
<script>
    function printDiv() 
   }
</script>