<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ include file="templates/header.jsp" %>
	<style> 
				input[type=text] {
				    width: 130px;
				    box-sizing: border-box;
				    border: 2px solid #ccc;
				    border-radius: 4px;
				    font-size: 16px;
				    background-color: white;
				    background-image: url('searchicon.png');
				    background-position: 10px 10px; 
				    background-repeat: no-repeat;
				    padding: 12px 20px 12px 40px;
				    -webkit-transition: width 0.4s ease-in-out;
				    transition: width 0.4s ease-in-out;
				}
				
				input[type=text]:focus {
				    width: 160px;
				}
				.text-pattern{
					white-space: nowrap; 
				    width: 100%; 
				    overflow: hidden;
				    text-overflow: ellipsis; 
				}
				</style>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">

    <div class="container-fluid">
	        <h3 class="well well-default">Purchase Products</h3>
    </div>
<div class="container">
    
</div>
<div class="container-fluid">
	
    <div class="row">
    
        <div class="col-12 col-md-3 col-sm-3">
            <!-- <div class="card bg-light mb-3">
                <div class="card-header bg-primary text-white text-uppercase"><i class="fa fa-list"></i> Categories</div>
                <ul class="list-group category_block">
                    <li class="list-group-item"><a href="category.html">Cras justo odio</a></li>
                    <li class="list-group-item"><a href="category.html">Dapibus ac facilisis in</a></li>
                    <li class="list-group-item"><a href="category.html">Morbi leo risus</a></li>
                    <li class="list-group-item"><a href="category.html">Porta ac consectetur ac</a></li>
                    <li class="list-group-item"><a href="category.html">Vestibulum at eros</a></li>
                </ul>
            </div> -->
            <!-- <div class="card bg-light mb-3">
                <div class="card-header bg-success text-white text-uppercase">Last product</div>
                <div class="card-body">
                    <img class="img-fluid" src="https://dummyimage.com/600x400/55595c/fff" />
                    <h5 class="card-title">Product title</h5>
                    <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                    <p class="bloc_left_price">99.00 $</p>
                </div>
            </div> -->
        </div>
     
        <div class="col-12 col-md-9 col-sm-9">
		        <div class="row">
		        <div class="col-12">
		            <nav aria-label="breadcrumb">
						<h2 id="displayCount"></h2>
		            </nav>
		        </div>
		    </div>
		    <br>
            <div class="row" id="searchProduct">
            	<c:forEach items="${prodList}" var="pro">
            	<a href='<c:url value="/view/${pro.pName}/${pro.pId}"></c:url>'>
                <div class="col-md-4">
              <div class="thumbnail">
                <img src="${pageContext.request.contextPath}/Resources/images/${pro.pImg}" alt=${pro.pImg } class="img-responsive" style="min-height:210;max-height:210;height:210px;min-width:auto;max-width:auto;width:auto;">
                <div class="caption">
                  <h4 class="pull-right">$ <span>${pro.pPrice }</span></h4>
                  <h4 id="byName" class="text-pattern"><a id="name" href="#">${pro.pName }</a></h4>
                  <p class="text-pattern">${pro.pDescription }</p>
                </div>
                <div class="ratings">
                  <p>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                    <span class="glyphicon glyphicon-star"></span>
                     (15 reviews)
                  </p>
                </div>
                <div class="space-ten"></div>
                <div class="btn-ground text-center">
                    <button type="button" class="btn btn-primary"><i class="fa fa-shopping-cart"></i> Add To Cart</button>
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#product_view"><i class="fa fa-search"></i> Quick View</button>
                </div>
                <div class="space-ten"></div>
              </div>
              </div>
              </a>
                </c:forEach>
            </div>
        </div>

    </div>
</div>
<script>
document.querySelector('h2#displayCount').style.display="none";
		function searchProduct(event){
			var count=0;
			var input;
			var table,table1;
			input=event.target.value;
			table1=document.querySelectorAll('#searchProduct >a');
			table=document.querySelectorAll('#searchProduct >div')
			console.log(table[1]);
			input=input.trim();
			input=input.split(" ");
			console.log(input);
			if(input!=""){
				for(var t=0;t<table.length;t++){
					var tab=table[t].querySelectorAll('div>div.caption');
					for (var k = 0; k < input.length; k++) {
						console.log(tab[0].querySelector('h4#byName >a#name').textContent.toLowerCase().includes(input[k].toLowerCase()));
							if (tab[0].querySelector('h4#byName >a#name').textContent.toLowerCase().includes(input[k].toLowerCase())){
								console.log("display");
								table[t].style.display="";
								count++;
							}
							else{
								console.log("display none");
								table[t].style.display="none";
							}
						}
					}
				document.querySelector('h2#displayCount').style.display="";
				document.querySelector('h2#displayCount').innerHTML=count+' Product Found....';
			}else{
				console.log("test not successed");
				for (var i = 0; i < table.length; i++) {
					
						table[i].style.display="";
						document.querySelector('h2#displayCount').style.display="none";
				}
			}
			
		}

	</script>
<%@ include file="templates/footer.jsp" %>