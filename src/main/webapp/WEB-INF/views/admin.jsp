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
		<a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
		<ul>
		  <li><a href="/e-learning/">Back to main page</a></li>
		</ul>
	</div>
</div>

<div id = "content_login">

	<!-- START LOGIN BOX -->
	<div id="search-users-box">
	    
	    
	    
	</div>
	<!-- END LOGIN BOX -->

</div>

</body>
</html>