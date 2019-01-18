<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("expire", "0");
%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<div class="organic_food_wrapper">
                <!--Header start-->
                <header class="header sticky-header">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-12">
                                <div class="header_wrapper_inner">
                                   
                                    <div style="width:200px; padding-top:2px;" class="logo col-xs-12">
                                        <a href="index.html">
                                            <img src="images/zappy-logo.png" alt="">
                                        </a>
                                    </div>
                                    
                                    
                                    <div class="main_menu_inner">
                                      
                                        <div class="menu">
                                            <nav>
                                                <ul>
                                                    <li class="active"><a href="index.jsp">Home</a>
                                                    </li>
                                                     <li><a href="Order_Status">Order-Status</a></li>
                                                    <li><a href="logout.jsp">log-out </a>
                                                                  
                                                    </li>
                                                                                                </nav>
                                        </div>
                                        
                                        <div class="mobile-menu d-lg-none">
                                            <nav>
                                                 <ul>
                                                   
                                                    <li class="active"><a href="index.jsp">Home</a> </li>
                                                      <li><a href="Aindex.jsp">Admin Login</a></li>
                                                    <li><a href="#">WhatsZappy </a> </li>
                                                     <li><a href="#">About us</a></li>
                                                    <li><a href="customerSignUp.jsp">Sign-Up </a></li>
                                                    <li><a href="logout.jsp">log-out </a>
                                                    
                                                   
                                                </ul>
                                            </nav> 
                                        </div>
                                    </div>
                                   
                                        <div class="mini__cart">
                                            <div class="mini_cart_inner">
                                                <div class="cart_icon">
                                                    <a href="viewCartServlet">
                                                        <span class="cart_icon_inner">
                                                            <i class="ion-android-cart"> View cart</i>
                                                             <span class="cart_count">${count}</span>
                                                        </span>
                                                    </a>
                                                </div>
                                                </div>
                                        </div>
                                   
                                      </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </header>