<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>

	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="endava">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">

	<title>Appollo</title>
	

</head>
<body>

	<div class="container-fluid">
		<!--  AICI ESTE DATE
		<p>Date: <input type="text" id="datepicker"></p>
		-->
		<div class="row" style="background-color:white;">
			<div class="col-md-3" style="background-color:white; height:auto;">
				<a href="${pageContext.request.contextPath}"><img alt="logo" src="${pageContext.request.contextPath}/resources/images/appollo.png" height="auto" width="144px" style="position:relative; top:6px; left: 40px;"></a>
			</div>

			<div class="col-md-8" style="top:16px; position:absolute; left:300px; ">
				<ul class="nav nav-pills" id="nav_pills" >
					<li class="dropdown" id="firstli">
						<select class="form-control" id="Language_Selector" style="height:40px; " >
							<option selected disabled hidden>Select language</option>
						</select>
					</li>
					<li class="" style="">
						<a href="#">Try it yourself</a>
					</li>
					<li>
						<a href="#">Classroom</a>
					</li>
					<li class="">
						<a href="#">Chat rooms</a>
					</li>
					<li class="">
						<a href="#">Tests</a>
					</li>
					<li class="">
						<a href="admin">Profile</a>
					</li>
				</ul>
			</div>
			<div class="col-md-1  pull-right" style="position: absolute; top:7px; right:0px;">
				<div id="mySidenav" class="sidenav" style="z-index:99999;">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="#">About</a>
					<a href="#">Services</a>
					<a href="#">Clients</a>
					<a href="#">Contact</a>
					<br>
					<a href="change-password">Change Password</a>
					<a href="logout">Logout</a>
				</div>
				<span style="font-size:30px;cursor:pointer" onclick="openNav()"><img alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/765-default-avatar.png" class="img-circle" height="50px"></span>
			</div>
		</div>
		<hr>
		<div id="vr" style="position:absolute; left:320px;border-left:1px solid #EEE;height:80%"></div>
		<div class="row">
			
			<div class="col-md-1 btn-group-vertical" id="" style="width:290px; margin-top:20px; ">
				<div class="search_inputdiv" style="	margin-top: 10px;margin-bottom:10px;">
						<input id="search_input" type="text" name="searchStuff" placeholder="Search..." style=" height:32px;">
					<button id="bttn_search" onclick="show()"> Advanced Search</button>
						<div style="width:290px;height:150px;background-color: yellow; display:none;" id="Adv_search">
							<select id="Material_type">
								<option value="-1"> Select an Option</option>
								<option value="0"> Images</option>
								<option value="1"> Videos</option>
								<option value="2"> Power point</option>
							</select>
							<p>Date: <input type="text" id="datepicker"></p>
							<p>Content creator</p> <input type="text" id="content_creator"></p>
						</div>
						<input id="submit_input" class="btn btn-default" value="Search" onclick="search()">				
				</div>

				<div id="Topics" class="btn-group-vertical" style="">
<!-- ---------------------------------------TOPIC VERTICAL NAV BAR------------------------------------ -->
				</div>
				
			</div>
			
		<!-- primary container -->
		<div class="col-md-8 container" id="Carousel_container" style=" height:100% ">
			<br>
			<div id="myCarousel" class="carousel slide" data-ride="carousel"  oncontextmenu="return false;" align="center" >

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox" id="Carusel" >
					<div class="item active">
						<img src="${pageContext.request.contextPath}/resources/images/img_chania.jpg" alt="Chania" style="max-width:460; height: 345;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/img_chania2.jpg" alt="Chania" style="max-width:460; height: 345;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/img_flower.jpg" alt="Flower" style="max-width:460; height: 345;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/img_flower2.jpg" alt="Flower" style="max-width:460; height: 345;">
					</div>
				</div>

				<!-- Left and right controls -->
				<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
				<div class="dropdown" id = "drop_notes" style="display:block; position:static; margin-top:10px;">
					
					<button class="btn btn-primary dropdown-toggle" type="button" id="button_notes" style="float:left; ">Notes
						<span class="caret">
						</span>
					</button>
					
					<img src="http://iconbug.com/data/21/256/3c4d4ac0f036ce984c00c8fead049901.png" id="download_img">
					
				</div>
				<div id ="div_notes" style="margin-top:55px;">

				</div>

			</div>
			<div id="material" align="center" style="padding-left:0px; display:none; height:450px;" oncontextmenu="return false;">

			</div>
		<!-- end primary container -->

			<!-- search container -->
			<div id = "search-container" style=" display : none; margin-left:30px;" >
			</div>
			<!-- end search container -->
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
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
	<script src="${pageContext.request.contextPath}/resources/js/zebra_datepicker.js"></script>
	<script>
	</script>
</body>
</html>