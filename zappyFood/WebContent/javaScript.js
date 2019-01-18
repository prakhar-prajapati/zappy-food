function fname()
{

	var name=document.getElementById("name").value;
	var correct_way=/^[A-za-z]$/;
//	alert("abc")
	if(name=="")
	{
		alert("fill name")
//		document.getElementById("message").innerHTML="fill name";
		return false;
	}
	if(name.length<3)
	{
	alert( "User name must be 3 character");
		return false;	
	}
	if(name.length>15)
	{
	alert( "User name not more than 15 character");
		return false;	
	}
	//alert('bcd')
	if(name.match(correct_way))
	{
			document.getElementById("message").innerHTML="only alphabate accept";
		return false;	
	}

	
	//password validation
	var password=document.getElementById("password").value;
	if(password=="" )
	{
		alert( "PASSWORD:Pls fill password");
		//document.getElementById("pass").innerHTML="* Pls fill password";
		return false;
	}

if(password<5 || password>10)
{
	alert( "PASSWORD:* except between 5-10 character");
  	//document.getElementById("pass").innerHTML="* except between 5-10 character";
		return false;

}
	
	
//email validation
	var email=document.getElementById("emailid").value;
		if(email=="")
	{
		 alert("EMAIL: * Pls fill Email");
       //document.getElementById("email").innerHTML="fill email";
		return false;
	}
	if(email.indexOf('@')==0)
	{
	alert( "EMAIL:Invalid '@' position");
		return false;	
	}
	if(email.charAt(email.length-4)!='.'&& email.charAt(email.length-3)!='.')
	{
	alert( "EMAIL:Invalid email-id");
		return false;	
   }
	


	//phone number
	var number=document.getElementById("mnumber").value;
	if(number=="")
	{   alert( "MOBILE: Empty Feild");
		//document.getElementById("no.").innerHTML="* Pls fill Phone number";
		return false;
	}
	// if(!isNan(number))
	// {
	// 	document.getElementById("no.").innerHTML="*Only number";
	// 	return false;	
	// }
	if(number.charAt(0)!=9&&number.charAt(8)!=8)
	{
		alert( "MOBILE: Invalid  Start");
		//document.getElementById("no.").innerHTML="* INvalid  start";
		return false;	
 	}
   if(number.length<10 || number.length>12)
	{
	   alert( "MOBILE: Number should be 10 digit");
	//document.getElementById("no.").innerHTML="<br> * number should be 10";
		return false;	
	}

   var address=document.getElementById("add").value;
   if(address=="")
	{   alert( "ADDRESS: Empty Feild");
		//document.getElementById("no.").innerHTML="* Pls fill Phone number";
		return
	}
   
   
}
