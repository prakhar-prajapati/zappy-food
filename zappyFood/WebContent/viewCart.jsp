<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Cart</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.0/jquery.min.js"></script>

<script type="text/javascript">
$(document).ready(function(){
	$("#q").on('keyup',function(){
	    
		var quantity=$("#q").val();
		alert("id="+quantity);
	var	quantity="quantity="+q;
	var	pid="pid="+id;
	var	price="price="+p;
		
	 $("#msg").html("<img src='images/pc.gif' height='50' width='50' ><font color=gray> Checking availability...</font>");
	 
	 $.ajax({
			url:'cartUpdate',
			data:quantity,pid,price
			type:'post',
			success:function(response){
			//	alert(response);
				$("#msg").html(response);
			}
		 });
	});
});
)
</script>

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


<%@page import="java.util.ArrayList,bean.joinCartBean" %>
<%
ArrayList<joinCartBean> list= (ArrayList<joinCartBean>)request.getAttribute("List");
%>
${dmsg}

	  
	  <div class="container">
	  <table class="table table-hover">
	  <tr><th>Pid</th><th>Product IMAGES</th><th>Product Name</th><th> Unit-Price</th><th>QUANTITY</th><th>TOTAL</th></tr>
	  <%
for(joinCartBean e:list)
{int i=0;
%>
      <tr>     
                <td><input type="text" id="id" value="<%=e.getPid()%>" /></td>
		        </td><td><img src="imgupload/<%=e.getImage()%>" height="100" width="100"/></td>
		        <td><%=e.getName()%></td>
		        <td><input type="text" value="<%=e.getPrice()%>" id="p" /></td>
		        <td><input type="number" id="q" value="<%=e.getQuantity()%>" onKeyUp="call()" /></td>
		        <td><input type="text" value="<%=e.getPrice()*e.getQuantity() %>" /></td>		       
		        <td> <a href="DeleteCartData?ccid=<%=e.getId()%>" class="glyphicon glyphicon-remove-sign"  onClick="return confirm('Do you really want to delete this record?')"></a> </td>
		    
		        <!-- 
		          <tr><td><input type="number" id="q<%=i%>" value="4" onKeyUp="calc(<%=i%>)"/>
		         </td><td><input type="text" id="up<%=i%>" value="1" /></td><td><input type="text" id="total<%=i%>" value="4" /></td></tr>
		         -->
		        
		         </tr>
		  <%
	   }
	  %>
	  </table>
	  <%
ArrayList<joinCartBean> listTotal= (ArrayList<joinCartBean>)request.getAttribute("Listt");
	  %>
	   <%
for(joinCartBean e:listTotal)
{
%> 
      <hr>
	  <h3 align="right" style="margin:0px;">GrandTotal :   <%=e.getGrandTotal()%></h3>
	  <button href=""#>Check Out</button>
	  </div>
<%} %>
</body>
</html>