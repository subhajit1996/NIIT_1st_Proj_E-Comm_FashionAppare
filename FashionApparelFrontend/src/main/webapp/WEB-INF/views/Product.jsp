<%@include file="Header.jsp"%>


<div class="col-md-2 col-sm-2 col-xs-12"></div>
<div class="col-md-8 col-sm-8 col-xs-12">
<div style="background-color:yellow"><h2 align="center">Manage Product</h2></div>
<br/><br/>

<form:form action="InsertProduct" modelAttribute="product" method="post" enctype="multipart/form-data" >
	<table align="center" class="table table-border">
		<tr>
			<td>Product Name</td>
			<td><form:input path="productName"/></td>
		</tr>
		<tr>
			<td>Product Desc</td>
			<td><form:input path="productDesc"/></td>
		</tr>
		<tr>
			<td>Price </td>
			<td><form:input path="price"/></td>
		</tr>
		<tr>
			<td>Category</td>
			<td>
				<form:select path="categoryId">
					<form:option value="0" label="---Select List---"/>
					<form:options items="${categoryList}"/>
				</form:select>
			</td>
		</tr>
		
		<tr>
			<td>Supplier</td>
			<td><form:input path="supplierId"/></td>
		</tr>
		
		<tr>
			<td>stock</td>
			<td><form:input path="stock"/></td>
		</tr>
		<tr>
			<td>Product Image</td>
			<td><form:input type="file" path="pimage"/></td>
		</tr>
		<tr>
			<td colspan="2"><center><input type="Submit" value="Insert Product" class="btn btn-primary" whidh="200"/></center></td>
		</tr>
    </table>

</form:form>

<table align="center" class="table table-border table-condensed">
    <tr class="danger">
	    <td>Product Id</td>
	    <td>Product Name</td>
	    <td>Price</td>
	    <td>Stock</td>
	    <td>Category</td>
	    <td>Supplier</td>
	   <td>Operation</td>
	    
    </tr>
            <c:forEach items="${productList}" var="product">
            <tr>
                 <td>${product.productId}</td>
                 <td>${product.productName}</td>
                 <td>${product.price}</td>
                 <td>${product.stock}</td>
                 <td>${product.categoryId}</td>
                 <td>${product.supplierId}</td>
                 <td>
                    <a href="<c:url value="/editProduct/${product.productId}"/>">EDIT</a>
                    &nbsp;&nbsp;/&nbsp;&nbsp;
                     <a href="<c:url value="/deleteProduct/${product.productId}"/>">DELETE</a>
                 </td>
            </tr>
            
            </c:forEach>
</table>
</div>
<div class="col-md-2 col-sm-2 col-xs-12"></div>



</div>
</body>
</html>