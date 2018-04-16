<%@ include file = "templates/header.jsp" %>
<div class="container-fluid">
<div id="myCarousel" class="carousel slide" data-ride="carousel">
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
    <li data-target="#myCarousel" data-slide-to="1"></li>
  
  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner">
    <div class="item active">
      <img src="${pageContext.request.contextPath}/Resources/scroll/trend1.jpg" alt="trend1" style="transform:scale(0.7,0.7) translate(10px,-900px);">
    </div>

    <div class="item">
      <img src="${pageContext.request.contextPath}/Resources/scroll/trend2.jpg" alt="trend2" style="transform:scale(0.7,0.7) translate(10px,-825px);">
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