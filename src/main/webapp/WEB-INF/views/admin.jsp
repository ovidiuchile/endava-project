<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		  <li><a href="home">Back to main page</a></li>
		</ul>
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
		                <td><select name="type_of_user">
						    <option value="normal user">Normal user</option>
						    <option value="tutor">Tutor</option>
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
	    
	    <div id = "user_search_div">
	    
			<input id="usrSearch_input" type="text" name="searchUsrs" placeholder="Search...">
			<select id="User_Type" style="color:black;">
				<option value="-1"> Type filter</option>
				<option value="normal user"> Normal user</option>
				<option value="content editor"> Content editor</option>
				<option value="admin"> Administrator</option>
			</select>
			<button class = "button_sign" onclick="searchUser()" style = "padding:5px;"> Search for users </button>
			
			<table id="usr_SearchRestults">
				<!--  Aici intra rezultatele -->
			</table>
			
	    </div>
	    
	</div>
	<!-- END LOGIN BOX -->

</div>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
</body>
</html>