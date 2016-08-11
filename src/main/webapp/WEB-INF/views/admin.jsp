<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
    <title>Appollo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/knowledge.css">
    
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
		    var h2 = $("#search_user_div").height();
		    var h3 = $("#first_form").height();
		    var h4 = h1 - h2 - h3 - 15 - 15 - 20 - 20-20-10;
		    $("#user_search_div").css("height",h4);
		});
		$(window).resize(function(){
			var h1 = $("#search-users-box").height();
		    var h2 = $("#search_user_div").height();
		    var h3 = $("#first_form").height();
		    var h4 = h1 - h2 - h3 - 15 - 15 - 20 - 20-20-10;
		    $("#user_search_div").css("height",h4);
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
<body onload='document.loginForm.username.focus();' style="background-color:#374140;">
<img id = "background_image" src = "${pageContext.request.contextPath}/resources/images/background.jpg">
<div id = "menu">
        <div id = "logo_div">
            <a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
            <div class="col-md-89" style="">
                <ul class="nav nav-pills" id="nav_pills" >
                    <li class="technology_menu" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/requests">Download Requests</a>
                    </li>

                    <li>
                        <a href="upload"  id="uploadbttn"> Update content</a>
                    </li>
                </ul>
                <span style="font-size:30px;cursor:pointer" onclick="openNav()" id="sideNav"><img id = "img-avatar" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-circle" height="50px"></span>
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

<div id = "users">

	<!-- START LOGIN BOX -->

	<div id="search-users-box">
	    
	    <p style="font-size:20px;margin-bottom:10px;margin-top:0px;text-align:center;">Admin: set user type</p>
	    
		<div id = "first_form">
		
		    <form name='loginForm'
		          action="<c:url value='/admin' />" method='POST'>
		
		        <table id = "table_admin">
		            <tr>
		                <td>E-mail:</td>
		                <td><input type='email' name='email' value='' required></td>
		            </tr>
		            <tr>
		                <td>Type:</td>
		                <td><select id="changeTypeSelector" name="type_of_user">
						    <option value="normal user">Normal user</option>
						    <option value="content editor">Content Editor</option>
						    <option value="admin">Admin</option>
						  </select> 
		                </td>
		            </tr>
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submittt" type="submit"
		                                       value="Change" /></td>
		            </tr>
		            <tr>
		                <td><p style="color:red;">${error}</p>
		    <p style="color:green;">${success}</p></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
	    </div>
	    <div id = "search_user_div">
	    <input id="usrSearch_input" type="text" name="searchUsrs" placeholder="Search...">
			<select id="User_Type">
				<option value="-1"> Type filter</option>
				<option value="normal user"> Normal user</option>
				<option value="content editor"> Content editor</option>
				<option value="admin"> Admin</option>
			</select>
			<button class = "button_sign" onclick="searchUser()" style = "padding:5px;"> Search for users </button>
		</div>
	    <div id = "user_search_div">
			<table id="usr_SearchRestults">
				<!--  Aici intra rezultatele -->
			</table>
			
	    </div>
	    
	</div>
	<!-- END LOGIN BOX -->

</div>
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