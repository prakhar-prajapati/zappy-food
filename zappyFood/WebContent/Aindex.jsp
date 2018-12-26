<!-- <!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ADMIN LOGIN</title>

</head>
<body>
<center>
	 
  ${msg}

<form action="adminLogin" method="post">
<h1>ADMIN LOGIN PAGE</h1>
<hr/>

ADMIN ID     <input type="text" name="aid" />
<br/><br/>
PASSWORD     <input type="password" name="apass" />
<br/><br/>
             <input type="Submit" value="LOGIN">

</form>
</center>
</body>
</html>
 -->
  <!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {font-family: Arial, Helvetica, sans-serif;}
form {
border: 3px solid #f1f1f1;
width:500px;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 12px 20px;
  margin: 8px 0;
  display: inline-block;
  border: 1px solid #ccc;
  box-sizing: border-box;
}

button {
  background-color: #4CAF50;
  color: white;
  padding: 14px 20px;
  margin: 8px 0;
  border: none;
  cursor: pointer;
  width: 100%;
}

button:hover {
  opacity: 0.8;
}

.cancelbtn {
  width: auto;
  padding: 10px 18px;
  background-color: #f44336;
}

.imgcontainer {
  text-align: center;
  margin: 24px 0 12px 0;
}

img.avatar {
  width: 15%;
  border-radius:50%;
}

.container {
  padding: 16px;
}

span.psw {
  float: right;
  padding-top: 16px;
}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
  span.psw {
     display: block;
     float: none;
  }
  .cancelbtn {
     width: 100%;
  }
}
</style>
</head >
<body>
<center>
<h2>Admin Login</h2>

<form action="adminLogin" method="post">
  <div class="imgcontainer">
    <img src="images/avtar.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label for="uname"><b>Username</b></label>
    <input type="text" placeholder="Enter Username" name="aid" required>

    <label for="psw"><b>Password</b></label>
    <!-- <input type="password" placeholder="Enter Password" name="apass" required> -->
    <input type="password" name="apass" />    
    <button type="submit">Login</button>
    <label>
      <input type="checkbox" checked="checked" name="remember"> Remember me
    </label>
  </div>

  <div class="container" style="background-color:#f1f1f1">
    <button type="button" class="cancelbtn">Cancel</button>
    <span class="psw">Forgot <a href="#">password?</a></span>
  </div>
</form>
</center>
</body>
</html>
  
 