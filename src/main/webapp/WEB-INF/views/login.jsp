<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
        	margin-bottom:20px;
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
			
		    <c:if test="${not empty error}">
		        <div class="error">${error}</div>
		    </c:if>
		    <c:if test="${not empty msg}">
		        <div class="msg">${msg}</div>
		    </c:if>
		
		    <form name='loginForm'
		          action="<c:url value='/j_spring_security_check' />" method='POST'>
		
		        <table>
		            <tr>
		                <td>E-mail:</td>
		                <td><input type='email' name='email' value=''></td>
		            </tr>
		            <tr>
		                <td>Password:</td>
		                <td><input type='password' name='password' /></td>
		            </tr>
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Submit" /></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
	    </div>
	    
	    <div id = "sign_up">
	    	<c:if test="${not empty error}">
		        <div class="error">${error}</div>
		    </c:if>
		    <c:if test="${not empty msg}">
		        <div class="msg">${msg}</div>
		    </c:if>
		
		    <form name='loginForm'
		          action="<c:url value='/j_spring_security_check' />" method='POST'>
		
		        <table>
		            <tr>
		                <td>*Name:</td>
		                <td><input type='text' name='username' value='' id="name"></td>
		            </tr>
		            <tr>
		                <td>*Surname:</td>
		                <td><input type='text' name='password' /></td>
		            </tr>
		            <tr>
		                <td>*E-mail:</td>
		                <td><input type='email' name='username' value=''></td>
		            </tr>
		            <tr>
		                <td>*Password:</td>
		                <td><input type='password' name='password' /></td>
		            </tr>
		            <tr>
		                <td>Phone:</td>
		                <td><input type='tel' name='username' value=''></td>
		            </tr>
		             <tr>
		                <td>Country:</td>
		                <td><input type='text' name='password' /></td>
		            </tr>
		            <tr>
		                <td>City:</td>
		                <td><input type='text' name='username' value=''></td>
		            </tr>
		            <tr>
		                <td>Address:</td>
		                <td><input type='password' name='password' /></td>
		            </tr>
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" action="#" type="submit"
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