<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Order History</title>
</head>
<body>
<%@include file="Navbar.jsp" %>
<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList,bean.orderBean" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat"%>
${dmsg}
<%
ArrayList<orderBean> list= (ArrayList<orderBean>)request.getAttribute("List");
	  %>
	  <div class="container">
	  <table class="table table-bordered">
	  <tr><th>PID</th><th>Quantity</th><th>total</th><th>user</th><th>address</th><th>status</th><th>Order Date-Time</th></tr>
	  <%
for(orderBean rs:list)
{
%>
      <tr>
		        <td><%=rs.getPid()%></td>
		        <td><%=rs.getQuantity()%></td>
		        <td><%=rs.getTotal()%></td>
		         <td><%=rs.getUser()%></td>
		        <td><%=rs.getAddress()%></td>
		         <td>
		       <%if(rs.getStatus()==1) 
		       out.println("DISPATCH");
		       else
		       {
		    	   out.println("NOT-AVAILABLE");
			          
		       }
		       %>
		       </td>
		       <td><%=rs.getDatetime()%></td>
		        
		       
		       
		        <%-- 
		    <td> <a href="order_servlet?oid=<%=rs.getOid()%>&action=1">Dispatch product </a> </td>
		    <td> <a href="order_servlet?oid=<%=rs.getOid()%>&action=2 ">Not Available</a> </td>
		    --%>
		         </tr>
		  <%
	   }
	  %>
	  </table>
	  </div>
	  

</body>
</html>