<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Data Insert</title>
<%@include file="Navbar.jsp" %>
<% 
	  	String uid=(String)session.getAttribute("msg");
 if(uid==null)
 {
	 response.sendRedirect("Aindex.jsp");
 }
	   %>

<center>
<h1>Insert Data</h1>
<form action="InsertData" method="post" enctype="multipart/form-data">
<pre>

<%
String msgs=(String)request.getAttribute("m");
if(msgs!=null)
{
out.println(msgs);
}
%>
<div class="form-group">
NAME         <input type="text" name="pname" /><br/><br/>
PRICE        <input type="number" name="pprice" /><br/><br/>
DESCRIPTION  <textarea rows="" cols="" name="pdecs"></textarea><br/><br/>
             <Select name="pcategory">
<option value="ready to cook" >ready to cook</option>
<option value="ready to drink" >ready to drink</option>
<option value="ready to eat" >ready to eat</option>
</Select>
             <input type="file" name="img" />
             <input type="Submit" value="SUBMIT" />
             
</pre>
</center>
</form>
</div>
</body>
</html>