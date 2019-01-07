<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<%@page import="java.util.ArrayList,bean.productBean"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<style type="text/css">
table
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
border-radius: 5px;
}

td
{
border:none;
}

table:hover
{
border:#ccc 2px solid;
border-radius:5px;

}
input[type="number"]
{
width:50px;
text-align: center;
}

body{
letter-spacing:1px;
margin:0px;
padding:0px;
background:url(images/c.jpg);
background-attachment:fixed;
background-size: cover;
}

input[type="submit"]
{
border-radius:2px; 
}

h1{
display:inline-block;
background: #007bff;
margin-top:50px;;


}

</style>
<meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>ZappyFood</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Favicon -->
        <link rel="shortcut icon" type="image/x-icon" href="assets/img/favicon.png">
		
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

<%@include file="header.jsp" %>

<%
	String user=(String)session.getAttribute("uid");
%> 
${msg}
${count}
<div class="banner_area home1_banner mt-30">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner">
                                    <a href="#">
                                        <img src="assets/img/banner/1.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner">
                                    <a href="#">
                                        <img src="assets/img/banner/2.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="single_banner banner_three">
                                    <a href="#">
                                        <img src="assets/img/banner/3.jpg" alt="">
                                    </a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

<%--
<hr style="margin:30px; border-bottom-color:#3678b1;" >
<%@page import="java.sql.*"%>
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
	        	 
		      <div class="col-lg-3 col-md-4 col-xs-6">
	     <table class="packet" border="3" >
		<tr><td><img src="imgupload/<%=rs.getString("pimage")%>" height="120" width="140"/></td>
		</tr>
		  <tr><td><%=rs.getString("pcategory")%></td> </tr>
	        	  <tr><td><%=rs.getString("pname")%></td> </tr>
	             <tr>  <td><%=rs.getDouble("pprice")%></td>  </tr>
		       
		       <form action="cartDetails" method="post">
		       <tr><td>
		       <label>Quantity:</label>
		       <input type="number" name="quantity" value="1" />
		       </td></tr>
		       <tr><td>
		        <label>pid:</label>
		       <input type="text" name="pid" hidden value="<%=rs.getInt("pid")%>" />
		       </td></tr>
		       <tr><td>
		       <input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" />
		       </td></tr>
		       
		       </form>
		       <br>
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
 --%>
 
 
 
 <% 
 
 ArrayList<productBean> list1=(ArrayList<productBean>)request.getAttribute("LIST1");
 
 %>

<div class="container-fluid">
  <h1 >Ready to Drink</h1>
   
	<div class="row">
	 <%
 for(productBean ee:list1)
   {
	  %>
    <div class="col-lg-3 col-md-4 col-xs-6" >
    
    
	 <table class="set" border="3" >
		<tr><td><img src="imgupload/<%=ee.getImage()%>"  height="150" width="180"/></td>
		</tr>
		 <tr><td><b><%=ee.getCategory()%></b></td> </tr>
		  <tr><td><b><%=ee.getName()%></b></td> </tr>
		       <tr><td> <b><%=ee.getPrice()%> Rs.</b></td>  </tr>
		      
		     
		   <form action="cartDetails" method="post">
         <tr>  <td><b><label>Quantity:<b></label>
		 <input type="number" name="quantity" value="1" min="0" ></td></tr>
		 
		 <input type="text" name="pid" value="<%=ee.getId()%>" hidden /></td></tr>
<tr><td><input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" /></td></tr>
		       
         </form>
		   
    
     
	 </table>
          
      
       </div>
    <%
	 }
	 %>	
  </div>
  
</div>


<% 
 
 ArrayList<productBean> list2=(ArrayList<productBean>)request.getAttribute("LIST2");
 
 %>



<div class="container-fluid">
  <h1>Ready to eat</h1>
        
  
     
	<div class="row">
	 <%
 for(productBean ee:list2)
   {
	   
	  %>
    <div class="col-lg-3 col-md-4 col-xs-6" >
    
    
	 <table class="set" border="3" >
		<tr><td><img src="imgupload/<%=ee.getImage()%>"  height="150" width="180"/></td>
		</tr>
		 <tr><td><b><%=ee.getCategory()%></b></td> </tr>
		  <tr><td><b><%=ee.getName()%></b></td> </tr>
		       <tr><td> <b><%=ee.getPrice()%> Rs.</b></td>  </tr>
		      
		     
		   <form action="cartDetails" method="post">
         <tr>  <td><b><label>Quantity:<b></label>
		 <input type="number" name="quantity" value="1" min="0" ></td></tr>
		 
		 <input type="text" name="pid" value="<%=ee.getId()%>" hidden /></td></tr>
<tr><td><input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" /></td></tr>
         </form>
		   
    
     
	 </table>
          
      
       </div>
    <%
	 }
	 %>	
  </div>
  
</div>

<% 
 
 ArrayList<productBean> list3=(ArrayList<productBean>)request.getAttribute("LIST3");
 
 %>
<div class="container-fluid">
  <h1>Ready to cook</h1>
        
  
     
	<div class="row">
	 <%
 for(productBean ee:list3)
   {
	   
	  %>
    <div class="col-lg-3 col-md-4 col-xs-6" >
    
    
	 <table class="set" border="3" >
		<tr><td><img src="imgupload/<%=ee.getImage()%>"  height="150" width="180"/></td>
		</tr>
		 <tr><td><b><%=ee.getCategory()%></b></td> </tr>
		  <tr><td><b><%=ee.getName()%></b></td> </tr>
		       <tr><td> <b><%=ee.getId()%> Rs.</b></td>  </tr>
		      
		     
		   <form action="cartDetails" method="post">
         <tr>  <td><b><label>Quantity:<b></label>
		 <input type="number" name="quantity" value="1" min="0" ></td></tr>
		 
		 <input type="text" name="pid" value="<%=ee.getId()%>" hidden /></td></tr>
<tr><td><input type="submit" class="btn btn-primary btn-sm btn-block" value="Add to cart" /></td></tr>
         </form>
		   
    
     
	 </table>
          
      
       </div>
    <%
	 }
	 %>
	  	
  </div>
  
</div>
  
 
 
 
<%@include file="footer.jsp" %>
</body>
</html>