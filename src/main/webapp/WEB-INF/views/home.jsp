<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="endava">

    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">

    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/knowledge.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/metallic.css">


    <title>Appollo</title>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $(window).mouseenter(function(){
                $(".Zebra_DatePicker_Icon").css("left", "10px");
                $(".Zebra_DatePicker_Icon").css("top", "15px");
            });
        });
        $(window).resize(function(){
            $("#Adv_search").hide();
        });
        $(document).ready(function(){
			if( $(window).width() < $(window).height() * 1.5 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
		    	var hh1 = $(window).height() - $("#background_image").height() + 40;
				$("#background_image").css("top",hh1);
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    	var hh1 = $(window).height() - $("#background_image").height();
				$("#background_image").css("top",hh1);
		    }
		});
		$(window).resize(function(){
			var hh1 = $(window).height() - $("#background_image").height();
			$("#background_image").css("top",hh1);
			if( $(window).width() < $(window).height() * 1.5 ){
		    	$("#background_image").css("height","100%");
		    	$("#background_image").css("width","auto");
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    }
		});
    </script>
</head>
<body>
<img id = "background_image" src = "${pageContext.request.contextPath}/resources/images/background.jpg">

<div >

    <div id = "menu">
        <div id = "logo_div">
            <a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
            <div class="col-md-89" style="">
                <ul class="nav nav-pills" id="nav_pills" >
                    <li class="dropdown" id="firstli" style="z-index:99999;">
                        <select class="form-control" id="Language_Selector" style="height:42px; z-index:100000; border-color: #D9CB9E;" >
                            <option selected disabled hidden style="">Technologies</option> 
                        </select>
                    </li>
                    <li class="" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/compiler">Try it yourself</a>
                    </li>

                    <li>
                        <a href="upload"  id="uploadbttn"> Update content</a>
                    </li>
                </ul>
                <span style="font-size:30px;cursor:pointer" onclick="openNav()" id = "sideNav"><img id = "img-avatar" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-circle" height="50px"></span>
                <div class="col-md-1  pull-right" style="">
                    <div id="mySidenav" class="sidenav" style="z-index:99999;">
                        <a href="javascript:void(0)" class="closebtn" ">&times;</a>
                        <br>
                        <a href="admin" id = "admin_button">Admin</a>

                        <a href="change-password">Change Password</a>

                        <a href="logout">Logout</a>
                    </div>

                </div>
            </div>
        </div>
    </div>




    <div id="vr" style="position:absolute; left:320px;border-left:1px solid #D13F32; height: calc( 100% - 100px)  ;margin-top:15px;"></div>
    <div id = "main_div" style="margin-top:10px;">

        <div class="col-md-1 btn-group-vertical" id="" style="width:290px; margin-top:20px;">
            <div class="search_inputdiv" >
                <input id="search_input" type="text" name="searchStuff" placeholder="Search..." style="  height:32px;color:black;   ">

                <div style=" display:none;" id="Adv_search">
                    <select id="Material_type" style="color:black;">
                        <option value="-1"> Select an Option</option>
                        <option value="0"> Images</option>
                        <option value="1"> Videos</option>
                        <option value="2"> PDF</option>
                    </select>
                    <table>
                        <tr>
                            <td><p>From : </p></td><td><input style=""  type="text" id="datepicker1"></td>
                        </tr>
                        <tr>
                            <td><p>To :</p></td><td><input style=""  type="text" id="datepicker2">
                        </tr>
                        <tr>
                            <td><p>Content editor:</p></td><td><input type="text" style="" id="content_creator">
                        </tr>
                    </table>
                </div>

                <button class="btn btn-default" id="bttn_search" onclick="show()"> Advanced Search</button>
                <input id="submit_input" class="btn btn-default" value="Search" type="submit" onclick="search()">
            </div>

            <div id="Topics" class="btn-group-vertical" style="margin-top:20px;">
                <!-- ---------------------------------------TOPIC VERTICAL NAV BAR------------------------------------ -->
            </div>

        </div>

        <!-- primary container -->
        <div class="col-md-11 container" id="Carousel_container" >
            <br>
            <div id="myCarousel" class="carousel slide" data-ride="carousel"  oncontextmenu="return false;" style="" >

                <!-- Wrapper for slides -->
                <div class="carousel-inner" role="listbox" id="Carusel" style="background-color:transparent;">
                    <div class="item active">
                        <img src="${pageContext.request.contextPath}/resources/images/img_chania.jpg" alt="Chania" >
                    </div>

                    <div class="item">
                        <img src="${pageContext.request.contextPath}/resources/images/img_chania2.jpg" alt="Chania" >
                    </div>

                    <div class="item">
                        <img src="${pageContext.request.contextPath}/resources/images/img_flower.jpg" alt="Flower" >
                    </div>

                    <div class="item">
                        <img src="${pageContext.request.contextPath}/resources/images/img_flower2.jpg" alt="Flower" >
                    </div>
                </div>

                <!-- Left and right controls -->
                <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true" style="color:#D9CB9E;"></span>
                    <span class="sr-only">Previous</span>
                </a>
                <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true" style="color:#D9CB9E;"></span>
                    <span class="sr-only">Next</span>
                </a>
            </div>

            <div id="material" align="center" style="padding-left:0px; display:none; height:450px;" oncontextmenu="return false;">
            </div>
            <div id="material_info">
                <p id="Material_name"> </p>
                <p id="Material_Desc" align="justify"> </p>
                <div class="dropdown" id = "drop_notes" style="display:none; position:static; margin-top:10px; margin-bottom">
                    <a href="#" style="display:none;" id="download_button"><img src="${pageContext.request.contextPath}/resources/images/download_button.png" style=" margin-bottom:20px;" id="download_img"></a>
 
                </div>
            </div>
            <div>
                <input id="test_input" style="display:none" class="btn btn-default" value="Test your knowledge" type="submit" >
            </div>


            <!-- end primary container -->

            <!-- search container -->
            <div id = "search-container" style=" display : none;" >
            </div>
            <!-- end search container -->


            <!-- test space -->
            <div id="testspace" style="display:none">
                <img id="image" src="${pageContext.request.contextPath}/resources/images/logo.png">
            </div>
            <div id="testAnswer">

            </div>
            <button class="test_button" id="answer_button" style=" display:none; position:relative; left:45px; "> Test result</button>
            <button class="test_button" id="retake_button"style=" display:none; position:relative; left:45px; "> Retake the rest </button>
            <!-- test space -->
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
<script src="${pageContext.request.contextPath}/resources/js/zebra_datepicker.js"></script>
<script>
    var user_type = "<%= session.getAttribute("user_type") %>";
    var user_id = "<%= session.getAttribute("id") %>";
    console.log(user_type);
    $("#admin_button").hide();
    if(user_type=="normal user")
    {
        console.log("test");
        $("#uploadbttn").hide();
    }
    else if(user_type=="content editor")
    {
        console.log("test1");
        $("#uploadbttn").show();
    }
    else if(user_type=="admin")
    {
    	$("#admin_button").show();
        console.log("test2");
        $("#uploadbttn").show();
    }

</script>
<script>
	$('html').click(function() {
		closeNav();
	});
	$('#sideNav').click(function(event){
		event.stopPropagation();
	});
	$('#mySidenav').click(function(event){
		event.stopPropagation();
	});
	$('.closebtn').click(function(event){
		closeNav();
	});
</script>

</body>

</html>