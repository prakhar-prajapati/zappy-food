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

</head>
<body>
<%@page import="java.util.ArrayList,bean.joinCartBean" %>
<%
ArrayList<joinCartBean> list= (ArrayList<joinCartBean>)request.getAttribute("List");
	  %>


	  
	  <div class="container">
	  <table class="table table-hover">
	  <tr><th>Product IMAGES</th><th>Product Name</th><th>Price</th><th>QUANTITY</th><th>TOTAL</th></tr>
	  <%
for(joinCartBean e:list)
{
%>
      <tr>     
                </td><td><img src="imgupload/<%=e.getImage()%>" height="100" width="100"/></td>
		        <td><%=e.getName()%></td>
		        <td><%=e.getPrice()%></td>
		        <td><%=e.getQuantity()%></td>
		         <td><%=e.getPrice()*e.getQuantity() %></td>		       
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