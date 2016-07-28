<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Login Page</title>
    
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
    
</head>
<body onload='document.loginForm.username.focus();'>

<img id = "background_image" src="${pageContext.request.contextPath}/resources/images/background.jpg">

<div id = "menu">
	<div id = "logo_div">
		<a href="/e-learning/"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
		<ul>
		  <li><a href="/e-learning/">Back to main page</a></li>
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