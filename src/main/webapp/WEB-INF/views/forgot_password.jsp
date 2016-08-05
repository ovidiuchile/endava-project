<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--%
   String email = request.getParameter( "email" );
   session.setAttribute( "email", email );
   
   
%-->
<html>
<head>
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
		    
		    if( $( window ).width() < $( window ).height() * 1.5 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    }
		});
		$(window).resize(function(){
			if( $( window ).width() < $( window ).height() * 1.5 ){
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
</head>
<body onload='document.loginForm.username.focus();'>

<img id = "background_image" src="${pageContext.request.contextPath}/resources/images/background.jpg">

<div id = "menu">
	<div id = "logo_div">
		<a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
	</div>
</div>

<div id = "content_login">

	<!-- START LOGIN BOX -->
	<div id="login-box">
	    
	    <div id = "button_div">
	    	<p style="margin:0px;margin-bottom:-10px;">Recover password</p>
	    </div>
	    
		<div id = "sign_in">
			
		    <p style="color:green;">${msg}</p>
		
		    <form name='loginForm' action=" <c:url value='forgot-password' />" method='POST'>
		
		        <table>
		            <tr>
		                <td>E-mail:</td>
		                <td><input type='email' name='email' value='' required/></td>
		            </tr>
		            <tr>
		                <td><a href = "${pageContext.request.contextPath}/login" style="text-decoration:none;margin-right:-300px;margin-left:0px;margin-top:10px;color:orange;position:absolute;">Go back</a></td>
		            </tr>
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Send"/></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
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