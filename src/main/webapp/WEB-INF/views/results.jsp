<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Search Results</title>

    <meta name="description" content="Source code generated using layoutit.com">
    <meta name="author" content="LayoutIt!">

    <style>
        <%@include file="css/bootstrap.min.css"%>
        <%@include file="css/style.css"%>
    </style>


</head>
<body >

<div class="container-fluid">
    <form name='loginForm' action=" <c:url value='/simpleSearch' />" method='POST'>

        <table>
            <tr>
                <td>search:</td>
                <td><input type='text' name='searchString' value='' required id="test"/></td>
            </tr>
            <tr>
                <td colspan='2'><input class = "button_sign" name="submit" id = "submitt" type="submit"
                                       value="Submit" /></td>
            </tr>
        </table>

        <input type="hidden" name="${_csrf.parameterName}"
               value="${_csrf.token}" />

    </form>

    ${results}

    <c:forEach var="result" items="${results}">
        <tr>
            <td>${result.title}</td>
            <td>${result.description}</td>
        </tr>
    </c:forEach>
</div>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/scripts.js"></script>
</body>
</html>