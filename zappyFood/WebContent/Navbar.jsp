  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<%
response.addHeader("pragma", "no-cache");
response.addHeader("cache-control", "no-store");
response.addHeader("expire", "0");
%>
<!-- 
</head>
<body>
 -->
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" style="padding:0px; margin:0px;" href="AdminHome.jsp"><img style="width:100px;" src="images/zappy-logo.png" /></a>
    </div>
    <ul class="nav navbar-nav">
      <li ><a href="AdminHome.jsp">Home</a></li>
      <li><a href="InsertData.jsp">Insert Product</a></li>
      <li><a href="ViewProduct">SHOW Product</a></li>
    </ul>
    <ul class="nav navbar-nav navbar-right">
      <li><a href="logout.jsp"><span class="glyphicon glyphicon-log-in"></span> LOGOUT</a></li>
    </ul>
  </div>
</nav>
