<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="author" content="endava">

<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/style.css">
	
<title>Appollo</title>
</head>
<body>
	<div class="container-fluid">
		<div class="row" style="background-color: white;">
			<div class="col-md-3" style="background-color: white; height: auto;">
				<img alt="logo"
					src="${pageContext.request.contextPath}/resources/images/appollo.png"
					height="auto" width="144px"
					style="position: relative; top: 6px; left: 40px;">
			</div>

			<div class="col-md-8"
				style="top: 16px; position: absolute; left: 300px;">
				<ul class="nav nav-pills">
					<li class="dropdown"><select class="form-control"
						id="Language_Selector" style="height: 40px;">
							<option selected disabled hidden>Select language</option>
					</select></li>
					<li class="" style=""><a href="#">Try it yourself</a></li>
					<li><a href="#">Classroom</a></li>
					<li class=""><a href="#">Chat rooms</a></li>
					<li class=""><a href="#">Tests</a></li>
					<li class=""><a href="#">Profile</a></li>
				</ul>
			</div>
			<div class="col-md-1  pull-right"
				style="position: absolute; top: 7px; right: 0px;">
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="#">About</a> <a href="#">Services</a> <a href="#">Clients</a>
					<a href="#">Contact</a> <br> <a href="logout">Logout</a>
				</div>
				<span style="font-size: 30px; cursor: pointer" onclick="openNav()"><img
					alt="Bootstrap Image Preview"
					src="${pageContext.request.contextPath}/resources/images/765-default-avatar.png"
					class="img-circle" height="50px"></span>
			</div>
		</div>
		<hr>
		<div class="row">

			<div class="col-md-1 btn-group-vertical" id=""
				style="width: 300px; margin-top: 20px;">
				<div id="Topics" class="btn-group-vertical" style="width: 270px;">
					<!-- ---------------------------------------TOPIC VERTICAL NAV BAR------------------------------------ -->
				</div>
				<div class="search_input" style="margin-top: 10px;">
					<form onsubmit="searchMyStuff()">
						<input id="search_input" type="text" name="searchStuff"
							placeholder=" Search..." style="width: 196px; height: 32px;">
						<input id="submit_input" class="btn btn-default" type="submit"
							value="Submit">
					</form>
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
								<td><select class="topic-form" id="select_tech" style="height:40px; " >
							<option>Select language</option>
						</select></td>
							</tr>
							<tr>
								<td>Name of topic:</td>
								<td><input type='text' name='topic' value=''
									style="margin: 15px;" /></td>
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
								<td><select class="topic-form" id="select_technology" style="height:40px; " >
							<option>Select language</option>
						</select></td>
							</tr>
							<tr>
								<td>Name of topic:</td>
								<td><input type='text' name='topic' value=''
									style="margin: 15px;" /></td>
							</tr>
							<tr>
								<td>Name of material:</td>
								<td><input type='text' name='material' value=''
									style="margin: 15px;" /></td>
							</tr>
							<tr>
								<input type="file" name="file" size="50" />
							</tr>
							<tr>
								<td><input class="button_sign" name="submit" id="submitt"
									type="submit" value="Add file" /></td>
							</tr>
						</table>
					</form>
				</div>
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
		
</body>
</html>