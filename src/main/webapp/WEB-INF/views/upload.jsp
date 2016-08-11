<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html lang="en">
<head>
	
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="author" content="endava">
	
    <title>appollo</title>
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/small logo.png">
	
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/bootstrap.min.css">
	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/home.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/default.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css"> 
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/knowledge.css">
    
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
		    	var hh1 = $(window).height() - $("#background_image").height();
				$("#background_image").css("top",hh1);
			}
		    else{
		    	$("#background_image").css("width","100%");
		    	$("#background_image").css("height","auto");
		    	var hh1 = $(window).height() - $("#background_image").height();
				$("#background_image").css("top",hh1);
		    }
			
			var hh2 = $("#content-editor-page").width() - 170;
			$(".field-content-editor").css("width",hh2);
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
			var hh2 = $("#content-editor-page").width() - 170;
			$(".field-content-editor").css("width",hh2);
		});
	</script>
	
</head>
<body style="width:100vw;" onload="add_content();">
	<img id = "background_image" src = "${pageContext.request.contextPath}/resources/images/background.jpg">
	<div id = "menu">
        <div id = "logo_div">
            <a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
            <div class="col-md-89" style="">
                <ul class="nav nav-pills" id="nav_pills" >
                    <li class="technology_menu" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/">Learn</a>
                    </li>
                    <li class="" style="">
                        <a style="z-index:99988;"href="${pageContext.request.contextPath}/compiler">Try it yourself</a>
                    </li>

                    <li>
                        <a href="upload"  id="uploadbttn"> Update content</a>
                    </li>
                </ul>
                <span style="font-size:30px;cursor:pointer" onclick="openNav()"><img id = "img-avatar" alt="Bootstrap Image Preview" src="${pageContext.request.contextPath}/resources/images/avatar.jpg" class="img-circle img-avatar-cp" height="50px"></span>
                <div class="col-md-1  pull-right" style="">
                    <div id="mySidenav" class="sidenav" style="z-index:99999;">
                        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
                        <br>
                        <a href="admin">Admin</a>

                        <a href="change-password">Change Password</a>

                        <a href="logout">Logout</a>
                    </div>

                </div>
            </div>
        </div>
    </div>
	
	<div id = "content-editor-page">
	
		<div id = "menu-content-editor">
			<div class = "buttons-content-editor" id="addContent1"><p>Add content</p></div>
			<div class = "buttons-content-editor" id="deleteContent1"><p>Delete content</p></div>
			
			<div class = "buttons-content-editor" id="updateQuestion1"><p>Update question</p></div>
			<div class = "buttons-content-editor" id="addQuestion1"><p>Add question</p></div>
			<div class = "buttons-content-editor" id="deleteQuestion1"><p>Delete question</p></div>
		</div>
		
		<div id = "pages-content-editor">
		
			<!-- Add content -->
			<div id="addContent">
				<div id="container" style="margin-left: 0px;">
				<div id="addTechnology" style="border-bottom:1px solid #D13F32;paddin-top:0px;">
					<h3 id="h31">Add a new technology:</h3>
					<p style="color: red;">${error}</p>
					<p style="color: green;">${success}</p>

					<form id= "technologyForm" name='technologyForm' enctype='application/json' action=" <c:url value='/upload-technology' />" method='POST' enctype='application/json'>
					<table style="">
						<tr>
							<td><p class="td_text" style = "margin-right:10px;">Name of technology:</p></td>
							<td>
								<input type='text' name='technology' class = "field-content-editor"  required/>
							</td>
						</tr>
					</table>
					<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt1" type = "submit" value="Add technology" />
				</form>
			</div>
			<div id="addTopic" style="padding:10px;border-bottom:1px solid #D13F32;">
				<h3 id="h32">Add new topic:</h3>
				<form name="topicForm" action=" <c:url value='/upload-topic' />" method="POST">
				<table style="">
					<tr>
						<td><p class="td_text" style = "margin-right:10px;">Name of technology:</p></td>
						<td>
							<select class="topic-form field-content-editor" name = 'technology' id="select_tech" class = "field-content-editor"  required>
								<option value = "">Select language</option>
							</select>
						</td>
					</tr>
					<tr>
						<td><p class="td_text">Name of topic:</p></td>
						<td>
							<input type='text' name='topic' value='' class = "field-content-editor"   required/>
						</td>
					</tr>
				</table>
				<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt2" type="submit" value="Add topic" />
				
			</form>
		</div>

		<div id="addMaterial" style="padding:10px;paddin-bottom:0px;">
			<h3 id="h33">Add new material:</h3>
			<form name="materialForm" style="" action=" <c:url value='/upload-material' />" method="POST" enctype="multipart/form-data">
			<table style="">
				<tr style="">
					<td style=""><p class="td_text"  style = "margin-right:10px;">Name of technology: </p></td>
					<td>
						<select class="topic-form field-content-editor" name = "technology" id="select_technology" class = "field-content-editor"  required>
							<option value = "">Select language</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><p class="td_text">Name of topic:</p></td>
					<td>
						<select class="topic-form field-content-editor" name = "topic" class = "field-content-editor"  id="select_topic" required>
							<option value = "">Select topic</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><p class="td_text">Name of material:</p></td>
					<td>
						<input type='text' name='material' value='' class = "field-content-editor"  required/>
					</td>
				</tr>
				<tr>
					<td><p class="td_text">Description:</p></td>
					<td>
						<input type='text' name='description' value='' class = "field-content-editor"  required/>	
					</td>
				</tr>
			</table>
			<input style = "margin-top:10px;background-color:transparent;color:#D9CB9E;" id="file_choose"  type='file' name='file' size="50000" required/>
			<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt3" type="submit" value="Add material" />
			
		</form>
	</div>
</div></div>
<!-- Delete content -->
<div id="deleteContent">
<div id="container" style="margin-left:0px;">
				<div id="addTechnology" style="border-bottom:1px solid #D13F32;">
					<h3 id="h31">Delete technology</h3>
					<p style="color: red;">${error}</p>
					<p style="color: green;">${success}</p>

					<form id= "technologyForm" name='technologyForm' enctype='application/json' action=" <c:url value='/delete-technology' />" method='POST' enctype='application/json'>
					<table style="">
						<tr>
						<td><p class="td_text" style="margin-right:10px;">Name of technology:</p></td>
						<td>
							<select class="topic-form field-content-editor" name = 'technology' id="Language_Selector" class = "field-content-editor"  required>
								<option value = "">Select language</option>
							</select>
						</td>
					</tr>
					</table>
					<table style="width:250px">
						<tr>
							<td>
								<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt1" type = "submit" value="Delete technology" />
								<input type="hidden" name="_method" value="DELETE">
							</td>
						</tr>
					</table>
				</form>
			</div>
			<div id="addTopic" style="padding:10px;border-bottom:1px solid #D13F32;">
				<h3 id="h32">Delete topic:</h3>
				<form name="topicForm" action=" <c:url value='/delete-topic' />" method="POST">
				<table style="">
					<tr style="">
					<td style=""><p class="td_text"  style="margin-right:10px;">Name of technology:</p></td>
					<td>
						<select class="topic-form field-content-editor" name = "technology" id="select_tech" class = "field-content-editor"  required>
							<option value = "">Select language</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><p class="td_text">Name of topic:</p></td>
					<td>
						<select class="topic-form field-content-editor" name = "topic" class = "field-content-editor"  id="selecttopic" required>
							<option value = "">Select topic</option>
						</select>
					</td>
				</tr>
				</table>
				<table style="">
					<tr>
						<td>
							<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt2" type="submit" value="Delete topic" />
							<input type="hidden" name="_method" value="DELETE">
						</td>
					</tr>
				</table>
			</form>
		</div>

		<div id="addMaterial" style="">
			<h3 id="h33">Delete material:</h3>
			<form name="materialForm" style="" action=" <c:url value='/delete-material' />" method="POST" enctype="multipart/form-data">
			<table style="">
				<tr style="">
					<td style=""><p class="td_text" style="margin-right:10px;">Name of technology:</p></td>
					<td>
						<select class="topic-form field-content-editor" name = "technology" id="select_technology" class = "field-content-editor"  required>
							<option value = "">Select language</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><p class="td_text">Name of topic:</p></td>
					<td>
						<select class="topic-form field-content-editor" name = "topic" class = "field-content-editor"  id="select_topic" required>
							<option value = "">Select topic</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><p class="td_text">Name of material:</p></td>
					<td>
						<select class="topic-form field-content-editor" name = "material" class = "field-content-editor"  id="select_material" required>
							<option value = "">Select material</option>
						</select>
					</td>
				</tr>
			</table>
			<table style="">
				<tr>
					<td>
						<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt3" type="submit" value="Delete material" />
						<input type="hidden" name="_method" value="DELETE">
					</td>
				</tr>
			</table>
		</form>
	</div>
</div></div>
<!-- Add question -->
<div id="addQuestion">
			<div id="container" style="margin-left: 0px;">
					<div id="addMaterial" style="">
						<h3 id="h33">Add question:</h3>
						<form name="materialForm" style=""
							action=" <c:url value='/add_question' />" method="POST"
							enctype="multipart/form-data">
							<table style="">
								<tr style="">
									<td style=""><p class="td_text" style="margin-right:10px;">Name of technology:</p></td>
									<td><select class="topic-form field-content-editor" name="technology"
										id="add_question_select_technology" class = "field-content-editor"  required>
											<option value="">Select language</option>
									</select></td>
								</tr>
								<tr>
									<td><p class="td_text">Name of topic:</p></td>
									<td><select class="topic-form field-content-editor" name="topic" class = "field-content-editor" 
										id="add_question_select_topic" required>
											<option value="">Select topic</option>
									</select></td>
								</tr>
								<tr>
									<td ><p class="td_text">Question:</p></td>
									<td><input type='text' name='question' value='' class = "field-content-editor" 
										required /></td>
								</tr>
								<tr>
									<td><p class="td_text">Start date:</p> </td>
									<td><input id="datepicker1" type='text' name='start_date' value='' class = "field-content-editor"  required /></td>
								</tr>
								<tr>
									<td><p class="td_text">Expiration date:</p> </td>
									<td><input id="datepicker2" type='text' name='end_date' value=''  class = "field-content-editor"  required /></td>
								</tr>
								<tr>
									<td><p class="td_text">Answer 1:</p></td>
									<td><input type='text' name='answer 1' value=''
										class = "field-content-editor"  required /></td>
								</tr>
								<tr>
									<td style="height:26px;"></td>
									<td style="height:26px;"> 
										<input id="radio_correct1" type="radio" name="answer1" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;" checked><p style="width:50px; display:inline-block;">Correct  </p>
										<input id="radio_incorrect1" type="radio" name="answer1" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"><p style="width:50px; display:inline-block;">Incorrect</p>
									</td>
								</tr>
								<tr>
									<td><p class="td_text">Answer 2:</p></td>
									<td><input type='text' name='answer 2' value=''
										class = "field-content-editor"  required /></td>
								</tr>
								<tr>
									<td style="height:26px;"></td>
									<td style="height:26px;">
										<input id="radio_correct2" type="radio" name="answer2" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;"checked /><p style="width:50px; display:inline-block;">Correct  </p>
										<input id="radio_incorrect2" type="radio" name="answer2" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
									</td>
								</tr><tr>
									<td><p class="td_text">Answer 3:</p></td>
									<td><input type='text' name='answer 3' value=''
										class = "field-content-editor"  /></td>
								</tr>
								<tr>
									<td style="height:26px;"></td>
									<td style="height:26px;">
										<input id="radio_correct3" type="radio" name="answer3" class="radio" value = "correct" style="height:12px; width:12px;display:inline-block;" checked /><p style="width:50px; display:inline-block;">Correct  </p>
										<input id="radio_incorrect3" type="radio" name="answer3" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
									</td>
								</tr><tr>
									<td><p class="td_text">Answer 4:</p></td>
									<td><input type='text' name='answer 4' value=''
										class = "field-content-editor"  /></td>
								</tr>
								<tr>
									<td style="height:26px;"></td>
									<td style="height:26px;">
										<input id="radio_correct4" type="radio" name="answer4" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;" checked /><p style="width:50px; display:inline-block;">Correct  </p>
										<input id="radio_incorrect4" type="radio" name="answer4" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
									</td>
								</tr><tr>
									<td><p class="td_text">Answer 5:</p></td>
									<td><input type='text' name='answer 5' value=''
										class = "field-content-editor"  /></td>
								</tr>
								<tr>
									<td style="height:26px;"></td>
									<td style="height:26px;">
										<input id="radio_correct5" type="radio" name="answer5" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;" checked/><p style="width:50px; display:inline-block;">Correct  </p>
										<input id="radio_incorrect6" type="radio" name="answer5" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
									</td>
								</tr>
								
							</table>
							<input class="button_sign" name="submit" id="submitt3"
										type="submit" value="Add question" />
							<br>
							<p style="color:red; align:justify;">${error}</p>
		    				<p style="color:green; align:justify;">${success}</p>
							
						</form>
					</div>
				</div></div>			
<!-- Delete questions -->
<div id="deleteQuestion">
<div id="container" style="margin-left: 0px;">

					<div id="addMaterial" style="">
						<h3 id="h33">Delete question:</h3>
						<form name="materialForm" style=""
							action=" <c:url value='/delete_question' />" method="POST"
							enctype="multipart/form-data">
							<table style="">
								<tr style="">
									<td style=""><p class="td_text" style = "margin-right:10px;">Name of technology:</p></td>
									<td><select class="topic-form field-content-editor" name="technology"
										id="question_select_technology" class = "field-content-editor"  required>
											<option value="">Select language</option>
									</select></td>
								</tr>
								<tr>
									<td><p class="td_text">Name of topic:</p></td>
									<td><select class="topic-form field-content-editor" name="topic" class = "field-content-editor" 
										id="question_select_topic" required>
											<option value="">Select topic</option>
									</select></td>
								</tr>
								<tr>
									<td><p class="td_text">Question:</p></td>
									<td><select class="topic-form field-content-editor" name="question" class = "field-content-editor" 
										id="question_select" required>
											<option value="">Select question</option>
									</select></td>
								</tr>
							</table>
							<input style = "margin-top:10px;" class="button_sign" name="submit" id="submitt3"
										type="submit" value="Delete question" /> <input type="hidden"
										name="_method" value="DELETE">
						</form>
					</div>
				</div></div>
<!-- Update question -->
   <div id = "updateQuestion">
		<div id="container" style="margin-left: 0px;">

                <div id="addMaterial" style="">
                    <h3 id="h33">Edit question:</h3>
                    <form name="materialForm" style=""
                          action=" <c:url value='/update_question' />" method="POST"
                          enctype="multipart/form-data">
                        <table style="">
                            <tr style="">
                                <td style=""><p class="td_text" style = "margin-right:10px;">Name of technology:</p></td>
                                <td><select class="topic-form field-content-editor" name="technology"
                                            id="edit_question_select_technology" style="" required>
                                    <option value="">Select language</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Name of topic:</p></td>
                                <td><select class="topic-form field-content-editor" name="topic" style=""
                                            id="edit_question_select_topic" required>
                                    <option value="">Select topic</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Question:</p></td>
                                <td><select class="topic-form field-content-editor" name="question" style=""
                                            id="edit_question_select" required>
                                    <option value="">Select question</option>
                                </select></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Question body:</p></td>
                                <td><input class = "field-content-editor" type='text' name='edited_question' value=''
                                           style="" required id="question_body"/></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Start date:</p> </td>
                                <td><input class = "field-content-editor" id="datepicker1" type='text' name='start_date' value='' style="height:26px;" required /></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Expiration date:</p> </td>
                                <td><input class = "field-content-editor" id="datepicker2" type='text' name='end_date' value=''  style="height:26px;" required /></td>
                            </tr>
                            <tr>
                                <td><p class="td_text">Answer 1:</p></td>
                                <td><input class = "field-content-editor" type='text' name='answer 1' value='' id = "answer1"
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
                                <td><input class = "field-content-editor" type='text' name='answer 2' value='' id = "answer2"
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
                            <td><input class = "field-content-editor" type='text' name='answer 3' value='' id = "answer3"
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
                            <td><input class = "field-content-editor" type='text' name='answer 4' value='' id = "answer4"
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
                            <td><input class = "field-content-editor" type='text' name='answer 5' value='' id = "answer5"
                                       style="" /></td>
                        </tr>
                            <tr>
                                <td style="height:26px;"></td>
                                <td style="height:26px;">
                                    <input id="radio_correct5" type="radio" name="answer5" class="radio" value = "correct" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Correct  </p>
                                    <input id="radio_incorrect5" type="radio" name="answer5" class="radio" value = "incorrect" style="height:12px; width:12px; display:inline-block;"/><p style="width:50px; display:inline-block;">Incorrect</p>
                                </td>
                            </tr>

                            <tr>
                                <td><input class="button_sign" name="submit" id="submitt3"
                                           type="submit" value="Edit question" />
                                    <input type="hidden" name="_method" value="PUT"></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div></div>
            <!-- end -->
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
<script>
$(document).ready(function(){
	$("#addContent").show();
	$("#deleteContent").hide();
	$("#addQuestion").hide();
	$("#deleteQuestion").hide();
	$("#updateQuestion").hide();
	$("#addContent1").click(function(){
			$("#addContent").show();
			$("#deleteContent").hide();
			$("#addQuestion").hide();
			$("#deleteQuestion").hide();
			$("#updateQuestion").hide();
	});
	$("#deleteContent1").click(function(){
			$("#addContent").hide();
			$("#deleteContent").show();
			$("#addQuestion").hide();
			$("#deleteQuestion").hide();
			$("#updateQuestion").hide();
	});
	$("#addQuestion1").click(function(){
			$("#addContent").hide();
			$("#deleteContent").hide();
			$("#addQuestion").show();
			$("#deleteQuestion").hide();
			$("#updateQuestion").hide();
	});
	$("#deleteQuestion1").click(function(){
			$("#addContent").hide();
			$("#deleteContent").hide();
			$("#addQuestion").hide();
			$("#deleteQuestion").show();
			$("#updateQuestion").hide();
	});
	$("#updateQuestion1").click(function(){
			$("#addContent").hide();
			$("#deleteContent").hide();
			$("#addQuestion").hide();
			$("#deleteQuestion").hide();
			$("#updateQuestion").show();
	});
});
	</script>
</body>

</html>
