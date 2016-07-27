<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
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

	<title>Appollo</title>

</head>
<body>

	<div class="container-fluid">
		<div class="row" style="background-color:white;">
			<div class="col-md-3" style="background-color:white; height:auto;">
				<img alt="logo" src="${pageContext.request.contextPath}/resources/images/appollo.png" height="auto" width="144px" style="position:relative; top:6px; left: 40px;">
			</div>

			<div class="col-md-8" style="top:16px; position:absolute; left:300px;" id="">
				<ul class="nav nav-pills" >
					<li class="dropdown" >
						<select class="form-control" id="Language_Selector" style="height:40px; " >
							<option selected disabled hidden>Select language</option>
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
							<option value="4">Four</option>
							<option value="5">Five</option>
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
						<a href="#">Search</a>
					</li>
				</ul>
			</div>
			<div class="col-md-1  pull-right" style="position: absolute; top:7px; right:0px;">
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="#">About</a>
					<a href="#">Services</a>
					<a href="#">Clients</a>
					<a href="#">Contact</a>
					<br>
					<a href="logout">Logout</a>
				</div>
				<span style="font-size:30px;cursor:pointer" onclick="openNav()"><img alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/765-default-avatar.png" class="img-circle" height="50px"></span>
			</div>
		</div>
		<hr>
		<div class="row">
			<div class="col-md-1 btn-group-vertical"  style="margin-top:20px; width:300px; ">
				<div class="btn-group-vertical" style="width:270px;" id="Topics"></div>
				<!-- ----------------------------TOPIC VERTICAL NAV BAR----------------------- -->
				<div class="search_input" style="	margin-top: 10px;">
					<form onsubmit="searchMyStuff()">
						<input id="search_input" type="text" name="searchStuff" placeholder=" Search..." style="width: 196px; height:32px;">
						<input id="submit_input" class="btn btn-default" type="submit" value="Submit">
					</form>				
				</div>
			</div>
		<div class="col-md-8 container" style=" height:100%; padding-left:20px; border-left: 1px solid #eee;">
			<br>
			<div id="myCarousel" class="carousel slide" data-ride="carousel" style="">

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox" id="Carusel" >
					<div class="item active">
						<img src="${pageContext.request.contextPath}/resources/images/img_chania.jpg" alt="Chania" style="max-width:460;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/img_chania2.jpg" alt="Chania" style="max-width:460;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/img_flower.jpg" alt="Flower" style="max-width:460;">
					</div>

					<div class="item">
						<img src="${pageContext.request.contextPath}/resources/images/img_flower2.jpg" alt="Flower" style="max-width:460;">
					</div>
				</div>
			
				
				<!-- Left and right controls -->
				<a class="left carousel-control"  id="carousel_navigation1" href="#myCarousel" role="button" data-slide="prev">
					<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
					<span class="sr-only">Previous</span>
				</a>
				<a class="right carousel-control" id="carousel_navigation2" href="#myCarousel" role="button" data-slide="next">
					<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
					<span class="sr-only">Next</span>
				</a>
			</div>
			
			<div id="material"  style="display:none;">
				<img src="http://i49.tinypic.com/2ez5xtx.jpg " onclick="functiontry()" >
				
			</div>
			<button id="hide" onclick="hide()">
				afoasbhidgvoa
			</button>
			
			<br>
			
			<!--  this is not visibile##############
			<div class="dropdown" id = "drop_notes" style="display:none;"> 
					
					<button class="btn btn-primary dropdown-toggle" type="button" id="button_notes">Notes
						<span class="caret">
						</span>
					</button>
					
					<img src="http://iconbug.com/data/21/256/3c4d4ac0f036ce984c00c8fead049901.png" id="download_img">
					
			</div>
			
			<div id ="div_notes">
					
			</div>
			
			#############-->
		</div>
	</div>
	</div>
	
	
	<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
	<script>
	
	
		var div_material_state=0;
		function hide()
		{
			var hide = document.getElementById('material');
			if (div_material_state==1){
				hide.style.display= " none";
				div_material_state=0;
			}else{
				hide.style.display="inline";
				div_material_state=1;
			}
			
			
		}
		
		function functiontry()
		{
			alert("fuaka you");
		}
	</script>

</body>
</html>