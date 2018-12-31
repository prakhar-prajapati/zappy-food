<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Upadate Data</title>
<style type="text/css">
.container
{
width:500px;
}

.updatef
{
background:#ddd;
float:left;
width:500px;
margin-left: 100px;
margin-top: 30px;
}

.updateimg
{
background:#ddd;
float: left;
width:500px;
height:518px;
margin-left:100px; 
margin-top: 30px;
}
.headding
{
color:red;
font-family:sans-serif;
text-align: center;
}
.bg{
 background:url("images/b.jpg"); 
 }
</style>
</head>
<%@include file="Navbar.jsp" %>
<% 
	  	String uid=(String)session.getAttribute("msg");
 if(uid==null)
 {
	 response.sendRedirect("Aindex.jsp");
 }
	   %>

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
 
 
<body class="bg">
<div class="updatef">
<div class="container">
<div class="col-sm-4">
<h2 class="headding">UPDATE DATA</h2>
<form  action="updateproduct" method="post" >
<div class="form-group">
<label>Pid:</label>
 <input type="text" class="form-control" value="<%=e.getId()%>" readonly name="pid" />
</div>
<div class="form-group">
<label>NAME:</label>  
 <input type="text" class="form-control" value="<%=e.getName()%>" name="pname" />
</div>
<div class="form-group">
<label>PRICE:</label> 
 <input type="number" class="form-control" value="<%=e.getPrice()%>" name="pprice" />
</div>
<div class="form-group">
<label for="desc">DESCRIPTION:</label>
<textarea rows="" cols="" class="form-control" name="pdecs"><%=e.getDescription()%></textarea>
</div>
<label>Category:</label>
             <Select name="pcategory" class="form-control" value=<%=e.getCategory()%>>
<option value="ready to cook" >ready to cook</option>
<option value="ready to drink" >ready to drink</option>
<option value="ready to eat" >ready to eat</option>
</Select>
           <br/> <input type="Submit" class="btn btn-primary btn-md" value="UPDATE" /><br/><br/>
</div>
</form>
</div>
</div>
</div>

<div class="updateimg">
<div class="container">
<div class="col-sm-4">
<h2 class="headding">UPDATE IMAGE</h2>
<form action="imageUpdate" method="post" enctype="multipart/form-data" >
<div class="form-group">
<label>PID:</label>  
  <input type="text" class="form-control" value="<%=e.getId()%>" readonly name="pidd" />
<div>
<br/>
<div class="form-group">
<label>IMAGE:</label><br/>
     <img src="imgupload/<%=e.getImage()%>" height="140" width="160" />
</div>
   <input type="file" name="img" />
    <br/>   
       <input type="Submit" class="btn btn-primary btn-md" value="Update image">          
</form>
</div>
</div>
</div>
</body>
</html>