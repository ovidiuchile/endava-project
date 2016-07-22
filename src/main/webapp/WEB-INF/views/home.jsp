<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>Bootstrap 3, from LayoutIt!</title>

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">
	
	<style>
		<%@include file="css/bootstrap.min.css"%>
		<%@include file="css/style.css"%>
	</style>

  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	
	
</head>
<body>

	<div class="container-fluid">
		<div class="row" style="background-color:black;">
			<div class="col-md-2">
				<img alt="Bootstrap Image Preview" src="Google+ alt.png" height="50px">
			</div>
			<div class="col-md-8">
				<ul class="nav nav-pills" >
					<li class="active">
						<a href="#">Home</a>
					</li>
					<li>
						<a href="#">Profile</a>
					</li>
					<li class="disabled">
						<a href="#">Messages</a>
					</li>
					<li class="dropdown" >
						<select class="form-control" id="faka_you">
							<option value="1">One</option>
							<option value="2">Two</option>
							<option value="3">Three</option>
							<option value="4">Four</option>
							<option value="5">Five</option>
						</select>
					</li>
				</ul>
			</div>
			<div class="col-md-2">
				<img alt="Bootstrap Image Preview" src="Google+ alt.png" class="img-circle" height="50px">
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<ol>
					<li>
						Lorem ipsum dolor sit amet
					</li>
					<li>
						Consectetur adipiscing elit
					</li>
					<li>
						Integer molestie lorem at massa
					</li>
					<li>
						Facilisis in pretium nisl aliquet
					</li>
					<li>
						Nulla volutpat aliquam velit
					</li>
					<li>
						Faucibus porta lacus fringilla vel
					</li>
					<li>
						Aenean sit amet erat nunc
					</li>
					<li>
						Eget porttitor lorem
					</li>
				</ol>
			</div>
			
			<!-- The beginning of Dorin's Part!! -->
			
			<style>
				#div_slide{
					width:100%;
					height:400px;
					background-color:yellow;
				}
				#div_notes{
					width: 100%;
					height: 100px;
					background-color:yellow;
					margin-top:5px;
				}
				#download_img{
					height:40px;
					float:right;
				}
			</style>
			
			<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
			<script>
			$(document).ready(function(){
				var grandparent_height = $('.col-md-9').width();
			    $('#notes').width( grandparent_height );
			    $('#button_notes').click(function(){
			        $("#div_notes").fadeToggle(0);
			    });
			    $("#div_notes").fadeToggle(0);
			});
			$(window).resize(function(){
			    var grandparent_height = $('.col-md-9').width();
			    $('#notes').width( grandparent_height );
			});
			</script>
			
			<div class="col-md-9">
			
				<div id = "div_slide">
					
				</div>
			
				<div class="dropdown" id = "drop_notes">
				  
				  	<button class="btn btn-primary dropdown-toggle" type="button" id="button_notes">Notes
				   	<span class="caret"></span></button>
				    
				    <img src="http://iconbug.com/data/21/256/3c4d4ac0f036ce984c00c8fead049901.png" id="download_img">
				    
				 </div>
				 <div id ="div_notes">
				 
				 </div>
				
			</div>
			
			<!-- The end of Dorin's Part!! -->
			
		</div>
	</div>
	<script>
		document.getElementById("faka_you").addEventListener("change", function (e) {
			var option = document.getElementById('faka_you').value;
			console.log(option);
		})
	</script> 
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
</body>
</html>