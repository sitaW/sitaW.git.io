<%@ include file = "templates/header.jsp" %>
<div class="container-fluid">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
    <li data-target="#myCarousel" data-slide-to="2"></li>
    <li data-target="#myCarousel" data-slide-to="3"></li>
    <li data-target="#myCarousel" data-slide-to="4"></li>   
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="${pageContext.request.contextPath}/Resources/scroll/img1.jpg" alt="img1" style="width:100%;height:400px">
    </div>

    <div class="item">
      <img src="${pageContext.request.contextPath}/Resources/scroll/img2.jpg" alt="img2" style="width:100%;height:400px">
    </div>

    <div class="item">
      <img src="${pageContext.request.contextPath}/Resources/scroll/img3.jpg" alt="img3" style="width:100%;height:400px">
    </div>
    
    <div class="item">
      <img src="${pageContext.request.contextPath}/Resources/scroll/img4.jpg" alt="img4" style="width:100%;height:400px">
    </div>
    
    <div class="item">
      <img src="${pageContext.request.contextPath}/Resources/scroll/img5.jpg" alt="img5" style="width:100%;height:400px">
    </div>
  </div>

  <!-- Left and right controls -->
  <a class="left carousel-control" href="#myCarousel" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#myCarousel" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right"></span>
    <span class="sr-only">Next</span>
  </a>
</div>
  </div>
<style>
h2{font-weight:700}
.wel{position: relative;text-align: center;padding: 100px 15px 100px;width: 100%; color:#eee}
.wel h1{font-weight:700; color:#fff}
.brk{height:4px; border-radius:4px; background:#d9534f; margin:25px auto; display:block; width:60px} 
/* who we */
.who-we{margin-top:50px; margin-bottom:50px}
.who-we h2{color:grey;} 
/* media */
@media (min-width:768px) { 
.wel{position:absolute; top:50%; transform:translateY(-50%); -moz-transform:translateY(-50%); -webkit-transform: translateY(-50%); -ms-transform: translateY(-50%); padding: 0 50px;}
.wel-info{max-width:850px; margin-left:auto; margin-right:auto}
who-we h2{font-size:42px} .wel h1{font-size:65px} header .wel{font-size:26px} 
}
</style>
<div class="container-fluid">

<div class="who-we">

<div class="wel-info text-center">

<h2>About Us</h2>

<p>HouseProoud is passionate about interiors and design.

Our collection included very selective pieces from some of the prominent global designers, manufacturers and brands, known globally for their style and flair. 

We offer an eclectic range and cater to those proud of their homes. Some of the product ranges on offer are:
</p>
<ul class="list-unstyled">
<li>Furniture</li>
<li>Home Furnishings</li>
<li>Floor Coverings</li>
<li>Home Accessories</li>
<li>Decorative Items</li>
</ul>


</div>
</div>
</div>
<%@ include file = "templates/footer.jsp" %>