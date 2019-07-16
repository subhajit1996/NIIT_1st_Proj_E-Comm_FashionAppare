<%@include file="Header.jsp"%>


<style type="text/css">
*{color:#ff;}
.bg{
     background: url('/images/ind.jpg') no-repeat;  
     width: 100%;
     height: 100vh;
}
.form-conatiner{
     border: 1px solid #fff;
     padding:50px 60px;
     margin-top: 20vh;
     -webkit-box-shadow: -1px 4px 26px 11px rgba(0,0,0,0.75);
     -moz-box-shadow: -1px 4px 2px 11px rgba(0,0,0,0.75);
     box-shadow: -1px 4px 2px 11px rgba(0,0,0,0.75);
}


</style>

<body background="resources/images/signb.jpg">
<div class="container-fluid bg">
  <div class="row">
    <div class="col-md-4 col-sm-4 col-xs-12"></div>
      <div class="col-md-4 col-sm-4 col-xs-12">
         <form action="<c:url value="/registerUser"/>" method="post"  class="form-conatiner">
           <div class="col-md-12 text-center">
            <h1>Sign Up</h1></div>
            
       
           
           <div class="form-group">
		    <label for="exampleInputName">User Name</label>
		    <input type="Text" name="username" class="form-control" id="username" placeholder="Your Name">
		  </div>
		  <div class="form-group">
		    <label for="exampleInputName">Customer Name</label>
		    <input type="Text" name="customerName" class="form-control" id="custname" placeholder="Your Name">
		  </div>
		   
		  <div class="form-group">
		    <label for="exampleInputEmail1">Email</label>
		    <input type="email" name="emailId" class="form-control" id="email" placeholder="Email">
		  </div>
		  
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password"  name="password" class="form-control" id="password" placeholder="Password">
		    Password must be at  least 6 characters
		  </div>
		  <div class="form-group">
		      <label for="exampleInputEmail1">Address</label>
		    <textarea cols="10" rows="2" name="address" id="address"></textarea>
		  
		   </div>
		  
		  
		  <button type="submit" class="btn btn-success btn-block">Continue</button>
		 <div class="form-group">
		    <p class="text-center">
		      Already have an account?<a href="<c:url value="/login"/>" id="singup">Login</a>
		 </div>
		  
      </form> 
     
      
      
      </div>
     <div class="col-md-4 col-sm-4 col-xs-12"></div>
  
  </div>

</div>
</body>


