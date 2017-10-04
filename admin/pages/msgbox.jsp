<% if(session.getAttribute("message")!=null)
          { %>
           <div class="alert alert-success alert-dismissible" id='hideMe'>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <h4><i class="icon fa fa-check"></i>Success!</h4>
        <% out.print(session.getAttribute("message")); %>
    </div><%
           session.setAttribute("message",null); } %>
           <% if(session.getAttribute("error")!=null)
          { %>
           <div class="alert alert-danger alert-dismissible">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <% out.print(session.getAttribute("error")); %>
    </div><%
           session.setAttribute("error",null); } %>
           <style>
#hideMe {
    z-index: 2;
    position: fixed;
    bottom: 10px;
    right: 10px;
    animation-name: cssAnimation;
    animation-duration: 20s;
}
#hideMe:hover {
    opacity: 1;
}
@keyframes cssAnimation {
     0%   { opacity: 1; }
    100%  { opacity: 0; }
    
}
@-webkit-keyframes cssAnimation {
     50%   { opacity: 1; }
    100%  { opacity: 0; }
}
</style>
<script>
    setTimeout( function(){ 
    $('.close').click();
  }  , 20000 );
</script>