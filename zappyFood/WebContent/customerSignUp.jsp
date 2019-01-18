<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#name").blur(function(){
	    
		var name=$("#name").val();
	//	alert(name);
	var	mydata="id="+name;
		
	 $("#msg").html("<img src='images/pc.gif' height='50' width='50' ><font color=gray> Checking availability...</font>");
	 
	 $.ajax({
			url:'signUp',
			data:mydata,
			type:'get',
			success:function(response){
			//	alert(response);
				$("#msg").html(response);
				if(response.includes("Already Exist"))
					$("#name").val("");
					
				
			}
		 });
	});


});
</script>









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
<form action="signUp" name="myform" method="post">
<div class="container">
<div class="span3">
<div class="container-fluid">
    	<div class="container-page">				
			<div class="col-md-6">
				
				<h3 class="dark-grey">Registration</h3>
				
				<div class="form-group col-lg-12">
					<label>User name</label>
					<input type="text" name="cname" class="form-control" id="name"  value="" required/><span id="msg"></span> 
						</div>
				
				<div class="form-group col-lg-12">
					<label>Password</label>
					<input type="password" name="cpassword" class="form-control" id="password" value="">
				<span id="message" class="text-danger front-weight-bold"></span>
	  
				</div>
				
				<div class="form-group col-lg-12">
					<label>Email Address</label>
					<input type="text" name="cemail" class="form-control" id="emailid" value="">
				<span id="message" class="text-danger front-weight-bold"></span>
	  
	  		<div id="msg"></div>
				</div>
		
		<div class="form-group col-lg-12">
					<label>Mobile number</label>
					<input type="text" name="cpassword" class="form-control" id="mnumber" value="">
				<span id="message" class="text-danger front-weight-bold"></span>
	  
				</div>
		
				
				<div class="form-group col-lg-12">
					<label>Address</label>
					<input type="text" name="caddress" class="form-control" id="add" value="">
				<span id="message" class="text-danger front-weight-bold"></span>
				</div>			
				
                   <input style="border-radius:5px;" type="submit" class="btn btn-primary pull-right" value="Sign-up" onblur="return fname();"/>
			
			</div>
			</div>
	</form>
	
</div>
<script type="text/javascript" src="javaScript.js"></script>
  
</body>
</html>