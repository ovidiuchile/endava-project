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
		    
		    var h1 = $("#search-users-box").height();
		    var h2 = $("#first_form").height();
		    var h3 = h1 - h2 - 20 - 15 - 15 - 20 - 20;
		    $("#user_search_div").css("height",h3);
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
			var h1 = $("#search-users-box").height();
		    var h2 = $("#first_form").height();
		    var h3 = h1 - h2 - 20 - 15 - 15 - 20 - 20;
		    $("#user_search_div").css("height",h3);
		});
	</script>
    
</head>
<body onload='document.loginForm.username.focus();'>

<img id = "background_image" src="${pageContext.request.contextPath}/resources/images/background.jpg">

<div id = "menu">
	<div id = "logo_div">
		<a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
		<ul>
		  <li><a href="${pageContext.request.contextPath}">Back to main page</a></li>
		</ul>
	</div>
</div>

<div id = "users">

	<!-- START LOGIN BOX -->

	<div id="search-users-box">
	    
	    <div id = "test_div">
	    	<form name='compilerForm' action="<c:url value='/compiler/java' />" method='POST'>
				  <textarea name="source" rows="20" cols="80">${source}</textarea>
				  <br>
				  <input type="submit" value = "Run">
			</form>
			<div id = "system_out_println"> ${result} </div>
	    </div>
	    
	</div>
	<!-- END LOGIN BOX -->

</div>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>