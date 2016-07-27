<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	session.invalidate();
%>
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

<title>Appollo - logout</title>

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
					<li class="" style=""><a href="${pageContext.request.contextPath}/login">Go back</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>