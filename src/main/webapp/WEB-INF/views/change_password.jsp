<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!--%
   String email = request.getParameter( "email" );
   session.setAttribute( "email", email );
   
   
%-->
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
<body onload='document.loginForm.username.focus();' style="background-color:#374140;">

<div id = "menu">
	<div id = "logo_div">
		<a href="home"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
				<ul class="nav nav-pills" id="nav_pills" >
                    <li class="technology_menu" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/">Learn</a>
                    </li>
                    <li class="" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/compiler">Try it yourself</a>
                    </li>

                    <li>
                        <a href="upload"  id="uploadbttn"> Update content</a>
                    </li>
                </ul>
	</div>
</div>

<div id = "content_login">

	<!-- START LOGIN BOX -->
	<div id="login-box">
	    
	    <div id = "button_div">
	    	<p style="margin:0px;margin-bottom:-10px;">Change password</p>
	    </div>
	    
		<div id = "sign_in">
			
		    <p style="color:green;">${msg}</p>
		
		    <form name='loginForm' action=" <c:url value='change-password' />" method='POST'>
		
		        <table>
		            <tr>
		                <td>E-mail:</td>
		                <td><input type='email' name='email' value='' required/></td>
		            </tr>
		            <tr>
		                <td>Old password:</td>
		                <td><input type='password' name='old_password' value='' required/></td>
		            </tr>
		            <tr>
		                <td>New password:</td>
		                <td><input type='password' name='new_password' value='' required/></td>
		            </tr>
		            
		            <tr>
		                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
		                                       value="Change" style = "margin-left:105px;"/></td>
		            </tr>
		        </table>
		
		        <input type="hidden" name="${_csrf.parameterName}"
		               value="${_csrf.token}" />
		
		    </form>
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