<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>Bootstrap Example</title>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<style>
		.carousel-inner > .item > img,
		.carousel-inner > .item > a > img {
			width: 70%;
			margin: auto;
		}
	</style>

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


</head>
<body>

<div class="container-fluid">
	<div class="row" style="background-color:black;">
		<div class="col-md-2">
			<img src="${pageContext.request.contextPath}/resources/images/1.jpg" id="">
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
					<select class="form-control" id="Language_Selector">
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
	</div>
	<div class="row">
		<div class="col-md-3" id="Topics">


		</div>


	</div>

	<div class="container">
		<br>
		<div id="myCarousel" class="carousel slide" data-ride="carousel">

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox" id="Carusel">
				<div class="item active">
					<img src="img_chania.jpg" alt="Chania" width="460" height="345">
				</div>

				<div class="item">
					<img src="img_chania2.jpg" alt="Chania" width="460" height="345">
				</div>

				<div class="item">
					<img src="img_flower.jpg" alt="Flower" width="460" height="345">
				</div>

				<div class="item">
					<img src="img_flower2.jpg" alt="Flower" width="460" height="345">
				</div>
			</div>


					Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
				</p>
			</div>
			
			<!-- The end of Dorin's Part!! -->
		</div>
	</div>
	<div class="row">
		<div class="col-md-3" id="Topics">


		</div>
		<p class="greeting-id"></p>
		<div id="carousel">
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/1.jpg" id="item-1"></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/2.jpg" id="item-2" /></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/3.jpg" id="item-3" /></a>
			<a href="#"><img src="${pageContext.request.contextPath}/resources/images/4.jpg" id="item-4" /></a>

			<!-- Left and right controls -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>

		</div>

	</div>
</div>
<script>
	$.ajaxSetup({
		async: false
	});
	var carusel = document.getElementById('Carusel');
	$(".form-control").change(function() {
		var option = document.getElementById('Language_Selector').value;
		var AddTopic = document.getElementById('Topics');
		while (carusel.childElementCount != 0) {
			try {
				carusel.removeChild(carusel.childNodes[0]);
			}
			catch (e) {

			}
		}
		while (AddTopic.childElementCount != 0) {
			try {
				AddTopic.removeChild(AddTopic.childNodes[0]);
			}
			catch (e) {

			}
		}
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: "technologies/" + option + "/topics"
		}).then(function (data) {
			var j = data.content.length;
			for (i of data.content) {
				var topic = document.createElement("button");
				topic.name = i.content.name;
				topic.value = j;
				topic.innerHTML = i.content.name;
				handleelement(j,topic,option);
				j--;
				AddTopic.appendChild(topic);
			}
		});
	});


	function handleelement(i,topic,option)
	{
		topic.addEventListener("click", function (e) {
			console.log(i,topic,option);
			while (carusel.childElementCount != 0) {
				try {
					carusel.removeChild(carusel.childNodes[0]);
				}
				catch (e) {

				}
			}
			$.ajax({
				type: 'GET',
				dataType: 'json',
				url: "technologies/" + option + "/topics/" + i + "/materials"
			}).then(function (data) {
				var test=0;
				console.log(data.content.length);
				for(k of data.content) {
					if (test == 0) {
						var carousel = document.getElementById('Carusel');
						var material = document.createElement("img");
						var div = document.createElement("div");
						div.className = "item active";
						material.name = "material"
						material.innerHTML = " test";
						material.src = k.content.link;
						div.appendChild(material);
						carousel.appendChild(div);
					}
					else {
						var carousel = document.getElementById('Carusel');
						var div2 = document.createElement("div");
						var material = document.createElement("img");
						material.name = "material"
						material.innerHTML = " test";
						material.src = k.content.link;
						div2.className = "item ";
						console.log(k, material.name);
						div2.appendChild(material);
						carousel.appendChild(div2);
					}
					test++;
				}
			});
		});
	}

</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
	<%@include file="js/jquery.waterwheelCarousel.js"%>
</script>

		$('#reload').bind('click', function () {
			newOptions = eval("(" + $('#newoptions').val() + ")");
			carousel.reload(newOptions);
			return false;
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

<script>
</script>

</body>
</html>