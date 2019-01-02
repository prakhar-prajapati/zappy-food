<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign-Up</title>
<link href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//netdna.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script></head>
<body>
<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="logo" class="navbar-brand" href="index.jsp"><img alt="not shown" class="logo" src="images/zappy-logo.png"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="index.jsp">Home</a></li>
      <li><a href="#">What's Zappy</a></li>
      <li><a href="#">Spreading Zappiness</a></li>
      <li><a href="#">Join Us</a></li>
      <li><a href="#">Contact Us</a></li>
    </ul>
  </div>
</nav>
<br/><br/><br/><br/><br/><br/>

${msg}
<form action="signUp" method="post">
<div class="container">
<div class="span3">
<div class="container-fluid">
    	<div class="container-page">				
			<div class="col-md-6">
				
				<h3 class="dark-grey">Registration</h3>
				
				<div class="form-group col-lg-12">
					<label>Username</label>
					<input type="text" name="cname" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-12">
					<label>Password</label>
					<input type="password" name="cpassword" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-12">
					<label>Email Address</label>
					<input type="text" name="cemail" class="form-control" id="" value="">
				</div>
				
				<div class="form-group col-lg-12">
					<label>Address</label>
					<input type="text" name="caddress" class="form-control" id="" value="">
				</div>			
				
                   <input type="submit"  class="btn btn-primary pull-right" value="Sing-up" />
			
			</div>
			</div>
	</form>
	
</div>
</body>
</html>