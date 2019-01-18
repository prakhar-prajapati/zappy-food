<style>
body{
letter-spacing:1px;
margin:0px;
padding:0px;
background:url(images/c.jpg);
background-attachment:fixed;
background-size: cover;
font-family: 'Lobster', cursive;

}
</style>

<%@page import="java.sql.*" %>
<%@page import="java.util.ArrayList,bean.productBean" %>
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
   
<%
ArrayList<productBean> list= (ArrayList<productBean>)request.getAttribute("LIST");
	  %>
	 <!--  <div class="container">
	  <table class="table table-bordered">
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
	   -->
 <!-- modal area start --> 
	  <%
for(productBean rs:list)
{
%>


                <div class="modal-dialog modal-dialog-centered" role="document">
                    <div class="modal-content">
                        <button type="button" class="close" data-dismiss="modal"  aria-label="Close">
                         <a href="index.jsp"></abbr> <span aria-hidden="true" >&times;</span> </a>
                        </button>
                        <div class="modal-body shop">
                            <div class="container">
                                <div class="row">
                                    <div class="col-lg-5 col-md-5 col-sm-12">
                                        <div class="product-flags madal">  
                                            <div class="tab-content" id="pills-tabContent">
                                                <div class="tab-pane fade show active" id="imgeone" role="tabpanel" >
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="imgupload/<%=rs.getImage()%>" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="imgetwo" role="tabpanel">
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="assets/img/cart/nav11.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                                <div class="tab-pane fade" id="imgethree" role="tabpanel">
                                                    <div class="product_tab_img">
                                                        <a href="#"><img src="assets/img/cart/nav13.jpg" alt=""></a>    
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="products_tab_button  modals">    
                                                <ul class="nav product_navactive" role="tablist">
                                                    <li >
                                                        <a class="nav-link active" data-toggle="tab" href="#imgeone" role="tab" aria-controls="imgeone" aria-selected="false"><img src="assets/img/cart/nav.jpg" alt=""></a>
                                                    </li>
                                                    <li>
                                                         <a class="nav-link" data-toggle="tab" href="#imgetwo" role="tab" aria-controls="imgetwo" aria-selected="false"><img src="assets/img/cart/nav1.jpg" alt=""></a>
                                                    </li>
                                                    <li>
                                                       <a class="nav-link button_three" data-toggle="tab" href="#imgethree" role="tab" aria-controls="imgethree" aria-selected="false"><img src="assets/img/cart/nav2.jpg" alt=""></a>
                                                    </li>
                                                </ul>
                                            </div>    
                                        </div>  
                                    </div> 
                                    <div class="col-lg-7 col-md-7 col-sm-12">
                                        <div class="modal_right">
                                            <div class="shop_reviews">
                                                <div class="demo_product">
                                                    <h2><%=rs.getName()%></h2> 
                                                </div>
                                                <div class="current_price">
                                                    <span class="regular">Rs.64.99</span>    
                                                    <span class="regular_price" >Rs.<%=rs.getPrice()%></span>    
                                                </div>
                                                    <div class="product_variants">
                                                        <div class="product_variants_item modal_item">
                                                            <span class="control_label">Category</span>
                                                            <p><%=rs.getCategory() %></p>
                                                                
                                                        </div>   
                                                        <form action="cartDetails" method="post">
                                                       <div class="quickview_plus_minus">
                                                            <input type="text" name="pid" value="<%=rs.getId()%>" hidden />
                                                            
                                                            <span class="control_label">Quantity</span>
                                                            
                                                            <div class="quickview_plus_minus_inner">
                                                                <div class="cart-plus-minus">
                                                                    <input type="text" name="quantity" value="1" class="cart-plus-minus-box">
                                                                </div>
                                                               <div class="add_button add_modal">
                                                                    <button type="submit"> Add to cart</button> 
                                                                </div>
                                                                </form>
                                                            </div>    
                                                        </div> 
                                                        
                                                        <div class="cart_description">
                                                            <p><%=rs.getDescription()%></p>    
                                                        </div> 
                                                    </div>
                                                </div>   
                                            </div>    
                                        </div>    
                                    </div>    
                                </div>
                                <div class="row">
                                    <div class="col-12">
                                        <div class="social-share">
                                            <h3>Share this product</h3>
                                            <ul>
                                                <li><a href="#"><i class="fa fa-facebook"></i></a></li>
                                                <li><a href="#"><i class="fa fa-twitter"></i></a></li>
                                                <li><a href="#"><i class="fa fa-pinterest"></i></a></li>
                                                <li><a href="#"><i class="fa fa-google-plus"></i></a></li>
                                                <li><a href="#"><i class="fa fa-linkedin"></i></a></li>
                                            </ul>    
                                        </div>    
                                    </div>    
                                </div>     
                            </div>
                        </div>    
                    </div>
                </div>
            </div> 
            
		  <%
	   }
	  %>
    
          <!-- modal area end --> 
           <!-- all js here -->
        <script src="assets/js/vendor/jquery-1.12.0.min.js"></script>
        <script src="assets/js/popper.js"></script>
        <script src="assets/js/bootstrap.min.js"></script>
        <script src="assets/js/jquery.meanmenu.min.js"></script>
        <script src="assets/js/isotope.pkgd.min.js"></script>
        <script src="assets/js/imagesloaded.pkgd.min.js"></script>
        <script src="assets/js/jquery.counterup.min.js"></script>
        <script src="assets/js/waypoints.min.js"></script>
        <script src="assets/js/ajax-mail.js"></script>
        <script src="assets/js/owl.carousel.min.js"></script>
        <script src="assets/js/plugins.js"></script>
        <script src="assets/js/main.js"></script>