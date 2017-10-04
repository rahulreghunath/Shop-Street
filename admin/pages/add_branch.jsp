<%@ include file="header.jsp" %>
  <!-- =============================================== -->

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      <h1>
         Add Branch
      </h1>
      <ol class="breadcrumb">
        <li><a href="index"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Add Branch</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">

      <!-- Default box --> 
      <div class="box">
       
        <div class="box-body">
          <%@ include file="msgbox.jsp" %>
            <form id="form1" class="form-horizontal col-md-10 col-md-offset-2" action="process_add_branch.jsp" method="post">
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Branch Name</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="name" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Reg.no</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="regno" class="form-control" >
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Address</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="address" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Phone Number</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="phone" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Mobile</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="mobile" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Place</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="place" id="autocomplete" onFocus="geolocate()" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">State</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="state" id="administrative_area_level_1" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Pin Code</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="pin" id="postal_code" class="form-control">
                    </div>
                </div>
                <div class="form-group">
                   <% Random no=new Random(); int num=no.nextInt(9000)+10000;
                       String user="USR"+String.valueOf(num); 
                       Statement st1=c.createStatement();
                       ResultSet id=st1.executeQuery("select * from tbl_login where username='"+user+"'");
                       if(id.next())
                       {
                            num=no.nextInt(9000)+10000;
                            user="PRDT"+String.valueOf(num); 
                        }
                        Random pw=new Random(); int pd=pw.nextInt(90000)+10000;
                        String pwd="PWD"+String.valueOf(pd); 
                       %>
                    <label class="control-label col-md-2 col-xs-2">Username</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="username" value="<% out.print(user); %>" readonly class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-md-2 col-xs-2">Password</label>
                    <div class="col-md-5 col-xs-10">
                        <input type="text" name="password" value="<%=pwd %>" readonly class="form-control">
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-5 col-xs-10 col-md-offset-2">
                        <button class="btn btn-success" style="width:100%">ADD BRANCH</button>
                    </div>
                </div>
                
                <input type="hidden" id="country">
                <input type="hidden" class="field" id="route" disabled="true">
                 <input type="hidden" class="field" id="street_number" disabled="true">
                 <input type="hidden" class="field" id="locality"disabled="true">
            </form>
        </div> 
        <!-- /.box-footer-->
      </div>
      <!-- /.box -->

    </section>
    <!-- /.content -->
  </div>
  <script>
        // google auto complete API
      var placeSearch, autocomplete;
      var componentForm = {
        street_number: 'short_name',
        route: 'long_name',
        locality: 'long_name',
        administrative_area_level_1: 'long_name',
        country: 'long_name',
        postal_code: 'short_name'
      };

      function initAutocomplete() {
        // Create the autocomplete object, restricting the search to geographical
        // location types.
        autocomplete = new google.maps.places.Autocomplete(
            /** @type {!HTMLInputElement} */(document.getElementById('autocomplete')),
            {types: ['geocode']});

        // When the user selects an address from the dropdown, populate the address
        // fields in the form.
        autocomplete.addListener('place_changed', fillInAddress);
      }

      function fillInAddress() {
        // Get the place details from the autocomplete object.
        var place = autocomplete.getPlace();

        for (var component in componentForm) {
          document.getElementById(component).value = '';
          document.getElementById(component).disabled = false;
        }

        // Get each component of the address from the place details
        // and fill the corresponding field on the form.
        for (var i = 0; i < place.address_components.length; i++) {
          var addressType = place.address_components[i].types[0];
          if (componentForm[addressType]) {
            var val = place.address_components[i][componentForm[addressType]];
            document.getElementById(addressType).value = val;
          }
        }
      }

    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDfO40iueprTDv0WCf0BCIlbj56JO-HylA&libraries=places&callback=initAutocomplete"
            async defer></script>
<%@ include file="footer.jsp" %>
<script>
    $(document).ready(function() {
            $('#form1').bootstrapValidator({
            fields: { 
            'name': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Branch Name is required and can\'t be empty'
                    } } },
            'regno': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Branch Registration Number is required and can\'t be empty'
                    },
                            stringLength: {
                    min: 3,
                    message: 'The Branch Registration Number must be more than 2 characters long'
                }} },
            'address': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Branch Address is required and can\'t be empty'
                    },stringLength: {
                    max: 500,
                    message: 'The Branch Address must be less than 500 characters long'
                } } },
            'phone': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Phone Number is required and can\'t be empty'
                    },stringLength: {
                    max: 11,
                    message: 'The Phone Number must be less than 11 characters long'
                },regexp: {
                        regexp: /^[0-9 ]+$/,
                        message: 'Enter a valid Phone Number'
                    } } },
            'mobile': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Mobile Number is required and can\'t be empty'
                    },regexp: {
                        regexp: /^([0|\+[9][1]{1,5})?([7-9][0-9]{9})$/,
                        message: 'Enter a valid Mobile Number'
                    } } },
            'place': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Place is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[a-zA-Z,. ]+$/,
                        message: 'Enter a valid Place'
                    } } },
            'state': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The State is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[a-zA-Z,. ]+$/,
                        message: 'Enter a valid State'
                    } } },
            'pin': {
            verbose: false,
                validators: {notEmpty: {
                        message: 'The Pin Code is required and can\'t be empty'
                    },regexp: {
                        regexp: /^[1-9][0-9]{5}$/,
                        message: 'Enter a valid Pin Code'
                    } } }}
            });
            });

</script>