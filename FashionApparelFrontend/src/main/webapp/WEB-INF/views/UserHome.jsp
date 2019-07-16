<%@include file="Header.jsp"%>


<h2 align="center">Product Gallery</h2>

<div class="container">
    <div class="row text-center text-lg-left">
    
    <c:forEach items="${productList}" var="product">
       <div class="col-md-3 col-sm-4 col-xs-12">
         <a href="<c:url value="/totalProductDisplay/${product.productId}"/>" class="d-block mb-4 h-100">
         <img class="img-fluid img-thumbnail" src="<c:url value="/resources/images/${product.productId}.jpg"/>" width="150" height="200"/>
         <p>Price :${product.price}</p>
         <p>Stock :${product.stock}</p>
         </a>
       </div>
    </c:forEach>
   </div>
</div>