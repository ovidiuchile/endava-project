<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
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

	<title>Appollo</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$(window).mouseenter(function(){
				$(".Zebra_DatePicker_Icon").css("left", "10px");
				$(".Zebra_DatePicker_Icon").css("top", "15px");
			});
			if( $( window ).width() <= $( window ).height() * 1.5 ){
				$("#background_1").css("height","100%");
				$("#background_1").css("width","auto");
			}
			else{
				$("#background_1").css("width","100%");
				$("#background_1").css("height","auto");
			}
		});
		$(window).resize(function(){
			$("#Adv_search").hide();
			if( $( window ).width() < $( window ).height() * 1.5 ){
				$("#background_1").css("height","100%");
				$("#background_1").css("width","auto");
			}
			else{
				$("#background_1").css("width","100%");
				$("#background_1").css("height","auto");
			}
		});
	</script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
</head>
<body>
	<img src="${pageContext.request.contextPath}/resources/images/background1.jpg" id = "background_1">
	
	
	<div >
		
		<div id = "menu">
			<div id = "logo_div">
				<a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
				<div class="col-md-89" style="">
					<ul class="nav nav-pills" id="nav_pills" >
						<li class="dropdown" id="firstli" style="z-index:99999;">
							<select class="form-control" id="Language_Selector" style="height:40px; z-index:99999;" >
								<option selected disabled hidden>Technologies</option>
							</select>
						</li>
						<li class="" style="">
							<a href="#">Try it yourself</a>
						</li>
						<li class="" style="">
							<a href="upload">Upload material</a>
						</li>
					</ul>
					<span style="font-size:30px;cursor:pointer" onclick="openNav()"><img id = "img-avatar" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/765-default-avatar.png" class="img-circle" height="50px"></span>
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
		
		
		
		<div class="col-md-8 container"
				style="padding-left: 20px; border-left: 1px solid #eee; height: 100%;">
				<br>
				<div id="addTechnology">

					<h3>Add a new technology</h3>
					<p style="color: red;">${error}</p>
					<p style="color: green;">${success}</p>

					<form id= "technologyForm" name='technologyForm' enctype='application/json'
						action=" <c:url value='/technologies' />" method='POST' enctype='application/json'>

						<table>
							<tr>
								<td>Name of technology:</td>
								<td><input type='text' name='technology'
									style="margin: 15px;" /></td>
							</tr>
							<tr>
								<td><input class="button_sign" name="submit" id="submitt" type = "submit"
									value="Add technology"/></td>
							</tr>
						</table>
					</form>
				</div>
				<div id="addTopic">
					<h3>Add new topic:</h3>
					<form name="topicForm" action=" <c:url value='/upload-topic' />"
						method="POST">
						<table>
							<tr>
								<td>Name of technology:</td>
								<td><select class="topic-form" name = 'technology' id="select_tech" style="height:40px; " >
									<option>Select language</option>
									</select></td>
							</tr>
							<tr>
								<td>Name of topic:</td>
								<td>
									<input type='text' name='topic' value=''
										   style="margin: 15px;"  />
								</td>
							</tr>
							<tr>
								<td><input class="button_sign" name="submit" id="submitt"
									type="submit" value="Add topic" /></td>
							</tr>
						</table>
					</form>
				</div>

				<div id="addMaterial">
					<h3>Add new material:</h3>
					<form name="materialForm"
						action=" <c:url value='/upload-material' />" method="POST"
						enctype="multipart/form-data">
						<table>
							  <tr>
								<td>Name of technology:</td>
								<td><select class="topic-form" name = "technology" id="select_technology" style="height:40px; " >
							<option>Select language</option>
						</select></td>
							</tr>
							<tr>
								<td>Name of topic:</td>
								<td>
									<select class="topic-form" name = "topic" style="height:40px; " id="select_topic" >
										<option>Select topic</option>
									</select></td>
							</tr>
							<tr>
								<td>Name of material:</td>
								<td><input type='text' name='material' value=''
									style="margin: 15px;" /></td>
							</tr>
							<tr>
								<td><input type='file' name='file' size="50000" /></td>
							</tr>
							<tr>
								<td><input class="button_sign" name="submit" id="submitt"
									type="submit" value="Add material" /></td>
							</tr>
						</table>
					</form>
				</div>
			</div>
		

		
	</div>


	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/zebra_datepicker.js"></script>
	<script>
		var user_type = '<%= session.getAttribute("user_type") %>';
		console.log(user_type);
	</script>
	
</body>

</html>