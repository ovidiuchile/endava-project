<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="endava">

<link rel="icon"
	href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/default.css">

<title>Appollo</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/upload.css">
<style>
<%@include file="css/style.css"%>
</style>
</head>
<body style="width: 100vw; background-color: #374140;">



	<div style="width: calc(96vw - 20px);">
		<div id="menu" style="width: 100vw;">
			<div id="logo_div">
				<a href="${pageContext.request.contextPath}"> <img id="img_logo"
					src="${pageContext.request.contextPath}/resources/images/logo.png">
				</a>
				<div class="col-md-89 pull-right" style="">
					<ul class="nav nav-pills" id="nav_pills" style="">
						<li class="" style="left: 2px;"><a href="#">Try it
								yourself</a></li>
						<li class="" style=""><a
							href="${pageContext.request.contextPath}">Learn</a></li>
					</ul>
					<span
						style="font-size: 30px; cursor: pointer; position: absolute; right: 20px; top: 20px;"
						onclick="openNav()"> <img id="img-avatar"
						alt="Bootstrap Image Preview"
						src="${pageContext.request.contextPath}/resources/images/765-default-avatar.png"
						class="img-circle" height="50px">
					</span>
					<div class="col-md-1  pull-right" style="">
						<div id="mySidenav" class="sidenav" style="z-index: 99999;">
							<a href="javascript:void(0)" class="closebtn"
								onclick="closeNav()">&times;</a> <br> <a href="admin">Admin</a>

							<a href="change-password">Change Password</a> <a href="logout">Logout</a>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- ----------------------------------------------------------------- -->
		<div class="container" id="empty_id"
			style="margin-left: 0px; padding: 0px;">
			<div id="" style="margin-left: 0px;">
				<br>
				<div id="container" style="margin-left: 0px;">

					<div id="addMaterial" style="">
						<h3 id="h33">Delete question:</h3>
						<form name="materialForm" style=""
							action=" <c:url value='/delete_question' />" method="POST"
							enctype="multipart/form-data">
							<table style="width: 250px">
								<tr style="">
									<td style=""><p class="td_text">Name of technology:</p></td>
									<td><select class="topic-form" name="technology"
										id="question_select_technology" style="" required>
											<option value="">Select language</option>
									</select></td>
								</tr>
								<tr>
									<td><p class="td_text">Name of topic:</p></td>
									<td><select class="topic-form" name="topic" style=""
										id="question_select_topic" required>
											<option value="">Select topic</option>
									</select></td>
								</tr>
								<tr>
									<td><p class="td_text">Question:</p></td>
									<td><select class="topic-form" name="question" style=""
										id="question_select" required>
											<option value="">Select question</option>
									</select></td>
								</tr>
							</table>
							<table style="width: 250px">
								<tr>
									<td><input class="button_sign" name="submit" id="submitt3"
										type="submit" value="Delete question" /> <input type="hidden"
										name="_method" value="DELETE"></td>
								</tr>
							</table>
						</form>
					</div>
				</div>
				<!-- ---------------------------------------------------------------- -->
			</div>
		</div>
	</div>

	<script
		src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script
		src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script
		src="${pageContext.request.contextPath}/resources/js/zebra_datepicker.js"></script>
	<script>
	var user_type = '<%=session.getAttribute("user_type")%>
		';
		console.log(user_type);
	</script>

</body>

</html>