<%@page import="java.sql.*" %>
<%@include file="Navbar.jsp" %>
<%@page import="java.util.ArrayList,bean.productBean" %>

<%
ArrayList<productBean> list= (ArrayList<productBean>)request.getAttribute("List");
	  %>
	  <div class="container">
	  <table class="table table-hover">
	  <tr><th>ID</th><th>CATEGORY</th><th>PRODUCT-NAME</th><th>PRICE</th><th>DESCRIPTION</th><th>IMAGES</th></tr>
	  <%
for(productBean rs:list)
{
%>
      <tr>
		        <td><%=rs.getId()%></td>
		        <td><%=rs.getCategory()%></td>
		        <td><%=rs.getName()%></td>
		        <td><%=rs.getPrice()%></td>
		         <td><%=rs.getDescription()%></td>
		         <td><img src="imgupload/<%=rs.getImage()%>" height="100" width="100"/></td>
		    <td> <a href="DeleteData?ccid=<%=rs.getId()%>" class="glyphicon glyphicon-remove-sign"  onClick="return confirm('Do you really want to delete this record?')"></a> </td>
		    <td> <a href="updateData?ppid=<%=rs.getId()%>" class="glyphicon glyphicon-edit" ></a> </td>
		    
		         </tr>
		  <%
	   }
	  %>
	  </table>
	  </div>
	  
