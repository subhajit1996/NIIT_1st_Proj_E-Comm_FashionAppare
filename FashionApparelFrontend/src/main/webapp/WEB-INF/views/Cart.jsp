<%@include file="Header.jsp"%>

<div style="background-color:yellow">
<div style="background-color:orange"><h2 align="center">Your Cart</h2></div>
<div class="container">
    <div class="row">
        <div class="col-sm-12 col-md-10 col-md-offset-1">
            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>Product</th>
                        <th>Quantity</th>
                        <th class="text-center">Price</th>
                        <th class="text-center">Total</th>
                        <th>�</th>
                    </tr>
                </thead>
                <tbody>
                <c:forEach items="${listCartItems}" var="cartItem">
                <form action="<c:url value="/updateCartItem/${cartItem.cartItemId}"/>" method="get">
                    <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#"><img class="media-object" src="<c:url value="/resources/images/${cartItem.productId}.jpg"/>" style="width: 72px; height: 72px;"></a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">${cartItem.productName}</a></h4>
                                <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                                <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="text" class="form-control" name="quantity" value="${cartItem.quantity}">
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartItem.price}</strong></td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>${cartItem.price * cartItem.quantity}</strong></td>
                        <td class="col-sm-1 col-md-1">
                        <button type="submit" class="btn btn-primary">
                            <span class="glyphicon glyphicon-update"></span> Update
                            </button>
                            <a href ="<c:url value="/deleteCartItem/${cartItem.cartItemId}"/>" class="btn btn-danger">
                            <span class="glyphicon glyphicon-remove"></span> Remove
                        </a></td>
                    </tr>
                  </form>
                 </c:forEach>
                    
                    <tr>
                        <td> � </td>
                        <td> � </td>
                        <td> � </td>
                        <td><h5>Subtotal</h5></td>
                        <td class="text-right"><h5><strong>${total_Amount} /-</strong></h5></td>
                    </tr>
                    <tr>
                        <td> � </td>
                        <td> � </td>
                        <td> � </td>
                        <td><h5>Estimated shipping</h5></td>
                        <td class="text-right"><h5><strong>${total_Amount /10} /-</strong></h5></td>
                    </tr>
                    <tr>
                        <td> � </td>
                        <td> � </td>
                        <td> � </td>
                        <td><h3>Total</h3></td>
                        <td class="text-right"><h3><strong>Rs.${total_Amount +(total_Amount/10)} /-</strong></h3></td>
                    </tr>
                    <tr>
                        <td> � </td>
                        <td> � </td>
                        <td> � </td>
                        <td>
                        <a href="<c:url value="/productDisplay"/>" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> Continue Shopping
                        </a></td>
                        <td>
                        <a href="<c:url value="/confirmOrder"/>"  class="btn btn-success">
                            Checkout <span class="glyphicon glyphicon-play"></span>
                        </a></td>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>
</div>
</div>