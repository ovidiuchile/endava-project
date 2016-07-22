<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">

	<title>The </title>

	<meta name="description" content="Source code generated using layoutit.com">
	<meta name="author" content="LayoutIt!">
	
	<link href="css/bootstrap.min.css" rel="stylesheet">
	<link href="css/style.css" rel="stylesheet">
	
	<style type="text/css">
		<%@include file="css/bootstrap.min.css" %>
	</style>
	<style type="text/css">
		<%@include file="css/style.css" %>
	</style>
	
	
</head>
<body>

	<div class="container-fluid">
		<div class="row" style="background-color:black;">
			<div class="col-md-2">
				<img alt="Bo" src="C:\Users\ochile\Desktop\internship java\e-learning\src\main\webapp\WEB-INF\views\images\Google+ alt.png" height="50px">
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
				<img alt="Bootstrap Image Preview" src="C:\Users\ochile\Desktop\internship java\e-learning\src\main\webapp\WEB-INF\views\images\Google+ alt.png" class="img-circle" height="50px">
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
			<div class="col-md-9">
				<p>
					Lorem ipsum dolor sit amet, <strong>consectetur adipiscing elit</strong>. Aliquam eget sapien sapien. Curabitur in metus urna. In hac habitasse platea dictumst. Phasellus eu sem sapien, sed vestibulum velit. Nam purus nibh, lacinia non faucibus et, pharetra in dolor. Sed iaculis posuere diam ut cursus. <em>Morbi commodo sodales nisi id sodales. Proin consectetur, nisi id commodo imperdiet, metus nunc consequat lectus, id bibendum diam velit et dui.</em> Proin massa magna, vulputate nec bibendum nec, posuere nec lacus. <small>Aliquam mi erat, aliquam vel luctus eu, pharetra quis elit. Nulla euismod ultrices massa, et feugiat ipsum consequat eu.</small>
				</p>
			</div>
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