<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root",""); %>
<!doctype html>
<html xmlns="https://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head>
<title>The Shopping Cart : Zen Cart!, The Art of E-commerce</title>
<meta charset="utf-8">
<meta name="keywords" content="HELMETS MEN'S GEAR WOMEN’S GEAR Kids' gear ACCESSORIES PARTS TIRES BRANDS CLOSEOUTS Lighting ecommerce, open source, shop, online shopping, store The Shopping Cart">
<meta name="description" content="Zen Cart! : The Shopping Cart - HELMETS MEN'S GEAR WOMEN’S GEAR Kids' gear ACCESSORIES PARTS TIRES BRANDS CLOSEOUTS Lighting ecommerce, open source, shop, online shopping, store">
<meta name="author" content="The Zen Cart&reg; Team and others" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="generator" content="shopping cart program by Zen Cart&reg;, https://www.zen-cart.com eCommerce">
<meta name="robots" content="noindex, nofollow" />
<script type="text/javascript">
//<![CDATA[
try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:0,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok3v=1613a3a185/"},atok:"f48322f909043fb94d23025e49e0f8dd",petok:"ea1cb425ca9ae484b83321614f603db35d184310-1493534401-1800",zone:"template-help.com",rocket:"0",apps:{"abetterbrowser":{"ie":"7"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=85b614c0f6/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
//]]>
</script>
<link rel="icon" href="favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700&amp;subset=latin,cyrillic-ext,latin-ext,cyrillic' rel='stylesheet' type='text/css'>
<link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="css/stylesheet_bootstrap.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_bootstrap_theme.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_categories.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_custom.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_font-awesome.min.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_lightbox-0.5.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_mega_menu.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_product_list.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_responsive.css" />
<link rel="stylesheet" type="text/css" href="css/stylesheet_suggestionbox.css" />
<script type="text/javascript" src="jscript/jscript_jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.carouFredSel-6.2.1-packed.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.elevateZoom-3.0.8.min.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.matchHeight.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.mousewheel.min.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.nivo.slider.pack.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.simplr.smoothscroll.min.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.touchSwipe.min.js"></script>
<script type="text/javascript" src="jscript/jscript_jquery.ui.totop.js"></script>
<script type="text/javascript" src="jscript/jscript_menu_top.js"></script>
<script type="text/javascript" src="jscript/jscript_script_bootstrap.js"></script>
<script type="text/javascript" src="jscript/jscript_stotal-storage.min.js"></script>
<script type="text/javascript" src="jscript/jscript_suggestionbox.js"></script>
<script type="text/javascript" src="jscript/jscript_top.js"></script>
<script type="text/javascript" src="jscript/jscript_xeasyTooltip.js"></script>
<script type="text/javascript" src="jscript/jscript_xjquery.easing.1.3.js"></script>
<script type="text/javascript" src="jscript/jscript_xjquery.jqtransform.js"></script>
<script type="text/javascript" src="jscript/jscript_xjquery.lightbox-0.5.js"></script>
<script type="text/javascript" src="jscript/jscript_xjscript_script.app.js"></script>
<!--<base href="https://livedemo00.template-help.com/zencart_54030/">-->
<script language="javascript" src="includes/general.js" type="text/javascript"></script>
<script language="javascript" type="text/javascript"><!--
function popupWindow(url) {
  window.open(url,'popupWindow','toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbars=yes,resizable=yes,copyhistory=no,width=550,height=550,screenX=150,screenY=100,top=100,left=150')
}
//--></script>
<script language="javascript" type="text/javascript"><!--
function session_win() {
  window.open("https://livedemo00.template-help.com/zencart_54030/index.php?main_page=info_shopping_cart&amp;zenid=9696a5ofv9stduqhbbs57ntkk4","info_shopping_cart","height=460,width=430,toolbar=no,statusbar=no,scrollbars=yes").focus();
}
//--></script>

<!--[if IE]>
<script type="text/javascript" src="catalog/view/javascript/jquery/fancybox/jquery.fancybox-1.3.4-iefix.js"></script>
<![endif]-->
<!--[if lt IE 8]><div style='clear:both;height:59px;padding:0 15px 0 15px;position:relative;z-index:10000;text-align:center;'><a href="https://www.microsoft.com/windows/internet-explorer/default.aspx?ocid=ie6_countdown_bannercode"><img src="https://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." /></a></div><![endif]-->

<div id="fb-root"></div>
<script>(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/en_GB/all.js#xfbml=1";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));</script> 
<script src="//assets.pinterest.com/js/pinit.js"></script> 
<script src="https://apis.google.com/js/plusone.js"></script> 

<script>

  $(document).ready(function() {
  	var origsrc = $("#productMainImage span img").attr("src");
  	$("#productAdditionalImages .additionalImages span img").click(
  	function () {
  		$("#productMainImage span img").attr('src', this.src);
  	});
  });
  $(document).ready(function(){
    $('.main-image #productMainImage .image a img').elevateZoom({
      easing : true,
      zoomWindowFadeIn: 500,
      zoomWindowFadeOut: 500,
      lensFadeIn: 500,
      lensFadeOut: 500
    });
  });
  $(document).ready(function() {
    var origsrc = $("#productMainImage span img").attr("src");
    var orighref = $("#productMainImage span a").attr("href");
  $("#productAdditionalImages .additionalImages span img").click();
  $("#productAdditionalImages .additionalImages span img").click(
    function () {
    $("#productMainImage span.image a").attr('href', this.src);
    $('.main-image #productMainImage .image a img').elevateZoom({
        easing : true,
        zoomWindowFadeIn: 500,
        zoomWindowFadeOut: 500,
        lensFadeIn: 500,
        lensFadeOut: 500
      });
    });
  });
</script>

 

</head>
<body id="shoppingcartBody">
  
  
 <div id="page">
<!-- ========== IMAGE BORDER TOP ========== --> 

<!-- BOF- BANNER TOP display -->

    <!-- EOF- BANNER TOP display -->
    
    <!-- ====================================== --> 

    <!-- ========== HEADER ========== -->
      



    <%@ include file="head.jsp" %>