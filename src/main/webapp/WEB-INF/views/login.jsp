<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
   String email = request.getParameter( "email" );
   session.setAttribute( "email", email );
   
   
%>
<html>
<head>
    <title>Login Page</title>
    <style>
    	body,head{
    		height:100%;
    		margin:0px;
    		padding:0px;
    		min-width:330px;
    		min-height:500px;
    		
    	}
    
        .error {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #a94442;
            background-color: #f2dede;
            border-color: #ebccd1;
        }

        .msg {
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid transparent;
            border-radius: 4px;
            color: #31708f;
            background-color: #d9edf7;
            border-color: #bce8f1;
        }

        #login-box {
            width: 250px;
            padding: 20px;
            padding-bottom:0px;
            
            position: absolute;
		    top: 50%;
		    left: 50%;
		    transform: translate(-50%, -50%);
            
            background: #071226;
            -webkit-border-radius: 5px;
            -moz-border-radius: 5px;
            border: 1px solid #000;
            opacity: 0.8;
            color: white;
        }
        
        #menu{
        	background-color:#071226;
        	width:calc( 100% - 20px );
        	height:50px;
        	padding:10px;
        	opacity: 0.8;
        }
        #logo_div{
        	width:100%;
        	height:50px;
        	max-width:1000px;
        	margin:auto;
        }
        
        #img_logo{
        	height:50px;
        }
        #button_div{
        	display:inline-block;
        }
        .button_sign {
		    background-color: #024873; /* Green */
		    border: none;
		    color: white;
		    padding: 10px 10px;
		    text-align: center;
		    text-decoration: none;
		    display: inline-block;
		    font-size: 16px;
		} 
		#background_image{
			z-index:-1;
			position:fixed;
			float:right;
		}
		
		table{
			color:white;
			opacity:1;
		}
		#submitt{
			margin-left:90px;
			margin-top:20px;
		}
		
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
		    
		    if( $( window ).width() < $( window ).height() * 1.88 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    }
		});
		$(window).resize(function(){
			if( $( window ).width() < $( window ).height() * 1.88 ){
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
		<img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png">
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
		
		    <form name='loginForm' action=" <c:url value='/login1' />" method='POST'>
		
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
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Submit" action = "login"/></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
	    </div>
	    
	    <div id = "sign_up">
	    	<p style="color:red;">${error}</p>
		    <p style="color:green;">${success}</p>
		
<<<<<<< HEAD
		    <form name='registerForm' action="<c:url value='/login2' />" method='POST'>
=======
		    <form name='registerForm'
		          action="<c:url value='login' />" method='POST'>
>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
		
		        <table>
		            <tr>
		                <td>*Name:</td>
		                <td><input type='text' name='name' value='' id="name" required /></td>
		                <td id ="nameValidation"></td>
		            </tr>
		            <tr>
		                <td>*Surname:</td>
<<<<<<< HEAD
		                <td><input type='text' name='surname' required/></td>
		            </tr>
		            <tr>
		                <td>*E-mail:</td>
		                <td><input type='email' name='email' value='' required /></td>
		            </tr>
		            <tr>
		                <td>*Password:</td>
		                <td><input type='password' name='password' required/></td>
=======

		                <td><input type='text' name='surname' /></td>
		            </tr>
		            <tr>
		                <td>*E-mail:</td>
		                <td><input type='email' name='email' value=''></td>
		            </tr>
		            <tr>
		                <td>*Password:</td>
		                <td><input type='password' name='password' /></td>

>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
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
<<<<<<< HEAD
=======

>>>>>>> 5337712a3059aa8df3d7baf82fa72dd1a603b518
		            </tr>
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Submit" /></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
		    <p>* are mandatory</p>
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