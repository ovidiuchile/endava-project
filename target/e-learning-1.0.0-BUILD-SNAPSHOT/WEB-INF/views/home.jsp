<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<!DOCTYPE html>
<html lang="en">
<head>
	<style type="text/css">
		body {
			font-family:Arial;
			font-size:12px;
			background:#ededed;
		}
		.example-desc {
			margin:3px 0;
			padding:5px;
		}

		#carousel {
			width:960px;
			border:1px solid #222;
			height:300px;
			position:relative;
			clear:both;
			overflow:hidden;
			background:#FFF;
		}
		#carousel img {
			visibility:hidden; /* hide images until carousel can handle them */
			cursor:pointer; /* otherwise it's not as obvious items can be clicked */
		}

		.split-left {
			width:450px;
			float:left;
		}
		.split-right {
			width:400px;
			float:left;
			margin-left:10px;
		}
		#callback-output {
			height:250px;
			overflow:scroll;
		}
		textarea#newoptions {
			width:430px;
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
		</div>
	</div>
</div>
<script>
	$.ajaxSetup({
		async: false
	});
	var carusel = document.getElementById('carousel');
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
				AddTopic.appendChild(topic);
				j--;
			}
		});
		var AddTopic = document.getElementById('Topics');
		var j = AddTopic.childElementCount;
		console.log(j);
		console.log(AddTopic.childNodes.length);
		for (i of AddTopic.childNodes) {
			var button = i;
			button.addEventListener("click", function (e) {
				console.log(j);
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
					url: "technologies/" + option + "/topics/" + j + "/materials"
				}).then(function (data) {
					var material = document.createElement("img");
					material.name = "material"
					material.src = " http://img.memecdn.com/fak-yo-grammer_fb_743674.jpg"
					carusel.appendChild(material);
				});
			});
			j--;
		}
	});

</script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waterwheelCarousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.waterwheelCarousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script type="text/javascript">
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