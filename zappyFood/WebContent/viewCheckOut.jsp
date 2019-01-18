<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order placed</title>
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


</head>
<body>
<%
	String user=(String)session.getAttribute("uid");
%> 

<%if(user==null)
	{%>
	<%@include file="header.jsp" %>
	<%} %>
	
	<%if( user!=null)
	{%>
	<%@include file="headeruser.jsp" %>
	<h2 align="center" style="font-style: italic; text-decoration: underline; ">Welcome <%=user%></h2>
	<%} %>

<h1 style="text-align: center; font-family: sans-serif; margin-top: 100px;">Order placed successfully...<br/></h1>
<h3 style="text-align: center; font-family: sans-serif; margin-top: 100px;">Product send as soon as posible</h3>
</body>
</html>