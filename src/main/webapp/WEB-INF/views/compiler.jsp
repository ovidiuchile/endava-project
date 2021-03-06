<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="endava">

	<script>
		var user_type = "<%= session.getAttribute("user_type") %>";
		var user_id = "<%= session.getAttribute("id") %>";
		console.log(user_type);
		$("#admin_button").hide();
		if(user_type=="normal user")
		{
			console.log("test");
			$("#uploadbttn").hide();
		}
		else if(user_type=="content editor")
		{
			console.log("test1");
			$("#uploadbttn").show();
		}
		else if(user_type=="admin")
		{
			$("#admin_button").show();
			console.log("test2");
			$("#uploadbttn").show();
		}

	</script>
	<link rel="icon" href="${pageContext.request.contextPath}/resources/images/small logo.png">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/knowledge.css">
    <title>appollo</title>
    
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
		    
		    var h1 = $("#search-users-box").height();
		    var h3 = ( h1 - 90 - 40 ) / 2;
		    $(".text-area-compiler").css("height",h3);
		    $("#system_out_println").css("height",h3);
		    
		   	$("#text-area-compiler-2").hide();
		    $("#select_language_compiler").change(function(){
		    	var option = document.getElementById("select_language_compiler").value;
		    	if(option == "java"){
		    		$("#text-area-compiler-1").show();
		    		$("#text-area-compiler-2").hide();
		    	}else if(option == "js"){
		    		$("#text-area-compiler-2").show();
		    		$("#text-area-compiler-1").hide();
		    	}
		    });
		    
		    ${selected_div}
		});
		$(window).resize(function(){
			var h1 = $("#search-users-box").height();
		    var h3 = ( h1 - 90 - 40 ) / 2;
		    $(".text-area-compiler").css("height",h3);
		    $("#system_out_println").css("height",h3);
		});
		
		$(document).ready(function(){
			if( $(window).width() < $(window).height() * 1.5 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
		    	var hh1 = $(window).height() - $("#background_image").height();
				$("#background_image").css("top",hh1);
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    	var hh1 = $(window).height() - $("#background_image").height();
				$("#background_image").css("top",hh1);
		    }
		});
		$(window).resize(function(){
			var hh1 = $(window).height() - $("#background_image").height();
			$("#background_image").css("top",hh1);
			if( $(window).width() < $(window).height() * 1.5 ){
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
<body style = "font-family:Century Gothic;">
<img id = "background_image" src = "${pageContext.request.contextPath}/resources/images/background.jpg">
<div id = "menu">
        <div id = "logo_div">
            <a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
            <div class="col-md-89" style="">
                <ul class="nav nav-pills" id="nav_pills" >
                    <li class="technology_menu" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/">Learn</a>
                    </li>
                    <li class="" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/compiler">Try it yourself</a>
                    </li>

                    <li>
                        <a href="upload"  id="uploadbttn" style="display:none"> Update content</a>
                    </li>
                </ul>
                <span style="font-size:30px;cursor:pointer" onclick="openNav()" id="sideNav"><img id = "img-avatar" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-circle" height="50px"></span>
                <div class="col-md-1  pull-right" style="">
                    <div id="mySidenav" class="sidenav" style="z-index:99999;">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <br>
                        <a href="admin" style="display:none" id="admin_button">Admin</a>

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
	    	<h4 style = "text-align:center;color:#D9CB9E">Compiler time!</h4>
	    	<form name='compilerForm' action="<c:url value='/compiler' />" method='POST'>
				  <textarea name="source1"  class = "text-area-compiler" id = "text-area-compiler-1" style="padding:10px;">${source1}</textarea>
				  <textarea name="source2"  class = "text-area-compiler" id = "text-area-compiler-2" style="padding:10px;">${source2}</textarea>
				  <br>
				  <select id = "select_language_compiler" name="technology">
					  <option value="java" ${option == "java" ? 'selected="selected"' : ''}>Java</option>
					  <option value="js" ${option == "js" ? 'selected="selected"' : ''}>JavaScript</option>
				  </select>
				  <input id = "run_button" type="submit" value = "Run your code"> 
			</form>
			<div id = "system_out_println" style="white-space: pre;padding:10px;"> ${result} </div>
	    </div>
	    
	</div>
	<!-- END LOGIN BOX -->

<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script>
	$('html').click(function() {
		closeNav();
	});
	$('#sideNav').click(function(event){
		event.stopPropagation();
	});
	$('#mySidenav').click(function(event){
		event.stopPropagation();
	});
	$('.closebtn').click(function(event){
		closeNav();
	});
</script>
</body>
</html>