<%@ page language="java" contentType="text/html"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
<head>
<title></title>
<meta charset="utf-">
<meta name="viewport" content="width=device-width,initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

</head>
<body>

<div class="container-fluid">

  <nav class="navbar navbar-inverse">
    <div class="container-fluid">
    
      <div class="navbar-header">
            <a class="navbar-brand" herf="#">Fashion Apparel</a>
      </div>
    
    <ul class="nav navbar-nav">
      <li><a href="index.jsp">Home</a></li>
       <c:if test="${!sessionScope.loggedIn}">
  
      <li><a href="login">Login</a></li>
      <li><a href="register">Register</a></li>
      <li><a href="contactUs">Contact Us</a></li>
      <li><a href="aboutUs">About Us</a></li>
  
      </c:if>
      
   <c:if test="${sessionScope.loggedIn}">
      
         <c:if test="${sessionScope.role=='ROLE_USER'}">
   
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#">Category <span class="caret"></span></a>
             <ul class="dropdown-menu">
                <li><a href="#">Jeans</a></li>
                 <li><a href="#">T-shirts</a></li>
                  <li><a href="#">Jersey</a></li>
                   <li><a href="#">Shirts</a></li>
             
             </ul>
       </li>
       		  <li><a href="<c:url value="/productDisplay"/>">Product Display</a></li>
       		  <li><a href="contactUs">Contact Us</a></li>
               <li><a href="aboutUs">About Us</a></li>
        </c:if>
        <c:if test="${sessionScope.role=='ROLE_ADMIN'}">
         
    		 <li><a href="<c:url value="/product"/>">Manage Product</a></li>      
     
     		 <li><a href="<c:url value="/category"/>">Manage Category</a></li> 
       </c:if>
       </c:if>
        
      
    
    </ul>
    </div>
    <div class="nav navbar-nav navbar-right">
         <c:if test="${sessionScope.loggedIn}">
         <div id="userdetail">
             <font color="red">Welcome ${sessionScope.username}</font>
             <a href="<c:url value="/perform_logout"/>">Logout</a>
           </div>  
         </c:if>
    </div>
    
  </nav>
 </div>

