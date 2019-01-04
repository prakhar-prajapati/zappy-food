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

	<!-- all css here -->
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/animate.css">
        <link rel="stylesheet" href="assets/css/owl.carousel.min.css">
        <link rel="stylesheet" href="assets/css/chosen.min.css">
        <link rel="stylesheet" href="assets/css/ionicons.min.css">
        <link rel="stylesheet" href="assets/css/font-awesome.min.css">
        <link rel="stylesheet" href="assets/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="assets/css/meanmenu.min.css">
        <link rel="stylesheet" href="assets/css/bundle.css">
        <link rel="stylesheet" href="assets/css/style.css">
        <link rel="stylesheet" href="assets/css/responsive.css">
        <script src="assets/js/vendor/modernizr-2.8.3.min.js"></script>
<body style="background:url('images/c.jpg'); ">
<%@include file="header.jsp" %>
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