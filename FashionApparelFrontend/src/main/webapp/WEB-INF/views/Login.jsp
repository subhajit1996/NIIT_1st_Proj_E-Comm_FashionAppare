
<%@include file="Header.jsp"%>
<style type="text/css">
*{color:#ff;}

.form-conatiner{
     border: 1px solid #fff;
     padding:50px 60px;
     margin-top: 20vh;
     -webkit-box-shadow: -1px 4px 26px 11px rgba(0,0,0,0.75);
     -moz-box-shadow: -1px 4px 2px 11px rgba(0,0,0,0.75);
     box-shadow: -1px 4px 2px 11px rgba(0,0,0,0.75);
}


</style>
<body background="resources/images/loginbackground.jpg">
<div class="container-fluid">
  <div class="row">
    <div class="col-md-4 col-sm-4 col-xs-12"></div>
      <div class="col-md-4 col-sm-4 col-xs-12">
        <form class="form-conatiner" action="perform_login"   method="post" name="login">
            <h1>Login</h1>
		   <div class="form-group">
		    <label for="exampleInputName">User Name</label>
		    <input type="Text" name="username" class="form-control" id="username" placeholder="Username">
		    <span style="color:red">${error }</span>
		  </div>
		  <div class="form-group">
		    <label for="exampleInputPassword1">Password</label>
		    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
		  </div>
		  
		  <div class="checkbox">
		    <label>
		      <input type="checkbox"> Remember me
		    </label>
		  </div>
		  <button type="submit" class="btn btn-success btn-block">Submit</button>
		  <a href="#">Forgot password?</a><br>
            <div class="form-group">
		    <p class="text-center">
		      Don't have an account?<a href="<c:url value="/register"/>" id="login">Sign Up</a>
		 </div>
		  
      </form>
      
      </div>
     <div class="col-md-4 col-sm-4 col-xs-12"></div>
  
  </div>

</div></body>
