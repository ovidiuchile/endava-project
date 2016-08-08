<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="endava">
	
	
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/knowledge.css">
    <title>Login Page</title>
    
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
		    var h3 = ( h1 - 90 ) / 2;
		    $("#text-area-compiler").css("height",h3);
		    $("#system_out_println").css("height",h3);
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
		    var h3 = ( h1 - 90 ) / 2;
		    $("#text-area-compiler").css("height",h3);
		    $("#system_out_println").css("height",h3);
		});
	</script>
    
</head>
<body onload='document.loginForm.username.focus();'>

<div id = "menu">
        <div id = "logo_div">
            <a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
            <div class="col-md-89" style="">
                <ul class="nav nav-pills" id="nav_pills" >
                    <li class="" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/">Technologies</a>
                    </li>
                    <li class="" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/compiler/java">Try it yourself</a>
                    </li>

                    <li>
                        <a href="upload"  id="uploadbttn"> Upload material</a>
                    </li>
                </ul>
                <span style="font-size:30px;cursor:pointer" onclick="openNav()"><img id = "img-avatar" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-circle" height="50px"></span>
                <div class="col-md-1  pull-right" style="">
                    <div id="mySidenav" class="sidenav" style="z-index:99999;">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <br>
                        <a href="admin">Admin</a>

                        <a href="change-password">Change Password</a>

                        <a href="logout">Logout</a>
                    </div>

                </div>
            </div>
        </div>
    </div>


	<!-- START LOGIN BOX -->

	<div id="search-users-box">
	    <div id = "test_div">
	    	<p style = "color:#D9CB9E;margin:auto;">Compile me, baby :*</p>
	    	<form name='compilerForm' action="<c:url value='/compiler/java' />" method='POST'>
				  <textarea name="source"  id = "text-area-compiler" >${source}</textarea>
				  <br>
				  <select id = "select_language_compiler" >
					  <option value="volvo">Java</option>
					  <option value="saab">JavaScript</option>
				  </select>
				  <input id = "run_button" type="submit" value = "Run your code"> 
			</form>
			<div id = "system_out_println"> ${result} </div>
	    </div>
	    
	</div>
	<!-- END LOGIN BOX -->

<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>