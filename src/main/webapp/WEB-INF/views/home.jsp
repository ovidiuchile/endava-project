<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 <%@ page session="false"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
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
		<div class="row" style="background-color:white;">
			<div class="col-md-3">
				<img alt="Bootstrap Image Preview" src="C:\Users\ochile\Desktop\1469100345.layoutit\layoutit\src\altu.png" height="50px">
			</div>
			<div class="col-md-6">
				<ul class="nav nav-pills" >
					<li class="dropdown" >

						<select class="form-control" id="faka_you" style="height:40px; " >
							<option selected disabled hidden>Select language</option>

						<select class="form-control" id="Language_Selector">

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
						<a href="#">Profile</a>
					</li>
				</ul>
			</div>
			<div class="col-md-1 pull-right">
				<div id="mySidenav" class="sidenav">
					<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
					<a href="#">About</a>
					<a href="#">Services</a>
					<a href="#">Clients</a>
					<a href="#">Contact</a>
				</div>
				<span style="font-size:30px;cursor:pointer" onclick="openNav()"><img alt="Bootstrap Image Preview" src="C:\Users\ochile\Desktop\1469100345.layoutit\layoutit\src\altu.png" class="img-circle" height="50px"></span>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3" id="Topics">
					-- aici o sa intre topicurile formate
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
				

			<div class="col-md-9" align="center">
				<div id="carousel" >
					<a href="#"><img src="images/1.jpg" id="item-1" /></a>
					<a href="#"><img src="images/2.jpg" id="item-2" /></a>
					<a href="#"><img src="images/3.jpg" id="item-3" /></a>
					<a href="#"><img src="images/4.jpg" id="item-4" /></a>
					<a href="#"><img src="images/5.jpg" id="item-5" /></a>
					<a href="#"><img src="images/6.jpg" id="item-6" /></a>
					<a href="#"><img src="images/7.jpg" id="item-7" /></a>
					<a href="#"><img src="images/8.jpg" id="item-8" /></a>
					<a href="#"><img src="images/9.jpg" id="item-9" /></a>
				</div>
				<a href="#" id="prev">Prev</a> | <a href="#" id="next">Next</a>

				<br/>
				<div class="div_down" style="background-color:black;">
					div down
				</div>

			<p class="greeting-id"></p>
			<div class="col-md-9">
				<p id="Test">
					Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
				</p>

			</div>
			
			<!-- The end of Dorin's Part!! -->
			
		</div>
	</div>
	<script>
		$(".form-control").change(function() {
			var option = document.getElementById('Language_Selector').value;
			var AddTopic = document.getElementById('Topics');
			$.ajax({
				type:'GET',
				dataType: 'json',
				url: "technologies/"+ option+ "/topics"
			}).then(function(data)
			{
				for(i=0;i<data.content.length;i++)
				{
					var topic = document.createElement("button");
					var content= (Object.keys(data.content[i]));
					topic.innerHTML = content.content.name;
					AddTopic.appendChild(topic);
				}
			});
		});
	</script> 
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		/* Set the width of the side navigation to 0 */
		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<!--<script type="text/javascript">
		Add the % between < and @         <@ include file="http://code.jquery.com/jquery-1.9.1.min.js"%>
	</script>-->
	<script type="text/javascript">
		<%@include file="css/style.css"%>
		<%@include file="js/jquery.waterwheelCarousel.js"%>
	</script>
	<script type="text/javascript">
		$(document).ready(function () {
			var carousel = $("#carousel").waterwheelCarousel({
				flankingItems: 3,
				movingToCenter: function ($item) {
					$('#callback-output').prepend('movingToCenter: ' + $item.attr('id') + '<br/>');
				},
				movedToCenter: function ($item) {
					$('#callback-output').prepend('movedToCenter: ' + $item.attr('id') + '<br/>');
				},
				movingFromCenter: function ($item) {
					$('#callback-output').prepend('movingFromCenter: ' + $item.attr('id') + '<br/>');
				},
				movedFromCenter: function ($item) {
					$('#callback-output').prepend('movedFromCenter: ' + $item.attr('id') + '<br/>');
				},
				clickedCenter: function ($item) {
					$('#callback-output').prepend('clickedCenter: ' + $item.attr('id') + '<br/>');
				}
			});

			$('#prev').bind('click', function () {
				carousel.prev();
				return false
			});

			$('#next').bind('click', function () {
				carousel.next();
				return false;
			});

			$('#reload').bind('click', function () {
				newOptions = eval("(" + $('#newoptions').val() + ")");
				carousel.reload(newOptions);
				return false;
			});

		});
	</script>
</body>
</html>