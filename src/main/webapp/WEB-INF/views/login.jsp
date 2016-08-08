<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String email = request.getParameter( "email" );
   session.setAttribute( "email", email );
%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Appollo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">
    <style>
		<%@include file="css/style.css"%>
		
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#sign_up").hide();
			
		    $("#button_sign_up").click(function(){
		        $("#sign_in").hide();
		        $("#sign_up").show();
		    });
		    
		    $("#button_sign_in").click(function(){
		        $("#sign_up").hide();
		        $("#sign_in").show();
		    });
		    
		    if( $( window ).width() < $( window ).height() * 0.625 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    }
		    
		    $("#login-box").mouseenter(function(){
		    	$("#login-box").hide();
		    });
		    $("#menu").mouseenter(function(){
		    	$("#login-box").show();
		    });
		    
		});
		$(window).resize(function(){
			if( $( window ).width() < $( window ).height() * 0.625 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    }
		});
	</script>
	
	<script>
	function validateForm() {
		var numbers = /^[0-9]+$/;
	    var x = document.forms["registerForm"]["name"].value;
	    if (x == null || x == "") {
	        alert("Name cannot be empty!");
	        return false;
	    }
	    else{
	    	var ok=true;
	    	for(i=0;i<x.length;i++)
	    		if(x[i]>='0' && x[i]<='9')
	    			ok=false;
	    	if(ok==false){
	    		alert("Name cannot have digits!");
	    		return false;
	    	}
	    	else{
	    		x=document.forms["registerForm"]["email"].value;
	    		if(x==null || x==""){
	    			alert("E-mail cannot be empty!");
	    			return false;
	    		}
	    		else{
	    			x=document.forms["registerForm"]["phone"];
	    			if(!x.value.match(numbers)){
	    				alert("Phone number can only be made of digits!")
	    				return false;
	    			}
	    		}
			}
		}
		return true;
	}
	</script>
	
	<script>
	$( window ).on( "mousemove", function( event ) {
		$( "#binary1_div" ).css("margin-left", ( event.clientX + event.clientY  ) / 140 * -1 );
		$( "#binary2_div" ).css("margin-left", ( event.clientX + event.clientY  ) / 80 * -1 );
		$( "#binary3_div" ).css("margin-left", ( event.clientX + event.clientY  ) / 50 * -1 );
		
	});
	</script>
	
	<style>
		.binary1 {
		    -webkit-animation: mymove1 50s;  /* Chrome, Safari, Opera */
		    -webkit-animation-iteration-count: infinite;  /* Chrome, Safari, Opera */
		    -webkit-animation-timing-function: linear;
		    animation: mymove1 50s;
		    animation-iteration-count: infinite;
		    animation-timing-function: linear;
		}
		
		/* Chrome, Safari, Opera */
		@-webkit-keyframes mymove1 {
		    from {top: 0px;}
		    to {top: -5000px;}
		}
		
		@keyframes mymove1 {
		    from {top: 0px;}
		    to {top: -5000px;}
		}
		
		.binary2 {
		    -webkit-animation: mymove2 50s;  /* Chrome, Safari, Opera */
		    -webkit-animation-iteration-count: infinite;  /* Chrome, Safari, Opera */
		    -webkit-animation-timing-function: linear;
		    animation: mymove2 50s;
		    animation-iteration-count: infinite;
		    animation-timing-function: linear;
		}
		
		/* Chrome, Safari, Opera */
		@-webkit-keyframes mymove2 {
		    from {top: 0px;}
		    to {top: -7000px;}
		}
		
		@keyframes mymove2 {
		    from {top: 0px;}
		    to {top: -7000px;}
		}
		
		.binary3 {
		    -webkit-animation: mymove3 50s;  /* Chrome, Safari, Opera */
		    -webkit-animation-iteration-count: infinite;  /* Chrome, Safari, Opera */
		    -webkit-animation-timing-function: linear;
		    animation: mymove3 50s;
		    animation-iteration-count: infinite;
		    animation-timing-function: linear;
		}
		
		/* Chrome, Safari, Opera */
		@-webkit-keyframes mymove3 {
		    from {top: 0px;}
		    to {top: -9000px;}
		}
		
		@keyframes mymove3 {
		    from {top: 0px;}
		    to {top: -9000px;}
		}
	</style>
	
</head>
<body onload='document.loginForm.username.focus();'>
 
 <div id = "binary1_div">
<img class = "binary binary1" id = "binary-2" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary-1" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary1" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary2" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary3" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary4" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary5" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary6" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary7" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary8" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary9" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary10" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary11" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary12" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary13" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
</div>
<div id = "binary2_div">
<img class = "binary binary2" id = "binary21" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary22" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary23" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary24" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary25" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
</div>
<div id = "binary3_div">
<img class = "binary binary3" id = "binary31" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary3" id = "binary32" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary3" id = "binary33" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary3" id = "binary34" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
</div>
<div id = "menu">
	<div id = "logo_div">
		<a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
	</div>
</div>

<div id = "content_login">

	<!-- START LOGIN BOX -->
	<div id="login-box">
	    
	    <div id = "button_div">
	    	<button class = "button_sign" id = "button_sign_in" type="button">Sign In</button>
	    	<button class = "button_sign" id = "button_sign_up" type="button">Sign Up</button>
	    </div>
	    
		<div id = "sign_in">
			
		    <p style="color:red;">${error}</p>
		    <p style="color:green;">${success}</p>
		
		    <form name='loginForm' action="${pageContext.request.contextPath}/securitycheck" method='POST'>
		
		        <table>
		            <tr>
		                <td>E-mail:</td>
		                <td><input type='email' name='email_in' value='' required/></td>
		            </tr>
		            <tr>
		                <td>Password:</td>
		                <td><input type='password' name='password_in' required/></td>
		            </tr>
		           
		           <tr>
		                <td><a href = "${pageContext.request.contextPath}/forgot-password" style="text-decoration:none;margin-right:-300px;margin-left:0px;margin-top:10px;color:#D13F32;position:absolute;">Recover password</a></td>
		            </tr>
		            
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Submit" style="margin-top:35px;"/></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
		    
	    </div>
	    
	    <div id = "sign_up">
	    	<p style="color:red;">${error2}</p>
		    <p style="color:green;">${success}</p>
		
		    <form name='registerForm' action="<c:url value='/register' />" method='POST'>
		
		        <table>
		            <tr>
		                <td>*Name:</td>
		                <td><input type='text' name='name' value='' id="name" required /></td>
		                <td id ="nameValidation"></td>
		            </tr>
		            <tr>
		                <td>*Surname:</td>
		                <td><input type='text' name='surname' required/></td>
		            </tr>
		            <tr>
		                <td>*E-mail:</td>
		                <td><input type='email' name='email' value='' required /></td>
		            </tr>
		            <tr>
		                <td>Phone:</td>
		                <td><input type='tel' name='phone' value=''></td>
		            </tr>
		             <tr>
		                <td>Country:</td>
		                <td><input type='text' name='country' /></td>
		            </tr>
		            <tr>
		                <td>City:</td>
		                <td><input type='text' name='city' value=''></td>
		            </tr>
		            <tr>
		                <td>Address:</td>
		                <td><input type='text' name='address' /></td>
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Submit" /></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
		    <p>* are mandatory</p>
		    <p>The password is sent via email</p>
	    </div>
	    
	</div>
	<!-- END LOGIN BOX -->

</div>
<script>
	var check_name = document.getElementById('name');
	if(check_name.length==0) alert("Please insert a name");
</script>
</body>
</html>