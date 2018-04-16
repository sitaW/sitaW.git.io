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

<%@ include file = "templates/footer.jsp" %>