<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login Page</title>
    <style>
    	body,head{
    		font-family: Arial, Helvetica, sans-serif;
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
        	
        	padding:10px;
        	opacity: 0.8;
        }
        #logo_div{
        	width:100%;
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
		ul {
		    list-style-type: none;
		    margin: 0;
		    padding: 0;
		    display:inline-block;
		    float:right;
		}
		
		li {
		    float: right;
		}
		
		li a {
		    display: block;
		    color: white;
		    text-align: center;
		    padding: 14px 16px;
		    text-decoration: none;
		}
		
		li a:hover {
		    background-color: #024873;
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
		    
		    if( $( window ).width() <= $( window ).height() * 1.5 ){
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
		<ul>
		  <li><a href="#home">Profile</a></li>
		  <li><a href="#home">Tests</a></li>
		  <li><a href="#home">Chat rooms</a></li>
		  <li><a href="#news">Classroom</a></li>
		  <li><a href="#contact">Try it yourself</a></li>
		  <li><a href="#about">Learn</a></li>
		</ul>
	</div>
</div>

<div id = "content_login">

	<!-- START LOGIN BOX -->
	<div id="login-box">
	    
	    <p style="font-size:20px;margin-bottom:10px;margin-top:0px;">Admin: set user type</p>
	    
		<div id = "sign_in">
		    
		    <p style="color:red;">${error}</p>
		    <p style="color:green;">${success}</p>
		
		    <form name='loginForm'
		          action="<c:url value='/admin' />" method='POST'>
		
		        <table>
		            <tr>
		                <td>E-mail:</td>
		                <td><input type='email' name='email' value=''></td>
		            </tr>
		            <tr>
		                <td>Type:</td>
		                <td><select name="type_of_user">
						    <option value="normal user">Normal user</option>
						    <option value="tutor">Tutor</option>
						    <option value="content editor">Content Editor</option>
						    <option value="admin">Admin</option>
						  </select>
		                </td>
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
	    
	</div>
	<!-- END LOGIN BOX -->

</div>

</body>
</html>