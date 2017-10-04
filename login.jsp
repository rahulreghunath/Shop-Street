<%@ page import="java.sql.*"%>
<%@ page import="javax.sql.*"%>
<%@ page import="java.io.*"%>

<%@ page import="java.util.*"%>
<% Class.forName("com.mysql.jdbc.Driver");
Connection c=DriverManager.getConnection("jdbc:mysql://localhost:3306/db_spare","root",""); %>
<!doctype html>
<html xmlns="https://www.w3.org/1999/xhtml" dir="ltr" lang="en">
<head>
<title>Login : Zen Cart!, The Art of E-commerce</title>
<meta charset="utf-8">
<meta name="keywords" content="HELMETS MEN'S GEAR WOMEN’S GEAR Kids' gear ACCESSORIES PARTS TIRES BRANDS CLOSEOUTS Lighting ecommerce, open source, shop, online shopping, store Login">
<meta name="description" content="Zen Cart! : Login - HELMETS MEN'S GEAR WOMEN’S GEAR Kids' gear ACCESSORIES PARTS TIRES BRANDS CLOSEOUTS Lighting ecommerce, open source, shop, online shopping, store">
<meta name="author" content="The Zen Cart&reg; Team and others" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="generator" content="shopping cart program by Zen Cart&reg;, https://www.zen-cart.com eCommerce">
<meta name="robots" content="noindex, nofollow" />
<script type="text/javascript">
//<![CDATA[
try{if (!window.CloudFlare) {var CloudFlare=[{verbose:0,p:0,byc:0,owlid:"cf",bag2:1,mirage2:0,oracle:0,paths:{cloudflare:"/cdn-cgi/nexp/dok3v=1613a3a185/"},atok:"595004da6bd7624a1ad7f85645f9ef9f",petok:"dec2228a2c4ffdce4c5bbb69701e7795f32c3d75-1493917190-1800",zone:"template-help.com",rocket:"0",apps:{"abetterbrowser":{"ie":"7"}}}];!function(a,b){a=document.createElement("script"),b=document.getElementsByTagName("script")[0],a.async=!0,a.src="//ajax.cloudflare.com/cdn-cgi/nexp/dok3v=85b614c0f6/cloudflare.min.js",b.parentNode.insertBefore(a,b)}()}}catch(e){};
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
<!--ase href="https://livedemo00.template-help.com/zencart_54030/">-->
<script language="javascript" type="text/javascript"><!--

function update_zone(theForm) {
  // if there is no zone_id field to update, or if it is hidden from display, then exit performing no updates
  if (!theForm || !theForm.elements["zone_id"]) return;
  if (theForm.zone_id.type == "hidden") return;

  // set initial values
  var SelectedCountry = theForm.zone_country_id.options[theForm.zone_country_id.selectedIndex].value;
  var SelectedZone = theForm.elements["zone_id"].value;

  // reset the array of pulldown options so it can be repopulated
  var NumState = theForm.zone_id.options.length;
  while(NumState > 0) {
    NumState = NumState - 1;
    theForm.zone_id.options[NumState] = null;
  }
  // build dynamic list of countries/zones for pulldown
  if (SelectedCountry == "13") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Australian Capital Territory", "182");
    theForm.zone_id.options[2] = new Option("New South Wales", "183");
    theForm.zone_id.options[3] = new Option("Northern Territory", "184");
    theForm.zone_id.options[4] = new Option("Queensland", "185");
    theForm.zone_id.options[5] = new Option("South Australia", "186");
    theForm.zone_id.options[6] = new Option("Tasmania", "187");
    theForm.zone_id.options[7] = new Option("Victoria", "188");
    theForm.zone_id.options[8] = new Option("Western Australia", "189");
    hideStateField(theForm);
  } else if (SelectedCountry == "14") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Burgenland", "102");
    theForm.zone_id.options[2] = new Option("Kärnten", "99");
    theForm.zone_id.options[3] = new Option("Niederösterreich", "96");
    theForm.zone_id.options[4] = new Option("Oberösterreich", "97");
    theForm.zone_id.options[5] = new Option("Salzburg", "98");
    theForm.zone_id.options[6] = new Option("Steiermark", "100");
    theForm.zone_id.options[7] = new Option("Tirol", "101");
    theForm.zone_id.options[8] = new Option("Voralberg", "103");
    theForm.zone_id.options[9] = new Option("Wien", "95");
    hideStateField(theForm);
  } else if (SelectedCountry == "38") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Alberta", "66");
    theForm.zone_id.options[2] = new Option("British Columbia", "67");
    theForm.zone_id.options[3] = new Option("Manitoba", "68");
    theForm.zone_id.options[4] = new Option("New Brunswick", "70");
    theForm.zone_id.options[5] = new Option("Newfoundland", "69");
    theForm.zone_id.options[6] = new Option("Northwest Territories", "72");
    theForm.zone_id.options[7] = new Option("Nova Scotia", "71");
    theForm.zone_id.options[8] = new Option("Nunavut", "73");
    theForm.zone_id.options[9] = new Option("Ontario", "74");
    theForm.zone_id.options[10] = new Option("Prince Edward Island", "75");
    theForm.zone_id.options[11] = new Option("Quebec", "76");
    theForm.zone_id.options[12] = new Option("Saskatchewan", "77");
    theForm.zone_id.options[13] = new Option("Yukon Territory", "78");
    hideStateField(theForm);
  } else if (SelectedCountry == "81") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Baden-Württemberg", "80");
    theForm.zone_id.options[2] = new Option("Bayern", "81");
    theForm.zone_id.options[3] = new Option("Berlin", "82");
    theForm.zone_id.options[4] = new Option("Brandenburg", "83");
    theForm.zone_id.options[5] = new Option("Bremen", "84");
    theForm.zone_id.options[6] = new Option("Hamburg", "85");
    theForm.zone_id.options[7] = new Option("Hessen", "86");
    theForm.zone_id.options[8] = new Option("Mecklenburg-Vorpommern", "87");
    theForm.zone_id.options[9] = new Option("Niedersachsen", "79");
    theForm.zone_id.options[10] = new Option("Nordrhein-Westfalen", "88");
    theForm.zone_id.options[11] = new Option("Rheinland-Pfalz", "89");
    theForm.zone_id.options[12] = new Option("Saarland", "90");
    theForm.zone_id.options[13] = new Option("Sachsen", "91");
    theForm.zone_id.options[14] = new Option("Sachsen-Anhalt", "92");
    theForm.zone_id.options[15] = new Option("Schleswig-Holstein", "93");
    theForm.zone_id.options[16] = new Option("Thüringen", "94");
    hideStateField(theForm);
  } else if (SelectedCountry == "105") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Agrigento", "190");
    theForm.zone_id.options[2] = new Option("Alessandria", "191");
    theForm.zone_id.options[3] = new Option("Ancona", "192");
    theForm.zone_id.options[4] = new Option("Aosta", "193");
    theForm.zone_id.options[5] = new Option("Aquila", "233");
    theForm.zone_id.options[6] = new Option("Arezzo", "194");
    theForm.zone_id.options[7] = new Option("Ascoli Piceno", "195");
    theForm.zone_id.options[8] = new Option("Asti", "196");
    theForm.zone_id.options[9] = new Option("Avellino", "197");
    theForm.zone_id.options[10] = new Option("Bari", "198");
    theForm.zone_id.options[11] = new Option("Barletta Andria Trani", "199");
    theForm.zone_id.options[12] = new Option("Belluno", "200");
    theForm.zone_id.options[13] = new Option("Benevento", "201");
    theForm.zone_id.options[14] = new Option("Bergamo", "202");
    theForm.zone_id.options[15] = new Option("Biella", "203");
    theForm.zone_id.options[16] = new Option("Bologna", "204");
    theForm.zone_id.options[17] = new Option("Bolzano", "205");
    theForm.zone_id.options[18] = new Option("Brescia", "206");
    theForm.zone_id.options[19] = new Option("Brindisi", "207");
    theForm.zone_id.options[20] = new Option("Cagliari", "208");
    theForm.zone_id.options[21] = new Option("Caltanissetta", "209");
    theForm.zone_id.options[22] = new Option("Campobasso", "210");
    theForm.zone_id.options[23] = new Option("Carbonia-Iglesias", "211");
    theForm.zone_id.options[24] = new Option("Caserta", "212");
    theForm.zone_id.options[25] = new Option("Catania", "213");
    theForm.zone_id.options[26] = new Option("Catanzaro", "214");
    theForm.zone_id.options[27] = new Option("Chieti", "215");
    theForm.zone_id.options[28] = new Option("Como", "216");
    theForm.zone_id.options[29] = new Option("Cosenza", "217");
    theForm.zone_id.options[30] = new Option("Cremona", "218");
    theForm.zone_id.options[31] = new Option("Crotone", "219");
    theForm.zone_id.options[32] = new Option("Cuneo", "220");
    theForm.zone_id.options[33] = new Option("Enna", "221");
    theForm.zone_id.options[34] = new Option("Fermo", "222");
    theForm.zone_id.options[35] = new Option("Ferrara", "223");
    theForm.zone_id.options[36] = new Option("Firenze", "224");
    theForm.zone_id.options[37] = new Option("Foggia", "225");
    theForm.zone_id.options[38] = new Option("Forlì Cesena", "226");
    theForm.zone_id.options[39] = new Option("Frosinone", "227");
    theForm.zone_id.options[40] = new Option("Genova", "228");
    theForm.zone_id.options[41] = new Option("Gorizia", "229");
    theForm.zone_id.options[42] = new Option("Grosseto", "230");
    theForm.zone_id.options[43] = new Option("Imperia", "231");
    theForm.zone_id.options[44] = new Option("Isernia", "232");
    theForm.zone_id.options[45] = new Option("La Spezia", "234");
    theForm.zone_id.options[46] = new Option("Latina", "235");
    theForm.zone_id.options[47] = new Option("Lecce", "236");
    theForm.zone_id.options[48] = new Option("Lecco", "237");
    theForm.zone_id.options[49] = new Option("Livorno", "238");
    theForm.zone_id.options[50] = new Option("Lodi", "239");
    theForm.zone_id.options[51] = new Option("Lucca", "240");
    theForm.zone_id.options[52] = new Option("Macerata", "241");
    theForm.zone_id.options[53] = new Option("Mantova", "242");
    theForm.zone_id.options[54] = new Option("Massa Carrara", "243");
    theForm.zone_id.options[55] = new Option("Matera", "244");
    theForm.zone_id.options[56] = new Option("Medio Campidano", "245");
    theForm.zone_id.options[57] = new Option("Messina", "246");
    theForm.zone_id.options[58] = new Option("Milano", "247");
    theForm.zone_id.options[59] = new Option("Modena", "248");
    theForm.zone_id.options[60] = new Option("Monza e Brianza", "249");
    theForm.zone_id.options[61] = new Option("Napoli", "250");
    theForm.zone_id.options[62] = new Option("Novara", "251");
    theForm.zone_id.options[63] = new Option("Nuoro", "252");
    theForm.zone_id.options[64] = new Option("Ogliastra", "253");
    theForm.zone_id.options[65] = new Option("Olbia-Tempio", "254");
    theForm.zone_id.options[66] = new Option("Oristano", "255");
    theForm.zone_id.options[67] = new Option("Padova", "256");
    theForm.zone_id.options[68] = new Option("Palermo", "257");
    theForm.zone_id.options[69] = new Option("Parma", "258");
    theForm.zone_id.options[70] = new Option("Pavia", "260");
    theForm.zone_id.options[71] = new Option("Perugia", "259");
    theForm.zone_id.options[72] = new Option("Pesaro Urbino", "261");
    theForm.zone_id.options[73] = new Option("Pescara", "262");
    theForm.zone_id.options[74] = new Option("Piacenza", "263");
    theForm.zone_id.options[75] = new Option("Pisa", "264");
    theForm.zone_id.options[76] = new Option("Pistoia", "265");
    theForm.zone_id.options[77] = new Option("Pordenone", "266");
    theForm.zone_id.options[78] = new Option("Potenza", "267");
    theForm.zone_id.options[79] = new Option("Prato", "268");
    theForm.zone_id.options[80] = new Option("Ragusa", "269");
    theForm.zone_id.options[81] = new Option("Ravenna", "270");
    theForm.zone_id.options[82] = new Option("Reggio Calabria", "271");
    theForm.zone_id.options[83] = new Option("Reggio Emilia", "272");
    theForm.zone_id.options[84] = new Option("Rieti", "273");
    theForm.zone_id.options[85] = new Option("Rimini", "274");
    theForm.zone_id.options[86] = new Option("Roma", "275");
    theForm.zone_id.options[87] = new Option("Rovigo", "276");
    theForm.zone_id.options[88] = new Option("Salerno", "277");
    theForm.zone_id.options[89] = new Option("Sassari", "278");
    theForm.zone_id.options[90] = new Option("Savona", "279");
    theForm.zone_id.options[91] = new Option("Siena", "280");
    theForm.zone_id.options[92] = new Option("Siracusa", "281");
    theForm.zone_id.options[93] = new Option("Sondrio", "282");
    theForm.zone_id.options[94] = new Option("Taranto", "283");
    theForm.zone_id.options[95] = new Option("Teramo", "284");
    theForm.zone_id.options[96] = new Option("Terni", "285");
    theForm.zone_id.options[97] = new Option("Torino", "286");
    theForm.zone_id.options[98] = new Option("Trapani", "287");
    theForm.zone_id.options[99] = new Option("Trento", "288");
    theForm.zone_id.options[100] = new Option("Treviso", "289");
    theForm.zone_id.options[101] = new Option("Trieste", "290");
    theForm.zone_id.options[102] = new Option("Udine", "291");
    theForm.zone_id.options[103] = new Option("Varese", "292");
    theForm.zone_id.options[104] = new Option("Venezia", "293");
    theForm.zone_id.options[105] = new Option("Verbania", "294");
    theForm.zone_id.options[106] = new Option("Vercelli", "295");
    theForm.zone_id.options[107] = new Option("Verona", "296");
    theForm.zone_id.options[108] = new Option("Vibo Valentia", "297");
    theForm.zone_id.options[109] = new Option("Vicenza", "298");
    theForm.zone_id.options[110] = new Option("Viterbo", "299");
    hideStateField(theForm);
  } else if (SelectedCountry == "163") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Palau", "50");
    hideStateField(theForm);
  } else if (SelectedCountry == "195") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("A Coruña", "130");
    theForm.zone_id.options[2] = new Option("Álava", "131");
    theForm.zone_id.options[3] = new Option("Albacete", "132");
    theForm.zone_id.options[4] = new Option("Alicante", "133");
    theForm.zone_id.options[5] = new Option("Almería", "134");
    theForm.zone_id.options[6] = new Option("Asturias", "135");
    theForm.zone_id.options[7] = new Option("Ávila", "136");
    theForm.zone_id.options[8] = new Option("Badajoz", "137");
    theForm.zone_id.options[9] = new Option("Baleares", "138");
    theForm.zone_id.options[10] = new Option("Barcelona", "139");
    theForm.zone_id.options[11] = new Option("Burgos", "140");
    theForm.zone_id.options[12] = new Option("Cáceres", "141");
    theForm.zone_id.options[13] = new Option("Cádiz", "142");
    theForm.zone_id.options[14] = new Option("Cantabria", "143");
    theForm.zone_id.options[15] = new Option("Castellón", "144");
    theForm.zone_id.options[16] = new Option("Ceuta", "145");
    theForm.zone_id.options[17] = new Option("Ciudad Real", "146");
    theForm.zone_id.options[18] = new Option("Córdoba", "147");
    theForm.zone_id.options[19] = new Option("Cuenca", "148");
    theForm.zone_id.options[20] = new Option("Girona", "149");
    theForm.zone_id.options[21] = new Option("Granada", "150");
    theForm.zone_id.options[22] = new Option("Guadalajara", "151");
    theForm.zone_id.options[23] = new Option("Guipúzcoa", "152");
    theForm.zone_id.options[24] = new Option("Huelva", "153");
    theForm.zone_id.options[25] = new Option("Huesca", "154");
    theForm.zone_id.options[26] = new Option("Jaén", "155");
    theForm.zone_id.options[27] = new Option("La Rioja", "156");
    theForm.zone_id.options[28] = new Option("Las Palmas", "157");
    theForm.zone_id.options[29] = new Option("León", "158");
    theForm.zone_id.options[30] = new Option("Lérida", "159");
    theForm.zone_id.options[31] = new Option("Lugo", "160");
    theForm.zone_id.options[32] = new Option("Madrid", "161");
    theForm.zone_id.options[33] = new Option("Málaga", "162");
    theForm.zone_id.options[34] = new Option("Melilla", "163");
    theForm.zone_id.options[35] = new Option("Murcia", "164");
    theForm.zone_id.options[36] = new Option("Navarra", "165");
    theForm.zone_id.options[37] = new Option("Ourense", "166");
    theForm.zone_id.options[38] = new Option("Palencia", "167");
    theForm.zone_id.options[39] = new Option("Pontevedra", "168");
    theForm.zone_id.options[40] = new Option("Salamanca", "169");
    theForm.zone_id.options[41] = new Option("Santa Cruz de Tenerife", "170");
    theForm.zone_id.options[42] = new Option("Segovia", "171");
    theForm.zone_id.options[43] = new Option("Sevilla", "172");
    theForm.zone_id.options[44] = new Option("Soria", "173");
    theForm.zone_id.options[45] = new Option("Tarragona", "174");
    theForm.zone_id.options[46] = new Option("Teruel", "175");
    theForm.zone_id.options[47] = new Option("Toledo", "176");
    theForm.zone_id.options[48] = new Option("Valencia", "177");
    theForm.zone_id.options[49] = new Option("Valladolid", "178");
    theForm.zone_id.options[50] = new Option("Vizcaya", "179");
    theForm.zone_id.options[51] = new Option("Zamora", "180");
    theForm.zone_id.options[52] = new Option("Zaragoza", "181");
    hideStateField(theForm);
  } else if (SelectedCountry == "204") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Aargau", "104");
    theForm.zone_id.options[2] = new Option("Appenzell Ausserrhoden", "106");
    theForm.zone_id.options[3] = new Option("Appenzell Innerrhoden", "105");
    theForm.zone_id.options[4] = new Option("Basel-Landschaft", "108");
    theForm.zone_id.options[5] = new Option("Basel-Stadt", "109");
    theForm.zone_id.options[6] = new Option("Bern", "107");
    theForm.zone_id.options[7] = new Option("Freiburg", "110");
    theForm.zone_id.options[8] = new Option("Genf", "111");
    theForm.zone_id.options[9] = new Option("Glarus", "112");
    theForm.zone_id.options[10] = new Option("Graubnden", "113");
    theForm.zone_id.options[11] = new Option("Jura", "114");
    theForm.zone_id.options[12] = new Option("Luzern", "115");
    theForm.zone_id.options[13] = new Option("Neuenburg", "116");
    theForm.zone_id.options[14] = new Option("Nidwalden", "117");
    theForm.zone_id.options[15] = new Option("Obwalden", "118");
    theForm.zone_id.options[16] = new Option("Schaffhausen", "120");
    theForm.zone_id.options[17] = new Option("Schwyz", "122");
    theForm.zone_id.options[18] = new Option("Solothurn", "121");
    theForm.zone_id.options[19] = new Option("St. Gallen", "119");
    theForm.zone_id.options[20] = new Option("Tessin", "124");
    theForm.zone_id.options[21] = new Option("Thurgau", "123");
    theForm.zone_id.options[22] = new Option("Uri", "125");
    theForm.zone_id.options[23] = new Option("Waadt", "126");
    theForm.zone_id.options[24] = new Option("Wallis", "127");
    theForm.zone_id.options[25] = new Option("Zug", "128");
    theForm.zone_id.options[26] = new Option("Zürich", "129");
    hideStateField(theForm);
  } else if (SelectedCountry == "223") {
    theForm.zone_id.options[0] = new Option("Please select ...", "");
    theForm.zone_id.options[1] = new Option("Alabama", "1");
    theForm.zone_id.options[2] = new Option("Alaska", "2");
    theForm.zone_id.options[3] = new Option("American Samoa", "3");
    theForm.zone_id.options[4] = new Option("Arizona", "4");
    theForm.zone_id.options[5] = new Option("Arkansas", "5");
    theForm.zone_id.options[6] = new Option("Armed Forces Americas", "7");
    theForm.zone_id.options[7] = new Option("Armed Forces Europe", "9");
    theForm.zone_id.options[8] = new Option("Armed Forces Pacific", "11");
    theForm.zone_id.options[9] = new Option("California", "12");
    theForm.zone_id.options[10] = new Option("Colorado", "13");
    theForm.zone_id.options[11] = new Option("Connecticut", "14");
    theForm.zone_id.options[12] = new Option("Delaware", "15");
    theForm.zone_id.options[13] = new Option("District of Columbia", "16");
    theForm.zone_id.options[14] = new Option("Federated States Of Micronesia", "17");
    theForm.zone_id.options[15] = new Option("Florida", "18");
    theForm.zone_id.options[16] = new Option("Georgia", "19");
    theForm.zone_id.options[17] = new Option("Guam", "20");
    theForm.zone_id.options[18] = new Option("Hawaii", "21");
    theForm.zone_id.options[19] = new Option("Idaho", "22");
    theForm.zone_id.options[20] = new Option("Illinois", "23");
    theForm.zone_id.options[21] = new Option("Indiana", "24");
    theForm.zone_id.options[22] = new Option("Iowa", "25");
    theForm.zone_id.options[23] = new Option("Kansas", "26");
    theForm.zone_id.options[24] = new Option("Kentucky", "27");
    theForm.zone_id.options[25] = new Option("Louisiana", "28");
    theForm.zone_id.options[26] = new Option("Maine", "29");
    theForm.zone_id.options[27] = new Option("Marshall Islands", "30");
    theForm.zone_id.options[28] = new Option("Maryland", "31");
    theForm.zone_id.options[29] = new Option("Massachusetts", "32");
    theForm.zone_id.options[30] = new Option("Michigan", "33");
    theForm.zone_id.options[31] = new Option("Minnesota", "34");
    theForm.zone_id.options[32] = new Option("Mississippi", "35");
    theForm.zone_id.options[33] = new Option("Missouri", "36");
    theForm.zone_id.options[34] = new Option("Montana", "37");
    theForm.zone_id.options[35] = new Option("Nebraska", "38");
    theForm.zone_id.options[36] = new Option("Nevada", "39");
    theForm.zone_id.options[37] = new Option("New Hampshire", "40");
    theForm.zone_id.options[38] = new Option("New Jersey", "41");
    theForm.zone_id.options[39] = new Option("New Mexico", "42");
    theForm.zone_id.options[40] = new Option("New York", "43");
    theForm.zone_id.options[41] = new Option("North Carolina", "44");
    theForm.zone_id.options[42] = new Option("North Dakota", "45");
    theForm.zone_id.options[43] = new Option("Northern Mariana Islands", "46");
    theForm.zone_id.options[44] = new Option("Ohio", "47");
    theForm.zone_id.options[45] = new Option("Oklahoma", "48");
    theForm.zone_id.options[46] = new Option("Oregon", "49");
    theForm.zone_id.options[47] = new Option("Pennsylvania", "51");
    theForm.zone_id.options[48] = new Option("Puerto Rico", "52");
    theForm.zone_id.options[49] = new Option("Rhode Island", "53");
    theForm.zone_id.options[50] = new Option("South Carolina", "54");
    theForm.zone_id.options[51] = new Option("South Dakota", "55");
    theForm.zone_id.options[52] = new Option("Tennessee", "56");
    theForm.zone_id.options[53] = new Option("Texas", "57");
    theForm.zone_id.options[54] = new Option("Utah", "58");
    theForm.zone_id.options[55] = new Option("Vermont", "59");
    theForm.zone_id.options[56] = new Option("Virgin Islands", "60");
    theForm.zone_id.options[57] = new Option("Virginia", "61");
    theForm.zone_id.options[58] = new Option("Washington", "62");
    theForm.zone_id.options[59] = new Option("West Virginia", "63");
    theForm.zone_id.options[60] = new Option("Wisconsin", "64");
    theForm.zone_id.options[61] = new Option("Wyoming", "65");
    hideStateField(theForm);
  } else {
    theForm.zone_id.options[0] = new Option("Type a choice below ...", "");
    showStateField(theForm);
  }

  // if we had a value before reset, set it again
  if (SelectedZone != "") theForm.elements["zone_id"].value = SelectedZone;

}

  function hideStateField(theForm) {
    theForm.state.disabled = true;
    theForm.state.className = 'hiddenField';
    theForm.state.setAttribute('className', 'hiddenField');
    document.getElementById("stateLabel").className = 'hiddenField';
    document.getElementById("stateLabel").setAttribute('className', 'hiddenField');
    document.getElementById("stText").className = 'hiddenField';
    document.getElementById("stText").setAttribute('className', 'hiddenField');
    document.getElementById("stBreak").className = 'hiddenField';
    document.getElementById("stBreak").setAttribute('className', 'hiddenField');
  }

  function showStateField(theForm) {
    theForm.state.disabled = false;
    theForm.state.className = 'inputLabel visibleField';
    theForm.state.setAttribute('className', 'visibleField');
    document.getElementById("stateLabel").className = 'inputLabel visibleField';
    document.getElementById("stateLabel").setAttribute('className', 'inputLabel visibleField');
    document.getElementById("stText").className = 'alert visibleField';
    document.getElementById("stText").setAttribute('className', 'alert visibleField');
    document.getElementById("stBreak").className = 'clearBoth visibleField';
    document.getElementById("stBreak").setAttribute('className', 'clearBoth visibleField');
  }
//--></script>
<script language="javascript" type="text/javascript"><!--
var selected;

function check_form_optional(form_name) {
  var form = form_name;
  if (!form.elements['firstname']) {
    return true;
  } else {
    var firstname = form.elements['firstname'].value;
    var lastname = form.elements['lastname'].value;
    var street_address = form.elements['street_address'].value;

    if (firstname == '' && lastname == '' && street_address == '') {
      return true;
    } else {
      return check_form(form_name);
    }
  }
}
var form = "";
var submitted = false;
var error = false;
var error_message = "";

function check_input(field_name, field_size, message) {
  if (form.elements[field_name] && (form.elements[field_name].type != "hidden")) {
    if (field_size == 0) return;
    var field_value = form.elements[field_name].value;

    if (field_value == '' || field_value.length < field_size) {
      error_message = error_message + "* " + message + "\n";
      error = true;
    }
  }
}

function check_radio(field_name, message) {
  var isChecked = false;

  if (form.elements[field_name] && (form.elements[field_name].type != "hidden")) {
    var radio = form.elements[field_name];

    for (var i=0; i<radio.length; i++) {
      if (radio[i].checked == true) {
        isChecked = true;
        break;
      }
    }

    if (isChecked == false) {
      error_message = error_message + "* " + message + "\n";
      error = true;
    }
  }
}

function check_select(field_name, field_default, message) {
  if (form.elements[field_name] && (form.elements[field_name].type != "hidden")) {
    var field_value = form.elements[field_name].value;

    if (field_value == field_default) {
      error_message = error_message + "* " + message + "\n";
      error = true;
    }
  }
}

function check_password(field_name_1, field_name_2, field_size, message_1, message_2) {
  if (form.elements[field_name_1] && (form.elements[field_name_1].type != "hidden")) {
    var password = form.elements[field_name_1].value;
    var confirmation = form.elements[field_name_2].value;

    if (password == '' || password.length < field_size) {
      error_message = error_message + "* " + message_1 + "\n";
      error = true;
    } else if (password != confirmation) {
      error_message = error_message + "* " + message_2 + "\n";
      error = true;
    }
  }
}

function check_password_new(field_name_1, field_name_2, field_name_3, field_size, message_1, message_2, message_3) {
  if (form.elements[field_name_1] && (form.elements[field_name_1].type != "hidden")) {
    var password_current = form.elements[field_name_1].value;
    var password_new = form.elements[field_name_2].value;
    var password_confirmation = form.elements[field_name_3].value;

    if (password_current == '' ) {
      error_message = error_message + "* " + message_1 + "\n";
      error = true;
    } else if (password_new == '' || password_new.length < field_size) {
      error_message = error_message + "* " + message_2 + "\n";
      error = true;
    } else if (password_new != password_confirmation) {
      error_message = error_message + "* " + message_3 + "\n";
      error = true;
    }
  }
}

function check_state(min_length, min_message, select_message) {
  if (form.elements["state"] && form.elements["zone_id"]) {
    if (!form.state.disabled && form.zone_id.value == "") check_input("state", min_length, min_message);
  } else if (form.elements["state"] && form.elements["state"].type != "hidden" && form.state.disabled) {
    check_select("zone_id", "", select_message);
  }
}

function check_form(form_name) {
  if (submitted == true) {
    alert("This form has already been submitted. Please press OK and wait for this process to be completed.");
    return false;
  }

  error = false;
  form = form_name;
  error_message = "Errors have occurred during the processing of your form.\n\nPlease make the following corrections:\n\n";

  check_radio("gender", "Please choose a salutation.");

  check_input("firstname", 2, "Is your first name correct? Our system requires a minimum of 2 characters. Please try again.");
  check_input("lastname", 2, "Is your last name correct? Our system requires a minimum of 2 characters. Please try again.");

  check_input("dob", 10, "Is your birth date correct? Our system requires the date in this format: MM/DD/YYYY (eg 05/21/1970)");

  check_input("email_address", 6, "Is your email address correct? It should contain at least 6 characters. Please try again.");
  check_input("street_address", 5, "Your Address must contain a minimum of 5 characters.");
  check_input("postcode", 4, "Your Post/ZIP Code must contain a minimum of 4 characters.");
  check_input("city", 2, "Your City must contain a minimum of 2 characters.");
  check_state(2, "Your State must contain a minimum of 2 characters.", "Please select a state from the States pull down menu.");

  check_select("country", "", "You must select a country from the Countries pull down menu.");

  check_input("telephone", 3, "Enter a valid Phone number.");

  check_password("password", "confirmation", 7, "Your Password must contain a minimum of 7 characters.", "The Password Confirmation must match your Password.");
  check_password_new("password_current", "password_new", "password_confirmation", 7, "Your Password must contain a minimum of 7 characters.", "Your new Password must contain a minimum of 7 characters.", "The Password Confirmation must match your new Password.");

  if (error == true) {
    alert(error_message);
    return false;
  } else {
    submitted = true;
    return true;
  }
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
<body id="loginBody" onload="update_zone(document.create_account); document.login.email_address.focus();">
  
  
 <div id="page">
<!-- ========== IMAGE BORDER TOP ========== --> 

<!-- BOF- BANNER TOP display -->

    <!-- EOF- BANNER TOP display -->
    
    <!-- ====================================== --> 

    <!-- ========== HEADER ========== -->
      

	<%@ include file="head.jsp" %>



	<!-- ========== CATEGORIES TABS ========= -->
			<!-- ==================================== -->
                
    
    <!-- ============================ -->
  <section>
    <div class="container">
      <div class="row">
        <div class="col-xs-12 col-md-12">
                        <div id="navBreadCrumb" class="breadcrumb">  <a class="home" href="index.jsp"></a>
 <span> Login</span>
</div>
                    </div>
      </div>
    <div class="row">
      <div class="main-col 
      col-sm-9        left_column      col-sm-12 ">
		    <div class="row">
          <div class="center_column col-xs-12 
          col-sm-12 with_col ">
                    
<div class="centerColumn" id="loginDefault">

<div class="heading"><h1>Welcome, Please Sign In</h1></div>

<div class="tie">
	<div class="tie-indent">
	



    <!--BOF normal login-->
<div class="advisory"><strong>Note:</strong> If you have shopped with us before and left something in your cart, for your convenience, the contents will be merged if you log back in.</div>
<div class="form-control-block">
    <form role="form" name="login" action="validate_login.jsp" method="post">    <fieldset class="first">
        <legend>Returning Customers: Please Log In</legend>
    </fieldset>
    <%@ include file="admin/pages/msgbox.jsp" %>
    <div class="form-group">
        <label class="inputLabel" for="login-email-address">Email Address:</label>
        <input type="text" name="email_address" size = "41" maxlength= "96" id="login-email-address" class="form-control" />    </div>
    <div class="form-group">
    <label class="inputLabel" for="login-password">Password:</label>
    <input type="password" name="password" size = "71" maxlength= "255" id="login-password" class="form-control" />    </div>
       <div class="form-group">
        <div class="buttonRow back"><input type="submit" class="btn btn-success add-to-cart" value="Sign In" /></div>
    </div>
    </form>
</div>
<br class="clearBoth" />

    <form role="form" name="create_account" action="registration.jsp" method="post" onsubmit="return check_form(create_account);"><input type="hidden" name="securityToken" value="fbf4ca4cda831d5e268c8d5a296cc03d" /><input type="hidden" name="action" value="process" /><input type="hidden" name="email_pref_html" value="email_format" />    <fieldset class="second">
    <legend>New? Please Provide Your Billing Information</legend>
    </fieldset>
    <div class="information">Create a customer profile with <strong>Shoop Street</strong> .</div>
    
    
<div class="alert forward">* Required information</div>
<br class="clearBoth" />


<fieldset class="address">
<legend>Address Details</legend>

<br class="clearBoth">
<div class="form-group">
    <label class="inputLabel" for="firstname">First Name:  <small>*</small></label>
    <input type="text" name="firstname" size = "33" maxlength = "32" id="firstname" class="form-control" /></div>
<div class="form-group">
    <label class="inputLabel" for="lastname">Last Name:  <small>*</small></label>
    <input type="text" name="lastname" size = "33" maxlength = "32" id="lastname" class="form-control" /></div>
<div class="form-group">
    <label class="inputLabel" for="street-address">Address:  <small>*</small></label>
    <input type="text" name="street_address" size = "41" maxlength= "64" id="street-address" class="form-control" /></div>
    <div class="form-group">
    <label class="inputLabel" for="telephone">Mobile no:  <small>*</small></label>
    <input type="text" pattern="^([0|\+[9][1]{1,5})?([7-9][0-9]{9})" title="10 digit mobile number" name="telephone" size = "33" maxlength = "32" id="telephone" class="form-control" /></div>

<div class="form-group">
    <label class="inputLabel" for="city">City:  <small>*</small></label>
    <input type="text" name="city" size = "33" maxlength = "32" id="city" class="form-control" /></div>

</div>
<div class="form-group">

    <label class="inputLabel" for="state" id="stateLabel">State:  <small id="stText">*</small></label>
    <input type="text" name="state" value="" size = "33" maxlength = "32" id="state"  class="form-control" /><input type="hidden" name="zone_id" /></div>
<div class="form-group">
    <label class="inputLabel" for="postcode">Post/Zip Code:  <small>*</small></label>
    <input type="text" name="postcode" size = "11" maxlength = "10" id="postcode"  class="form-control" /></div>

<fieldset>
    <legend>Login Details</legend>
</fieldset>
<div class="form-group">
    <label class="inputLabel" for="email-address">Email Address:  <small>*</small></label>
    <input type="email" name="email_address" size = "41" maxlength= "96" id="email-address" class="form-control" /></div>
<div class="form-group">
<div class="form-group">
    <label class="inputLabel" for="password-new">Password:  <small>* (at least 7 characters)</small></label>
    <input type="password" name="password" size = "21" maxlength= "255" id="password-new" class="form-control" /></div>
<div class="form-group">
    <label class="inputLabel" for="password-confirm">Confirm Password:  <small>*</small></label>
    <input type="password" name="confirmation" size = "21" maxlength= "255" id="password-confirm" class="form-control" /></div>   
    <div class="buttonRow"><input type="submit" class="btn btn-success add-to-cart" value="Submit the Information" /></div>
    </form>

<!--EOF normal login-->
<div class="clear"></div>
	</div>
</div>

</div>        </div>
      
                </div>
        </div>
           <%@ include file="sidebar.jsp" %>
                </div>  
      <div class="clearfix"></div>
        <!--bof-custom block display-->
          <!-- bof tm custom block -->
<!-- eof tm custom block -->
 
        <!--eof-custom block display--> 
    </div>
  </section> 
<!-- ========== FOOTER ========== -->
   <%@ include file="footer.jsp" %>