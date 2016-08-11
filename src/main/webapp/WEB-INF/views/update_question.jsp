<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="author" content="endava">

    <link rel="icon"
          href="${pageContext.request.contextPath}/resources/images/small logo.png">

    <link rel="stylesheet"
          href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/default.css">

    <title>Appollo</title>

    <script
            src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script>
        $(document).ready(function(){
            $(window).mouseenter(function(){
                $(".Zebra_DatePicker_Icon").css("left", "10px");
                $(".Zebra_DatePicker_Icon").css("top", "15px");
            });
            if( $( window ).width() <= $( window ).height() * 1.5 ){
                $("#background_1").css("height","100%");
                $("#background_1").css("width","auto");
            }
            else{
                $("#background_1").css("width","100%");
                $("#background_1").css("height","auto");
            }
        });
        $(window).resize(function(){
            $("#Adv_search").hide();
            if( $( window ).width() < $( window ).height() * 1.5 ){
                $("#background_1").css("height","100%");
                $("#background_1").css("width","auto");
            }
            else{
                $("#background_1").css("width","100%");
                $("#background_1").css("height","auto");
            }
        });
    </script>
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/style.css">
    <link rel="stylesheet"
          href="${pageContext.request.contextPath}/resources/css/upload.css">
    <style>
        <%@include file="css/style.css"%>
    </style>
</head>
<body style="width: 100vw; background-color: #374140;">



<div style="width: calc(96vw - 20px);">
    <div id="menu" style="width: 100vw;">
        <div id="logo_div">
            <a href="${pageContext.request.contextPath}"> <img id="img_logo"
                                                               src="${pageContext.request.contextPath}/resources/images/logo.png">
            </a>
            <div class="col-md-89 pull-right" style="">
                <ul class="nav nav-pills" id="nav_pills" style="">
                    <li class="" style="left:2px;"><a
                            href="${pageContext.request.contextPath}/upload">Update materials</a>
                    </li>
                    <li class="" style=""><a
                            href="${pageContext.request.contextPath}/add_question">Add Questions</a>
                    </li>
                </ul>
                <span
                        style="font-size: 30px; cursor: pointer; position: absolute; right: 20px; top: 20px;"
                        onclick="openNav()" id="sideNav"> <img id="img-avatar"
                                                               alt="Bootstrap Image Preview"
                                                               src="${pageContext.request.contextPath}/resources/images/765-default-avatar.png"
                                                               class="img-circle" height="50px">
					</span>
                <div class="col-md-1  pull-right" style="">
                    <div id="mySidenav" class="sidenav" style="z-index: 99999;">
                        <a href="javascript:void(0)" class="closebtn"
                           onclick="closeNav()">&times;</a> <br> <a href="admin">Admin</a>

                        <a href="change-password">Change Password</a> <a href="logout">Logout</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
    <!-- ----------------------------------------------------------------- -->
    <div class="container" id="empty_id"
         style="margin-left: 0px; padding: 0px;">
        <div id="" style="margin-left: 0px;">
            <br>
            <div id="container" style="margin-left: 0px;">

                <div id="addMaterial" style="">
                    <h3 id="h33">Edit question:</h3>
                    <form name="materialForm" style=""
                          action=" <c:url value='/update_question' />" method="POST"
                          enctype="multipart/form-data">
                        <table style="width: 250px">
                            <tr style="">
                                <td style=""><p class="td_text">Name of technology:</p></td>
                                <td><select class="topic-form" name="technology"
                                            id="edit_question_select_technology" style="" required>
                                    <option value="">Select language</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Name of topic:</p></td>
                                <td><select class="topic-form" name="topic" style=""
                                            id="edit_question_select_topic" required>
                                    <option value="">Select topic</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Question:</p></td>
                                <td><select class="topic-form" name="question" style=""
                                            id="edit_question_select" required>
                                    <option value="">Select question</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Question body:</p></td>
                                <td><input type='text' name='edited_question' value=''
                                           style="" required id="question_body"/></td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td><p class="td_text">Start date:</p> </td>
                                <td><input id="datepicker1" type='text' name='start_date' value='' style="height:26px;" required /></td>
                            </tr>
                        </table>
                        <table>
                            <tr>
                                <td><p class="td_text">Expiration date:</p> </td>
                                <td><input id="datepicker2" type='text' name='end_date' value=''  style="height:26px;" required /></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Answer 1:</p></td>
                                <td><input type='text' name='answer 1' value='' id = "answer1"
                                           style="" required /></td>
                            </tr>
                            <tr>
                                <td style="height:26px;"></td>
                                <td style="height:26px;">
                                    <input id="radio_correct1" type="radio" name="answer1" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;"><p style="width:50px; display:inline-block;">Correct  </p>
                                    <input id="radio_incorrect1" type="radio" name="answer1" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"><p style="width:50px; display:inline-block;">Incorrect</p>
                                </td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Answer 2:</p></td>
                                <td><input type='text' name='answer 2' value='' id = "answer2"
                                           style="" required /></td>
                            </tr>
                            <tr>
                                <td style="height:26px;"></td>
                                <td style="height:26px;">
                                    <input id="radio_correct2" type="radio" name="answer2" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Correct  </p>
                                    <input id="radio_incorrect2" type="radio" name="answer2" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
                                </td>
                            </tr><tr>
                            <td><p class="td_text">Answer 3:</p></td>
                            <td><input type='text' name='answer 3' value='' id = "answer3"
                                       style="" /></td>
                        </tr>
                            <tr>
                                <td style="height:26px;"></td>
                                <td style="height:26px;">
                                    <input id="radio_correct3" type="radio" name="answer3" class="radio" value = "correct" style="height:12px; width:12px;display:inline-block;"/><p style="width:50px; display:inline-block;">Correct  </p>
                                    <input id="radio_incorrect3" type="radio" name="answer3" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
                                </td>
                            </tr><tr>
                            <td><p class="td_text">Answer 4:</p></td>
                            <td><input type='text' name='answer 4' value='' id = "answer4"
                                       style="" /></td>
                        </tr>
                            <tr>
                                <td style="height:26px;"></td>
                                <td style="height:26px;">
                                    <input id="radio_correct4" type="radio" name="answer4" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Correct  </p>
                                    <input id="radio_incorrect4" type="radio" name="answer4" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
                                </td>
                            </tr><tr>
                            <td><p class="td_text">Answer 5:</p></td>
                            <td><input type='text' name='answer 5' value='' id = "answer5"
                                       style="" /></td>
                        </tr>
                            <tr>
                                <td style="height:26px;"></td>
                                <td style="height:26px;">
                                    <input id="radio_correct5" type="radio" name="answer5" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Correct  </p>
                                    <input id="radio_incorrect5" type="radio" name="answer5" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
                                </td>
                            </tr>

                        </table>
                        <table style="width: 250px">
                            <tr>
                                <td><input class="button_sign" name="submit" id="submitt3"
                                           type="submit" value="Edit question" />
                                    <input type="hidden" name="_method" value="PUT"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
            <!-- ---------------------------------------------------------------- -->
        </div>
    </div>
</div>

<script
        src="//ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
        src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
<script
        src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.3/jquery.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/jquery.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/bootstrap.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/jquery-1.9.1.min.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/scripts.js"></script>
<script
        src="${pageContext.request.contextPath}/resources/js/zebra_datepicker.js"></script>
<script>
    var user_type = '<%=session.getAttribute("user_type")%>';
    console.log(user_type);
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
</script>

</body>

</html>