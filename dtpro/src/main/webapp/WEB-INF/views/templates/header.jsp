<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <title>HOUSE PROUD</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  
        <link data-stencil-stylesheet="" href="http://cdn7.bigcommerce.com/s-lrtxs9ls/stencil/c5fd9e50-e50c-0135-c507-525400970412/e/4b631870-c5d3-0135-a411-525400970412/css/theme-e8cb0380-e50c-0135-1a53-525400970412.css" rel="stylesheet">
        <style>a{text-decoration:none !important;}</style>
        <!-- snippet location htmlhead -->
   <style data-olark="true" type="text/css">.olark-key,#hbl_code,#olark-data{display: none !important;}</style>
   <style data-olark="true" type="text/css">@media print {#habla_beta_container_do_not_rely_on_div_classes_or_names {display: none !important}}</style>
   <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css" rel="stylesheet">
   
   <style type="text/css" id="ju_CSSJS_default">.ju_Con{text-align:left;z-index:999999;top:0px;left:0px;display:none;font-family:Arial, Helvetica, sans-serif;width:100%;position:absolute;position:fixed; box-sizing:content-box;line-height: normal;-moz-transition: none;-webkit-transition: none;-o-transition: color 0 ease-in;transition: none;} .ju_overlay {text-align: center; display: none; -webkit-transform: translateZ(0); position: fixed; left: 0%; top: 0%; width: 100%; height: 100%; z-index: 999998; background-position: center center; background-repeat: no-repeat; background-size: cover;}.ju_overlay:before {content: '';height: 100%;display: inline-block;vertical-align: middle;} .ju_iframe{border:none !important;width:100%;height:100% !important;display: block;opacity:0;} .ju_inpage_con {padding:0 !important;} .ju_inpage_back {background-position: center center; background-repeat: no-repeat; background-size: cover;} .ju_hideall {display:none !important;} </style>
   <style type="text/css" id="ju_CSSJS_default">.ju_preview_3 {white-space: nowrap;font-family: "Helvetica Neue", Helvetica, Arial, sans-serif; font-weight:500; line-height: 1.428571429; background-color: #fff;text-rendering: optimizeLegibility !important;-webkit-font-smoothing: antialiased !important;display:none; z-index:999996; position: absolute; position: fixed;  color: white; text-align: center;  cursor: pointer;  }  .ju_preview_3.ju-tab-on-off-1 {    display: block; }  .ju_preview_3.ju-tab-size-0 {    padding: 10px; }  .ju_preview_3.ju-tab-size-1 {    padding: 20px; }  .ju_preview_3.ju-tab-size-2 {    padding: 30px; }  .ju_preview_3.ju-tab-size-3 {    padding: 10px 0; }  .ju_preview_3.ju-tab-corners-0.ju-tab-location-0 {    -webkit-border-radius: 5px 5px 0px 0px;    border-radius: 5px 5px 0px 0px; }  .ju_preview_3.ju-tab-corners-0.ju-tab-location-1 {    -webkit-border-radius: 0px 0px 5px 5px;    border-radius: 0px 0px 5px 5px; }  .ju_preview_3.ju-tab-corners-0.ju-tab-location-2 {    -webkit-border-radius: 0px 0px 5px 5px;    border-radius: 0px 0px 5px 5px; }  .ju_preview_3.ju-tab-corners-0.ju-tab-location-3 {    -webkit-border-radius: 5px 5px 0px 0px;    border-radius: 5px 5px 0px 0px; }  .ju_preview_3.ju-tab-shadow-1.ju-tab-location-0, .ju_preview_3.ju-tab-shadow-1.ju-tab-location-3 {    -webkit-box-shadow: 0px -1px 5px 1px rgba(0, 0, 0, 0.5);    box-shadow: 0px -1px 5px 1px rgba(0, 0, 0, 0.5); }  .ju_preview_3.ju-tab-shadow-2.ju-tab-location-0, .ju_preview_3.ju-tab-shadow-2.ju-tab-location-3 {    -webkit-box-shadow: -2px -1px 5px 1px rgba(0, 0, 0, 0.5);    box-shadow: -2px -1px 5px 1px rgba(0, 0, 0, 0.5); }  .ju_preview_3.ju-tab-shadow-1.ju-tab-location-1, .ju_preview_3.ju-tab-shadow-1.ju-tab-location-2 {    -webkit-box-shadow: 0px 1px 5px 1px rgba(0, 0, 0, 0.5);    box-shadow: 0px 1px 5px 1px rgba(0, 0, 0, 0.5); }  .ju_preview_3.ju-tab-shadow-2.ju-tab-location-1, .ju_preview_3.ju-tab-shadow-2.ju-tab-location-2 {    -webkit-box-shadow: -2px 1px 5px 1px rgba(0, 0, 0, 0.5);    box-shadow: -2px 1px 5px 1px rgba(0, 0, 0, 0.5); }.ju_preview_3:hover {filter: brightness(1.1); -webkit-filter: brightness(1.1); -moz-filter: brightness(1.1); -o-filter: brightness(1.1);}#ju_custom_close_btn {color:#fff;line-height: 24px !important; z-index:999997; position: absolute !important; font-size: 14px !important; text-decoration: none !important; font-family:Arial !important;height:24px !important;width:24px !important;text-align: center !important;font-weight: 500 !important;}#ju_custom_open_btn {color:#fff;display:none; z-index:999997; position: fixed; padding: 5px;font-size: 11px; font-weight: bold; color: #fff; text-decoration: none; font-family:Arial !important;}#ju_bbox * {-webkit-box-sizing: initial !important;-moz-box-sizing: initial !important;box-sizing: initial !important;margin:0px !important;padding:0px !important;} </style>
   <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
   
</head>
<body>
<header class="header" role="banner">
<div class="grid-x   align-center align-middle  show-for-small-only ">
	<div class="cell auto ">
	</div>
 <div class="cell shrink "><div class="header-logo"><a href="http://www.shopHouseProud.com/">
    <img class="header-logo-image hide-for-small-only" src="${pageContext.request.contextPath}/Resources/scroll/logo.jpg" alt="HouseProud" title="HouseProud">
     <img class="header-logo-image show-for-small-only" src="${pageContext.request.contextPath}/Resources/scroll/logo.jpg" alt="HouseProud" title="HouseProud">
</a>
</div>
</div>
  
  <div class="cell auto ">
	  <!-- SEARCH/ACCOUNT GRID -->
	  <div class="grid-x grid-padding-x grid-padding-y align-center align-middle">
	  	<!-- search form cell -->
	  	<div class="cell auto">
		       
	  	</div><!-- ./search form-->
	 	
	 	<!-- account/cart -->
	  	<div class="cell auto">
		  	
		 	<ul class="usernav">  
	 
        <li class=" ">
            <a class=" " data-cart-preview="" data-dropdown="cart-preview-dropdown" data-options="align:right" href="/cart.php">
               <i class="fa fa-shopping-cart fa-lg" aria-hidden="false"></i>   
            </a>
         </li>
</ul> 

	  </div><!-- ./account/cart-->
	  
	  </div><!-- ./saerch-account grid -->
	
  </div><!-- ./cell-->
  
</div><!-- ./xygrid-->
    
    
<div class="grid-x   align-center align-middle grid-padding-x grid-padding-y hide-for-small-only">
	
  <div class="cell small-4  "> 
	  <form class="qwiksearch" action="#">     
		   <div class="grid-x grid-margin-x ">
		   	<div class="cell auto" style="padding-left:0px"> 
			   <input style="margin-left:0px" class="qwiksearch__text" onkeyup="searchProduct(event)" placeholder="Search Product" autocomplete="off">  
	  		</div>
	  		<div class="cell shrink"> 
		  		<button class="qwiksearch__btn" type="submit">
		  		<i class="fa fa-search fa-lg" aria-hidden="true"></i>
		  		</button>
       		</div>
		 </div>
      </form>
</div>
   <div class="cell small-4 "><div class="header-logo"><a href="http://www.shophouseproud.com/">
     <img class="header-logo-image hide-for-small-only" src="${pageContext.request.contextPath}/Resources/scroll/Logo.jpg" alt="logo" style="width:150px;height:120px">
     <img class="header-logo-image show-for-small-only" src="${pageContext.request.contextPath}/Resources/scroll/Logo.jpg" alt="logo" style="width:150px;height:120px">
</a>
</div>
</div>
  
  <div class="cell small-4 ">
	  <!-- SEARCH/ACCOUNT GRID -->
	  <div class="grid-x grid-padding-x grid-padding-y align-center align-middle">
	  	<!-- search form cell -->
	  	<div class="cell auto">
		       
	  	</div><!-- ./search form-->
	 	
	 	<!-- account/cart -->
	  	<div class="cell shrink">
		  	
		 	<ul class="usernav" style="color:grey !important">  
    <c:if test="${pageContext.request.userPrincipal.name==null}">
      <li><a  style="color:grey !important" href="registerUser"><span class="glyphicon glyphicon-user"></span>Sign Up</a></li>
      <li><a  style="color:grey !important" href="login"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </c:if>
    <c:if test="${pageContext.request.userPrincipal.name!=null}">
      <li><a style="color:grey !important" href="#"><span class="glyphicon glyphicon-user"></span>Welcome ${pageContext.request.userPrincipal.name}</a></li>
      <li><a style="color:grey !important" href="<c:url value="/j_spring_security_logout"/>"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
      <li class=" ">
            <a style="color:grey !important" href="cart" data-cart-preview="" data-dropdown="cart-preview-dropdown" data-options="align:right" href="/cart.php">
               <i class="fa fa-shopping-cart fa-lg" aria-hidden="false"></i>  <span class="countPill cart-quantity">0</span>
            </a>
 
        </li>
      </c:if>
</ul> 

	  </div><!-- ./account/cart-->
	  
	  </div><!-- ./saerch-account grid -->
	
  </div><!-- ./cell-->
  
</div><!-- ./xygrid-->


<div class="dropdown-menu" id="cart-preview-dropdown" data-dropdown-content="" aria-hidden="true"></div>
 
 
      
    <div class="navPages-container" id="menu" data-menu="" aria-hidden="true">
        <nav class="navPages">
    <div class="navPages-quickSearch">
        <div class="container">
    <!-- snippet location forms_search -->
    <form class="form" action="/search.php">
        <fieldset class="form-fieldset">
            <div class="form-field">
                <label class="is-srOnly" for="search_query">Search</label>
                <input class="form-input" data-search-quick="" name="search_query" id="search_query" data-error-message="Search field cannot be empty." placeholder="Search HouseProud" autocomplete="off">
            </div>
        </fieldset>
    </form>
    <section class="quickSearchResults" data-bind="html: results"></section>
</div>
    </div>
</nav>
</div>
</header>
<nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Home</a></li>
       <security:authorize access="hasRole('ROLE_ADMIN')">
        <li><a href="/dtpro/admin/adding">Admin</a></li>
       </security:authorize>
       <security:authorize access="hasRole('ROLE_USER')">
       <li><a href="/dtpro/user/listProducts">Products</a></li>
       </security:authorize>
       <security:authorize access="hasRole('ROLE_ADMIN')">
      <li><a class="dropdown-toggle" data-toggle="dropdown" href="#">Admin List <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <li><a href="/dtpro/admin/showProducts">Products</a></li>
          <li><a href="/dtpro/admin/showCategory">Category</a></li>
          <li><a href="/dtpro/admin/showSuppliers">Supplier</a></li>
        </ul>
      </li>
    </security:authorize>
    </ul>
    
  </div>
</nav>