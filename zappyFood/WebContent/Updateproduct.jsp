<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upadate Data</title>
<%@include file="Navbar.jsp" %>
<% 
	  	String uid=(String)session.getAttribute("msg");
 if(uid==null)
 {
	 response.sendRedirect("Aindex.jsp");
 }
	   %>

<center>
<h1>UPDATE Data</h1>
<form action="updateproduct" method="post" >
<pre>

<%
String msgs=(String)request.getAttribute("m");
if(msgs!=null)
{
out.println(msgs);
}
%>

 <%@page import="bean.productBean" %>
 <%
 productBean e=(productBean)request.getAttribute("emp");
 %>
 

<div class="form-group">
Pid          <input type="text" value="<%=e.getId()%>" name="pid" /><br/><br/>
NAME         <input type="text" value="<%=e.getName()%>" name="pname" /><br/><br/>
PRICE        <input type="number" value="<%=e.getPrice()%>" name="pprice" /><br/><br/>
DESCRIPTION  <textarea rows="" cols="" name="pdecs"><%=e.getDescription()%></textarea><br/><br/>
             <Select name="pcategory" value=<%=e.getCategory()%>>
<option value="ready to cook" >ready to cook</option>
<option value="ready to drink" >ready to drink</option>
<option value="ready to eat" >ready to eat</option>
</Select>
             <input type="Submit" value="UPDATE" />
             
</pre>
</center>
</form>
</div>
</body>
</html>