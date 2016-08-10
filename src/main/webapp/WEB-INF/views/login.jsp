<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String email = request.getParameter("email");
	session.setAttribute("email", email);
%>
<html>
<head>
	<meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Appollo</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="icon" href="${pageContext.request.contextPath}/resources/images/apple-touch-icon-114x114.png">
    <style>
		<%@include file="css/style.css"%>
		
    </style>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
	<script>
		$(document).ready(function(){
			$("#sign_up").hide();
			
		    $("#button_sign_up").click(function(){
		        $("#sign_in").hide();
		        $("#sign_up").show();
		    });
		    
		    $("#button_sign_in").click(function(){
		        $("#sign_up").hide();
		        $("#sign_in").show();
		    });  
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

<script>
	function validateForm() {
		var numbers = /^[0-9]+$/;
		var x = document.forms["registerForm"]["name"].value;
		if (x == null || x == "") {
			alert("Name cannot be empty!");
			return false;
		} else {
			var ok = true;
			for (i = 0; i < x.length; i++)
				if (x[i] >= '0' && x[i] <= '9')
					ok = false;
			if (ok == false) {
				alert("Name cannot have digits!");
				return false;
			} else {
				x = document.forms["registerForm"]["email"].value;
				if (x == null || x == "") {
					alert("E-mail cannot be empty!");
					return false;
				} else {
					x = document.forms["registerForm"]["phone"];
					if (!x.value.match(numbers)) {
						alert("Phone number can only be made of digits!")
						return false;
					}
				}
			}
		}
		return true;
	}
</script>

<!-- <script>
	$( window ).on( "mousemove", function( event ) {
		$( "#binary1_div" ).css("margin-left", ( event.clientX + event.clientY  ) / 140 * -1  );
		$( "#binary2_div" ).css("margin-left", ( event.clientX + event.clientY  ) / 80 * -1 + 10 );
		$( "#binary3_div" ).css("margin-left", ( event.clientX + event.clientY  ) / 50 * -1 + 20 );
		
	});
	</script> 
	
	<style>
		.binary1 {
		    -webkit-animation: mymove1 120s;  /* Chrome, Safari, Opera */
		    -webkit-animation-iteration-count: infinite;  /* Chrome, Safari, Opera */
		    -webkit-animation-timing-function: linear;
		    animation: mymove1 120s;
		    animation-iteration-count: infinite;
		    animation-timing-function: linear;
		}
		
		/* Chrome, Safari, Opera */
		@-webkit-keyframes mymove1 {
		    from {top: 0px;}
		    to {top: -5000px;}
		}
		
		@keyframes mymove1 {
		    from {top: 0px;}
		    to {top: -5000px;}
		}
		
		.binary2 {
		    -webkit-animation: mymove2 120s;  /* Chrome, Safari, Opera */
		    -webkit-animation-iteration-count: infinite;  /* Chrome, Safari, Opera */
		    -webkit-animation-timing-function: linear;
		    animation: mymove2 120s;
		    animation-iteration-count: infinite;
		    animation-timing-function: linear;
		}
		
		/* Chrome, Safari, Opera */
		@-webkit-keyframes mymove2 {
		    from {top: 0px;}
		    to {top: -7000px;}
		}
		
		@keyframes mymove2 {
		    from {top: 0px;}
		    to {top: -7000px;}
		}
		
		.binary3 {
		    -webkit-animation: mymove3 120s;  /* Chrome, Safari, Opera */
		    -webkit-animation-iteration-count: infinite;  /* Chrome, Safari, Opera */
		    -webkit-animation-timing-function: linear;
		    animation: mymove3 120s;
		    animation-iteration-count: infinite;
		    animation-timing-function: linear;
		}
		
		/* Chrome, Safari, Opera */
		@-webkit-keyframes mymove3 {
		    from {top: 0px;}
		    to {top: -9000px;}
		}
		
		@keyframes mymove3 {
		    from {top: 0px;}
		    to {top: -9000px;}
		}
	</style>
	-->
	<style>
		input{
			width:173px;
		}
		#submitt{
			width:initial;
		}
	</style>
</head>
<body onload='document.loginForm.username.focus();'>

	<!-- 
<div id = "binary1_div">
<img class = "binary binary1" id = "binary-2" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary-1" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary1" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary2" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary3" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary4" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary5" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary6" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary7" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary8" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary9" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary10" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary11" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary12" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary1" id = "binary13" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
</div>
<div id = "binary2_div">
<img class = "binary binary2" id = "binary21" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary22" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary23" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary24" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary2" id = "binary25" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
</div>
<div id = "binary3_div">
<img class = "binary binary3" id = "binary31" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary3" id = "binary32" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary3" id = "binary33" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
<img class = "binary binary3" id = "binary34" src = "${pageContext.request.contextPath}/resources/images/binary2.png">
</div>
-->

<img id = "background_image" src = "${pageContext.request.contextPath}/resources/images/background.jpg">
<div id = "menu">
	<div id = "logo_div">
		<a href="${pageContext.request.contextPath}"><img id = "img_logo" src = "${pageContext.request.contextPath}/resources/images/logo.png"></a>
		</div>
	</div>

	<div id="content_login">

		<!-- START LOGIN BOX -->
		<div id="login-box">

			<div id="button_div">
				<button class="button_sign" id="button_sign_in" type="button">Sign
					In</button>
				<button class="button_sign" id="button_sign_up" type="button">Sign
					Up</button>
			</div>
			
			<div id="sign_in">

				<p style="color: red;">${error}</p>
				<p style="color: green;">${success}</p>

				<form name='loginForm'
					action="${pageContext.request.contextPath}/securitycheck"
					method='POST'>

					<table>
						<tr>
							<td>E-mail:</td>
							<td><input type='email' name='email_in' value='' required /></td>
						</tr>
						<tr>
							<td>Password:</td>
							<td><input type='password' name='password_in' required /></td>
						</tr>

						<tr>
							<td><a
								href="${pageContext.request.contextPath}/forgot-password"
								style="text-decoration: none; margin-right: -300px; margin-left: 0px; margin-top: 10px; color: #D13F32; position: absolute;">Recover
									password</a></td>
						</tr>

						<tr>
							<td colspan='2'><input class="button_sign" name="submit"
								id="submitt" type="submit" value="Submit"
								style="margin-top: 35px;" /></td>
						</tr>
					</table>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

				</form>

			</div>

			<div id="sign_up">
				<p style="color: red;">${error2}</p>
				<p style="color: green;">${success}</p>

				<form name='registerForm' action="<c:url value='/register' />"
					method='POST'>

					<table>
						<tr>
							<td>*Name:</td>
							<td><input type='text' name='name' value='' id="name" minlength = 2 maxlength = 100
								required /></td>
							<td id="nameValidation"></td>
						</tr>
						<tr>
							<td>*Surname:</td>
							<td><input type='text' name='surname' minlength = 2 maxlength = 100 required /></td>
						</tr>
						<tr>
							<td>*E-mail:</td>
							<td><input type='email' name='email' value='' minlength=6 maxlength = 100 required /></td>
						</tr>
						<tr>
							<td>Phone:</td>
							<td><input type='tel' name='phone' value='' minlength = 10 minlength = 15></td>
						</tr>
						<tr>
							<td>Country:</td>
							<td><select name="country" style = "width:173px; border-style: inset; border:2px solid rgb(154,154,154); border-bottom:2px solid rgb(238,238,238) ; border-right:2px solid rgb(238,238,238)">
									<option value=""></option>
									<option value="Afganistan">Afghanistan</option>
									<option value="Albania">Albania</option>
									<option value="Algeria">Algeria</option>
									<option value="American Samoa">American Samoa</option>
									<option value="Andorra">Andorra</option>
									<option value="Angola">Angola</option>
									<option value="Anguilla">Anguilla</option>
									<option value="Antigua &amp; Barbuda">Antigua &amp;
										Barbuda</option>
									<option value="Argentina">Argentina</option>
									<option value="Armenia">Armenia</option>
									<option value="Aruba">Aruba</option>
									<option value="Australia">Australia</option>
									<option value="Austria">Austria</option>
									<option value="Azerbaijan">Azerbaijan</option>
									<option value="Bahamas">Bahamas</option>
									<option value="Bahrain">Bahrain</option>
									<option value="Bangladesh">Bangladesh</option>
									<option value="Barbados">Barbados</option>
									<option value="Belarus">Belarus</option>
									<option value="Belgium">Belgium</option>
									<option value="Belize">Belize</option>
									<option value="Benin">Benin</option>
									<option value="Bermuda">Bermuda</option>
									<option value="Bhutan">Bhutan</option>
									<option value="Bolivia">Bolivia</option>
									<option value="Bonaire">Bonaire</option>
									<option value="Bosnia &amp; Herzegovina">Bosnia &amp;
										Herzegovina</option>
									<option value="Botswana">Botswana</option>
									<option value="Brazil">Brazil</option>
									<option value="British Indian Ocean Ter">British
										Indian Ocean Ter</option>
									<option value="Brunei">Brunei</option>
									<option value="Bulgaria">Bulgaria</option>
									<option value="Burkina Faso">Burkina Faso</option>
									<option value="Burundi">Burundi</option>
									<option value="Cambodia">Cambodia</option>
									<option value="Cameroon">Cameroon</option>
									<option value="Canada">Canada</option>
									<option value="Canary Islands">Canary Islands</option>
									<option value="Cape Verde">Cape Verde</option>
									<option value="Cayman Islands">Cayman Islands</option>
									<option value="Central African Republic">Central
										African Republic</option>
									<option value="Chad">Chad</option>
									<option value="Channel Islands">Channel Islands</option>
									<option value="Chile">Chile</option>
									<option value="China">China</option>
									<option value="Christmas Island">Christmas Island</option>
									<option value="Cocos Island">Cocos Island</option>
									<option value="Colombia">Colombia</option>
									<option value="Comoros">Comoros</option>
									<option value="Congo">Congo</option>
									<option value="Cook Islands">Cook Islands</option>
									<option value="Costa Rica">Costa Rica</option>
									<option value="Cote DIvoire">Cote D'Ivoire</option>
									<option value="Croatia">Croatia</option>
									<option value="Cuba">Cuba</option>
									<option value="Curaco">Curacao</option>
									<option value="Cyprus">Cyprus</option>
									<option value="Czech Republic">Czech Republic</option>
									<option value="Denmark">Denmark</option>
									<option value="Djibouti">Djibouti</option>
									<option value="Dominica">Dominica</option>
									<option value="Dominican Republic">Dominican Republic</option>
									<option value="East Timor">East Timor</option>
									<option value="Ecuador">Ecuador</option>
									<option value="Egypt">Egypt</option>
									<option value="El Salvador">El Salvador</option>
									<option value="Equatorial Guinea">Equatorial Guinea</option>
									<option value="Eritrea">Eritrea</option>
									<option value="Estonia">Estonia</option>
									<option value="Ethiopia">Ethiopia</option>
									<option value="Falkland Islands">Falkland Islands</option>
									<option value="Faroe Islands">Faroe Islands</option>
									<option value="Fiji">Fiji</option>
									<option value="Finland">Finland</option>
									<option value="France">France</option>
									<option value="French Guiana">French Guiana</option>
									<option value="French Polynesia">French Polynesia</option>
									<option value="French Southern Ter">French Southern
										Ter</option>
									<option value="Gabon">Gabon</option>
									<option value="Gambia">Gambia</option>
									<option value="Georgia">Georgia</option>
									<option value="Germany">Germany</option>
									<option value="Ghana">Ghana</option>
									<option value="Gibraltar">Gibraltar</option>
									<option value="Great Britain">Great Britain</option>
									<option value="Greece">Greece</option>
									<option value="Greenland">Greenland</option>
									<option value="Grenada">Grenada</option>
									<option value="Guadeloupe">Guadeloupe</option>
									<option value="Guam">Guam</option>
									<option value="Guatemala">Guatemala</option>
									<option value="Guinea">Guinea</option>
									<option value="Guyana">Guyana</option>
									<option value="Haiti">Haiti</option>
									<option value="Hawaii">Hawaii</option>
									<option value="Honduras">Honduras</option>
									<option value="Hong Kong">Hong Kong</option>
									<option value="Hungary">Hungary</option>
									<option value="Iceland">Iceland</option>
									<option value="India">India</option>
									<option value="Indonesia">Indonesia</option>
									<option value="Iran">Iran</option>
									<option value="Iraq">Iraq</option>
									<option value="Ireland">Ireland</option>
									<option value="Isle of Man">Isle of Man</option>
									<option value="Israel">Israel</option>
									<option value="Italy">Italy</option>
									<option value="Jamaica">Jamaica</option>
									<option value="Japan">Japan</option>
									<option value="Jordan">Jordan</option>
									<option value="Kazakhstan">Kazakhstan</option>
									<option value="Kenya">Kenya</option>
									<option value="Kiribati">Kiribati</option>
									<option value="Korea North">Korea North</option>
									<option value="Korea Sout">Korea South</option>
									<option value="Kuwait">Kuwait</option>
									<option value="Kyrgyzstan">Kyrgyzstan</option>
									<option value="Laos">Laos</option>
									<option value="Latvia">Latvia</option>
									<option value="Lebanon">Lebanon</option>
									<option value="Lesotho">Lesotho</option>
									<option value="Liberia">Liberia</option>
									<option value="Libya">Libya</option>
									<option value="Liechtenstein">Liechtenstein</option>
									<option value="Lithuania">Lithuania</option>
									<option value="Luxembourg">Luxembourg</option>
									<option value="Macau">Macau</option>
									<option value="Macedonia">Macedonia</option>
									<option value="Madagascar">Madagascar</option>
									<option value="Malaysia">Malaysia</option>
									<option value="Malawi">Malawi</option>
									<option value="Maldives">Maldives</option>
									<option value="Mali">Mali</option>
									<option value="Malta">Malta</option>
									<option value="Marshall Islands">Marshall Islands</option>
									<option value="Martinique">Martinique</option>
									<option value="Mauritania">Mauritania</option>
									<option value="Mauritius">Mauritius</option>
									<option value="Mayotte">Mayotte</option>
									<option value="Mexico">Mexico</option>
									<option value="Midway Islands">Midway Islands</option>
									<option value="Moldova">Moldova</option>
									<option value="Monaco">Monaco</option>
									<option value="Mongolia">Mongolia</option>
									<option value="Montserrat">Montserrat</option>
									<option value="Morocco">Morocco</option>
									<option value="Mozambique">Mozambique</option>
									<option value="Myanmar">Myanmar</option>
									<option value="Nambia">Nambia</option>
									<option value="Nauru">Nauru</option>
									<option value="Nepal">Nepal</option>
									<option value="Netherland Antilles">Netherland
										Antilles</option>
									<option value="Netherlands">Netherlands (Holland,
										Europe)</option>
									<option value="Nevis">Nevis</option>
									<option value="New Caledonia">New Caledonia</option>
									<option value="New Zealand">New Zealand</option>
									<option value="Nicaragua">Nicaragua</option>
									<option value="Niger">Niger</option>
									<option value="Nigeria">Nigeria</option>
									<option value="Niue">Niue</option>
									<option value="Norfolk Island">Norfolk Island</option>
									<option value="Norway">Norway</option>
									<option value="Oman">Oman</option>
									<option value="Pakistan">Pakistan</option>
									<option value="Palau Island">Palau Island</option>
									<option value="Palestine">Palestine</option>
									<option value="Panama">Panama</option>
									<option value="Papua New Guinea">Papua New Guinea</option>
									<option value="Paraguay">Paraguay</option>
									<option value="Peru">Peru</option>
									<option value="Phillipines">Philippines</option>
									<option value="Pitcairn Island">Pitcairn Island</option>
									<option value="Poland">Poland</option>
									<option value="Portugal">Portugal</option>
									<option value="Puerto Rico">Puerto Rico</option>
									<option value="Qatar">Qatar</option>
									<option value="Republic of Montenegro">Republic of
										Montenegro</option>
									<option value="Republic of Serbia">Republic of Serbia</option>
									<option value="Reunion">Reunion</option>
									<option value="Romania">Romania</option>
									<option value="Russia">Russia</option>
									<option value="Rwanda">Rwanda</option>
									<option value="St Barthelemy">St Barthelemy</option>
									<option value="St Eustatius">St Eustatius</option>
									<option value="St Helena">St Helena</option>
									<option value="St Kitts-Nevis">St Kitts-Nevis</option>
									<option value="St Lucia">St Lucia</option>
									<option value="St Maarten">St Maarten</option>
									<option value="St Pierre &amp; Miquelon">St Pierre
										&amp; Miquelon</option>
									<option value="St Vincent &amp; Grenadines">St Vincent
										&amp; Grenadines</option>
									<option value="Saipan">Saipan</option>
									<option value="Samoa">Samoa</option>
									<option value="Samoa American">Samoa American</option>
									<option value="San Marino">San Marino</option>
									<option value="Sao Tome &amp; Principe">Sao Tome &amp;
										Principe</option>
									<option value="Saudi Arabia">Saudi Arabia</option>
									<option value="Senegal">Senegal</option>
									<option value="Serbia">Serbia</option>
									<option value="Seychelles">Seychelles</option>
									<option value="Sierra Leone">Sierra Leone</option>
									<option value="Singapore">Singapore</option>
									<option value="Slovakia">Slovakia</option>
									<option value="Slovenia">Slovenia</option>
									<option value="Solomon Islands">Solomon Islands</option>
									<option value="Somalia">Somalia</option>
									<option value="South Africa">South Africa</option>
									<option value="Spain">Spain</option>
									<option value="Sri Lanka">Sri Lanka</option>
									<option value="Sudan">Sudan</option>
									<option value="Suriname">Suriname</option>
									<option value="Swaziland">Swaziland</option>
									<option value="Sweden">Sweden</option>
									<option value="Switzerland">Switzerland</option>
									<option value="Syria">Syria</option>
									<option value="Tahiti">Tahiti</option>
									<option value="Taiwan">Taiwan</option>
									<option value="Tajikistan">Tajikistan</option>
									<option value="Tanzania">Tanzania</option>
									<option value="Thailand">Thailand</option>
									<option value="Togo">Togo</option>
									<option value="Tokelau">Tokelau</option>
									<option value="Tonga">Tonga</option>
									<option value="Trinidad &amp; Tobago">Trinidad &amp;
										Tobago</option>
									<option value="Tunisia">Tunisia</option>
									<option value="Turkey">Turkey</option>
									<option value="Turkmenistan">Turkmenistan</option>
									<option value="Turks &amp; Caicos Is">Turks &amp;
										Caicos Is</option>
									<option value="Tuvalu">Tuvalu</option>
									<option value="Uganda">Uganda</option>
									<option value="Ukraine">Ukraine</option>
									<option value="United Arab Erimates">United Arab
										Emirates</option>
									<option value="United Kingdom">United Kingdom</option>
									<option value="United States of America">United States
										of America</option>
									<option value="Uraguay">Uruguay</option>
									<option value="Uzbekistan">Uzbekistan</option>
									<option value="Vanuatu">Vanuatu</option>
									<option value="Vatican City State">Vatican City State</option>
									<option value="Venezuela">Venezuela</option>
									<option value="Vietnam">Vietnam</option>
									<option value="Virgin Islands (Brit)">Virgin Islands
										(Brit)</option>
									<option value="Virgin Islands (USA)">Virgin Islands
										(USA)</option>
									<option value="Wake Island">Wake Island</option>
									<option value="Wallis &amp; Futana Is">Wallis &amp;
										Futana Is</option>
									<option value="Yemen">Yemen</option>
									<option value="Zaire">Zaire</option>
									<option value="Zambia">Zambia</option>
									<option value="Zimbabwe">Zimbabwe</option>
							</select></td>
						</tr>
						<tr>
							<td>City:</td>
							<td><input type='text' name='city' value='' minlength = 3 maxlength = 50></td>
						</tr>
						<tr>
							<td>Address:</td>
							<td><input type='text' name='address' minlength = 5 maxlength = 500/></td>
						<tr>
							<td colspan='2'><input class="button_sign" name="submit"
								id="submitt" type="submit" value="Submit" /></td>
						</tr>
					</table>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />

				</form>
				<p>* are mandatory</p>
				<p>The password is sent via email</p>
			</div>

		</div>
		<!-- END LOGIN BOX -->

	</div>
	<script>
		var check_name = document.getElementById('name');
		if (check_name.length == 0)
			alert("Please insert a name");
	</script>
</body>
</html>