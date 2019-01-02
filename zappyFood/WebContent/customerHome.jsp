<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title> Customer home page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<style type="text/css">
.packet
{
margin-top: 20px;
border:none;
font-style: italic;
font-weight: bolder; 
text-align: center;
width:250px;
font-size: large;
background-color:white;
padding:0px;
}

td
{
padding-top:3px;
border-radius:20px;
}
img
{
padding:10px; 
}

input[type="number"]
{
width:50px;
text-align: center;
}

body{
margin:0px;
padding:0px;
background:url(images/.jpg);
background-attachment:fixed;
background-size: cover;

}
a[href]
{
color:red;
}
.logo{
width:100px;
}
a.navbar-brand{
padding:1px;
}
 
</style>

</head>
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="#"><img alt="not shown" class="logo" src="images/zappy-logo.png"></a>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="customerHome.jsp">Home</a></li>
      <li><a href="#">View Cart</a></li>
      <li><a href="#">Order History</a></li>
      <li><a href="#">Join Us</a></li>
     </ul>

 </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="#"><span class="glyphicon glyphicon-log-in"></span>Log out</a></li>
    </ul>
  </div>
</nav>
<br/><br/><br/><br/>
<img alt="" src="images/1.jpg"/> <img alt="" src="images/2.jpg"/><img alt="" src="images/3.jpg"/>

<%@page import="java.sql.*" %>
<div class="container">
  <div class="row">

<%
try {
	Class.forName("com.mysql.jdbc.Driver");
	  Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/zappyfood_db","root","root");
PreparedStatement ps=con.prepareStatement("select * from product_details");
	  ResultSet rs=ps.executeQuery();
	 
	  %>
	 
	  <%
	  while(rs.next())
	  {
		  %>
		      <div class="col-lg-3 col-md-4 col-xs-6" style="padding:0px; ">
	     <table class="packet" border="3" >
		<tr><td><img  src="imgupload/<%=rs.getString("pimage")%>" height="130" width="150"/></td>
		</tr>
		  <tr><td><%=rs.getString("pcategory")%></td> </tr>
	        	  <tr><td><%=rs.getString("pname")%></td> </tr>
	             <tr><td><%=rs.getDouble("pprice")%></td>  </tr>
		       <tr><td>
		       <label>Quantity</label>
		       <input type="number" name="quantity" value="1" />
		       </td></tr>
		       <tr><td>
		       <input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" />
		       </td></tr>
		       
		       <br/>
	 </table>	  
	  </div>
		  <%
	  }
	  %>
	 
	  <%
	  
	  con.close();
}catch(Exception e)
{
	  System.out.println(e);
}

%>
      
   
  </div>
</div>

</body>
</html>