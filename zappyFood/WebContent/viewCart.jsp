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
function changeQunatityInCart(i)
{
	var cid=document.getElementById('cid'+i).value;
	var q=document.getElementById('q'+i).value;
	var up=document.getElementById('p'+i).value;
	document.getElementById('total'+i).value=q*up;
	
	
	  var xhttp = new XMLHttpRequest();
	  //var quantity=document.getElementById('q').value;
	  xhttp.open("POST","ChangeQuantity?cid="+cid+"&q="+q, true);
	  xhttp.send();
	   xhttp.onreadystatechange = function() {
	    if (this.readyState == 4 && this.status == 200) {
	     document.getElementById("gtot").innerHTML = this.responseText;
	     }
	  }; 
	  
}
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
	  <%int i=0;
for(joinCartBean e:list)
{
%>
      <tr>     
               <input type="text" id="cid<%=i%>" value="<%=e.getId()%>" hidden />
                <td><input type="text" id="id" value="<%=e.getPid()%>" readonly /></td>
		        </td><td><img src="imgupload/<%=e.getImage()%>" height="100" width="100"/></td>
		        <td><%=e.getName()%></td>
		        <td><input type="text" value="<%=e.getPrice()%>"  id="p<%=i%>" readonly /></td>
		        <td><input type="number" id="q<%=i%>" value="<%=e.getQuantity()%>" onKeyUp="changeQunatityInCart(<%=i%>)" onchange="changeQunatityInCart(<%=i%>)" /></td>
		        <td><input type="text" value="<%=e.getPrice()*e.getQuantity() %>" id="total<%=i%>"/></td>		       
		        <td> <a href="DeleteCartData?ccid=<%=e.getId()%>" class="glyphicon glyphicon-remove-sign"  onClick="return confirm('Do you really want to delete this record?')"></a> </td>
		    
		        <!-- 
		          <tr><td><input type="number" id="q<%=i%>" value="4" onKeyUp="calc(<%=i%>)"/>
		         </td><td><input type="text" id="up<%=i%>" value="1" /></td><td><input type="text" id="total<%=i%>" value="4" /></td></tr>
		         -->
		        
		         </tr>
		  <% i++;
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
	  <h3 align="right" style="margin:0px;">GrandTotal : <div id="gtot"> <%=e.getGrandTotal()%></div></h3>
	  
	  <form action="Check_Out" method="post">
	  
	  <%-- <input type="text" name="add" id="add" />
	  <input type="submit" value="check Out" />
	  --%>
	  
	  <% if(user==null){%>
<%--	<label>Enter Delivery Address:</label> --%>
       <textarea name="add" class="form-control" hidden></textarea>
  <%}%> 
  <%if(user!=null){%>
 <label>Enter Delivery Address:</label>
       <textarea name="add" class="form-control"></textarea>
  
  <%} %>
  </div>
  <button style="margin-left:500px; border-radius:20px;margin-top:10px;padding:0px 100px; " type="submit" class="btn btn-primary">Check Out</button>
	  
	  </form>
	</div> 
	  
<%} %>
</body>
</html>