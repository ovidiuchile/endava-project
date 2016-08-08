/**
 * Initializes the dropdown menus for the languages
 */
$(document).ready(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);
	var AddTech =  document.getElementById("Language_Selector");
	var AddTechnologyToTopic = document.getElementById("select_tech");
	var AddTechnologyToMaterial = document.getElementById("select_technology");
	
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies"
	}).then(function (data) {
		for (i of data.content) {
			var technology = document.createElement("option");
			var technology1 = document.createElement("option");
			var technology2 = document.createElement("option");
			
			technology.value = i.content.technology_id;
			technology.innerHTML = i.content.name;
			
			technology1.value = i.content.technology_id;
			technology1.innerHTML = i.content.name;
			
			technology2.value = i.content.technology_id;
			technology2.innerHTML = i.content.name;
			
			if(AddTech)
            {
                AddTech.add(technology);
            }

			
			if(AddTechnologyToTopic){
				AddTechnologyToTopic.add(technology1);
			}
			if(AddTechnologyToMaterial){
				AddTechnologyToMaterial.add(technology2)
			}
		}
	});

	if($("#datepicker1").length > 0) {
		$("#datepicker1").Zebra_DatePicker();
		$("#datepicker2").Zebra_DatePicker();
	}


});
$(window).resize(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
});




// topics dropdown - upload page, material dropdown - delete page

$("#select_technology").change(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);


	
	var AddTopic = document.getElementById("select_topic");
	while (AddTopic.childElementCount != 0) {
		try {
			AddTopic.removeChild(AddTopic.childNodes[0]);
		}
		catch (e) {

		}
	}
	var child=0;
    var Select_Tech = document.getElementById("select_technology").value;
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies/" + Select_Tech + "/topics"
	}).then(function (data) {
		var k=0;
		for (i of data.content) {
			var topic = document.createElement("option");

			topic.value = i.content.topic_id;
			topic.innerHTML = i.content.name;
			if(k==0)
				{
				child=i.content.topic_id;
				k++; 
				console.log(child);
				}

			AddTopic.add(topic);

		}
	console.log(child);
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies/" + Select_Tech + "/topics/" + child + "/materials"
	}).then(function (data) {
		var AddMaterial = document.getElementById("select_material");
		try
		{
			while (AddMaterial.childElementCount != 0) {
				try {
					AddMaterial.removeChild(AddMaterial.childNodes[0]);
				}
				catch (e) {

				}
			}
		}
		catch(e)
		{

		}
		for (i of data.content) {
			var material = document.createElement("option");

			material.value = i.content.material_id;
			material.innerHTML = i.content.title;


			AddMaterial.add(material);

		}
	});
	});
	
});

//topic dropdown - delete page
$("#select_tech").change(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);


	
	var AddTopic = document.getElementById("selecttopic");
	while (AddTopic.childElementCount != 0) {
		try {
			AddTopic.removeChild(AddTopic.childNodes[0]);
		}
		catch (e) {

		}
	}
    var Select_Tech = document.getElementById("select_tech").value;
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies/" + Select_Tech + "/topics"
	}).then(function (data) {
		for (i of data.content) {
			var topic = document.createElement("option");

			topic.value = i.content.topic_id;
			topic.innerHTML = i.content.name;


			AddTopic.add(topic);

		}
	});
});

//material dropdown - delete page
$("#select_topic").change(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);


	
	var AddMaterial = document.getElementById("select_material");
	while (AddMaterial.childElementCount != 0) {
		try {
			AddMaterial.removeChild(AddMaterial.childNodes[0]);
		}
		catch (e) {

		}
	}
    var Select_Tech = document.getElementById("select_technology").value;
    var Select_Topic = document.getElementById("select_topic").value;
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies/" + Select_Tech + "/topics/" + Select_Topic + "/materials"
	}).then(function (data) {
		for (i of data.content) {
			var material = document.createElement("option");

			material.value = i.content.material_id;
			material.innerHTML = i.content.title;


			AddMaterial.add(material);

		}
	});
});

/**
 * Handles all the topics and materials regarding the language selected
 * @type {Element}
 */
var carusel = document.getElementById('Carusel');
$(".form-control").change(function() {
	$('#myCarousel').hide();
    $("#testspace").hide();
    $("#material_info").hide();
    $("#answer_button").hide();
	var option = document.getElementById('Language_Selector').value;
	var AddTopic = document.getElementById('Topics');
	var material = document.createElement("img");
	$("#material").hide();
	material.src="https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcR8g4PCYI2ssAVPKlJmC9q4T_k84PE7zOHqAWultSDb-BbSy5YfK-5P0I1f";
	material.className="item active";
	material.style.display = " none " ;
	while (carusel.childElementCount != 0) {
		try {
			carusel.removeChild(carusel.childNodes[0]);
		}
		catch (e) {

		}
	}
	carusel.appendChild(material);
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
		for (i of data.content) {
			var topic = document.createElement("button");
			var topic_id= i.content.topic_id;
			topic.className="btn btn-primary";
			topic.type="button";
			topic.name = i.content.name;
			topic.value = topic_id;
			topic.innerHTML = i.content.name;
			handleelement(topic_id,topic,option);
			AddTopic.appendChild(topic);
		}
	});
});

/**
 * Handles all of the materials inside the carousel created by the language selected and the topics and adds a click event on them that displays materials and or tests
 * @param i topic ID
 * @param topic Topic object - button
 * @param option language ID
 */
function handleelement(i,topic,option)
{
	$("#search-container").hide();
	topic.addEventListener("click", function (e) {
        $("#material_info").hide();
		$("#test_input").show();
        $("#testspace").hide();
		$("#search-container").hide();
		$("#myCarousel").show();
        $("#answer_button").hide();
		testFunction(i,option);
		var showMaterial = document.getElementById('material');
		showMaterial.style.display = " none";
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
            var divMats = document.createElement("div");
			console.log(data.content.length);
			for(k of data.content) {
                var title = k.content.title;
                var desc = k.content.description;
                console.log(title,desc);
				if (test == 0) {
					var carousel = document.getElementById('Carusel');
					var material = document.createElement("img");
					var div = document.createElement("div");
					var type = k.content.type;
					var source = k.content.link;
					div.className = "item active";
					material.name = "material"
					material.innerHTML = " test1";
					if(type==0)
					{
						material.src = k.content.link;
					}
					else
					{
						material.src="http://az186482.vo.msecnd.net/source/i/source/previewNotAvailableLarge.jpg";
					}
					handleMaterial(material,source,type,title,desc);
					div.appendChild(material);
					carousel.appendChild(div);
				}
				else {
					var carousel = document.getElementById('Carusel');
					var div2 = document.createElement("div");
					var material = document.createElement("img");
					var type = k.content.type;
					var source = k.content.link;
					material.name = "material"
					material.innerHTML = " test1";
					if(type==0)
					{
						material.src = k.content.link;
					}
					else
					{
						material.src="http://az186482.vo.msecnd.net/source/i/source/previewNotAvailableLarge.jpg";
					}
					div2.className = "item ";
					handleMaterial(material,source,type,title,desc);
					div2.appendChild(material);
					carousel.appendChild(div2);
				}
				test++;
			}
		});
	});
}

/**
 * Handles the materials inside the carousel and  adds a click on them in order to show the actual amterails / imgs / ppts / pdfs / vids
 * @param img Placeholder image for pdf / video / ppt
 * @param source source for the actual material be it online or local
 * @param type type as in img / pdf / video
 */
function handleMaterial( img, source, type,title,desc)
{
	console.log(type);
		img.addEventListener("click", function (e) {
			$("#myCarousel").hide();
			$("material").show();
            $("#material_info").show();
			var showMaterial = document.getElementById('material');
            var material_name= document.getElementById('Material_name');
            var material_desc= document.getElementById('Material_Desc');
            material_name.innerHTML = title;
            material_desc.innerHTML = desc;
            showMaterial.style.display = " initial";
			showMaterial.removeChild(showMaterial.childNodes[0]);
			if( type==0 )
			{
				var material = document.createElement("img");
				material.name = "material"
				material.src = source;
				material.oncontextmenu="return false;"
				showMaterial.appendChild(material);
			}
			else if ( type == 1)
			{
				var material = document.createElement("video");
				material.autoplay= true;
				material.controls = true;
				material.src=source;
				material.oncontextmenu="return false;"
				showMaterial.appendChild(material);
			}
			else if ( type == 2 )
			{
				var material = document.createElement("iframe");
				material.src=source + "#toolbar=0&navpanes=0&statusbar=0&view=Fit;readonly=true; disableprint=true;";
				material.oncontextmenu="return false;"
				showMaterial.appendChild(material);
			}
			var container = document.getElementById('search-container');
			container.style.display="none ";
		});

}









function openNav() {
	document.getElementById("mySidenav").style.width = "190px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}


/**
 * Hides all of the other divs and takes all of the search parameters sending it with an ajax request to the servlet
 * It returns the search page populated with all of the search results
 * Appends searchResult() function to all of the buttons created
 */
function search(){
	$("#myCarousel").hide();
	$("#search-container").show();
	$("#material").hide();
    $("#testspace").hide();
	var search = document.getElementById("search_input").value;
	var search_output = document.getElementById("search-container");
	var type = document.getElementById("Material_type").value;
	var date1 = document.getElementById("datepicker1").value;
	var date2 = document.getElementById("datepicker2").value;
	var contentEd = document.getElementById("content_creator").value;
	var url = "advancedSearchResults?s=" + search + "&type=" + type;
	if(date1.length!=0)
	{
		url = url + "&startDate=" + date1 + "&finishDate=" + date2;
	}
	if(contentEd.length!=0)
	{
		url = url + "&contentEditor=" + contentEd;
	}
	try
	{
		while(search_output.childElementCount!=0)
		{
			search_output.removeChild(search_output.childNodes[0]);
		}
	}
	catch (e)
	{

	}
	console.log(url);
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: url
	}).then(function (data) {
		console.log(data.content.length);
		if(data.content.length==0)
		{
			var noSearchResult = document.createElement("p");
			noSearchResult.innerHTML = " No search results were found";
			search_output.appendChild(noSearchResult);
		}
		for (i of data.content) {
			var div = document.createElement("div");
			
			div.className += "search-div-material";

			var lang = document.createElement("option");
			lang.value = i.content.topic.technology.technology_id;

			var topic = document.createElement("option");
			topic.value = i.content.topic.topic_id;

			var material = document.createElement("option");
			material.value = i.content.material_id;
			
			var resultsTitle = document.createElement("h4");
			resultsTitle.value = i.content.topic.technology.name + " > " + i.content.topic.name + " > " + i.content.title;


			var dataupload = i.content.upload_date;
			var advSearch = document.createElement("p");
			advSearch.innerHTML= dataupload + " : " + i.content.content_editor.name + "  "  +i.content.content_editor.surname;
			
			var text3=document.createTextNode(resultsTitle.value);
			resultsTitle.appendChild(text3);
			resultsTitle.appendChild(advSearch);

			var resultsDescription = document.createElement("p");
			resultsDescription.value = i.content.description;
			
			var text4=document.createTextNode(resultsDescription.value);
			resultsDescription.appendChild(text4);

			var text=document.createTextNode(lang.value);
			lang.appendChild(text);

			var text1=document.createTextNode(topic.value);
			topic.appendChild(text1);

			var text2=document.createTextNode(material.value);
			material.appendChild(text2);

			var buton =  document.createElement("button");
			searchResult(buton, lang.value, topic.value, material.value);
			buton.innerHTML= "Go to material";
			buton.className = "result-search-button";
			
			var str = resultsTitle.innerHTML; 
			var res = str.split(search).join("<span style = 'color:#D9CB9E;color:#1E1E20;background-color:#D9CB9E'>" + search + "</span>");
		    
		    resultsTitle.innerHTML = res;
		    
		    var str = resultsDescription.innerHTML;
		    var res = str.split(search).join("<span style = 'color:#D9CB9E;color:#1E1E20;background-color:#D9CB9E'>" + search + "</span>");
		    resultsDescription.innerHTML = res;

			
			div.appendChild(resultsTitle);
			div.appendChild(resultsDescription);

			div.appendChild(buton);
			search_output.appendChild(div);


		}
	});

}


/**
 * Function that adds a event handler to each of the buttons that takes the user through an ajax request to the actual materials on the site displaying both the
 * languages and the topics for it.
 * @param buton The element to which the handler will be attached
 * @param langId The language ID in order for the topics and materials to be displayed / obtained
 * @param topicId The topic ID
 * @param materialId Material ID
 */
function searchResult(buton, langId, topicId, materialId)
{
	console.log(langId, topicId, materialId);
	buton.addEventListener("click", function(e)
	{
	var materialCont = document.getElementById("material");
	var searchCont = document.getElementById("search-container");
	try
	{
		while(searchCont.childElementCount!=0)
		{
			searchCont.removeChild(searchCont.childNodes[0]);
		}
	}
	catch (e)
	{

	}
	$("#myCarousel").hide();
	$("material").show();

	var AddTopic = document.getElementById('Topics');
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
		url: "technologies/" + langId + "/topics"
	}).then(function (data) {
		for (i of data.content) {
			var topic = document.createElement("button");
			var topic_id= i.content.topic_id;
			topic.className="btn btn-primary";
			topic.type="button";
			topic.name = i.content.name;
			topic.value = topic_id;
			topic.innerHTML = i.content.name;
			handleelement(topic_id,topic,langId);
			AddTopic.appendChild(topic);
		}
	});
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies/" + langId + "/topics/" + topicId + "/materials/" + materialId
		}).then(function (data) {

		var showMaterial = document.getElementById('material');
		showMaterial.style.display = " initial";
		showMaterial.removeChild(showMaterial.childNodes[0]);
        var material_name= document.getElementById('Material_name');
        var material_desc= document.getElementById('Material_Desc');
        material_name.innerHTML = data.content.title;
        material_desc.innerHTML = data.content.description;
        showMaterial.style.display = " initial";
		var type = data.content.type;
		var source = data.content.link;
			if( type==0 )
			{
				var material = document.createElement("img");
				material.name = "material"
				material.innerHTML = " test";
				material.src = source;
				material.oncontextmenu="return false;"
				showMaterial.appendChild(material);
			}
			else if ( type == 1)
			{
				var material = document.createElement("video");
				material.autoplay= true;
				material.controls = true;
				material.width="600";
				material.height="360";
				material.src=source;
				material.oncontextmenu="return false;"
				showMaterial.appendChild(material);
			}
			else if ( type == 2 )
			{
				var material = document.createElement("iframe");
				material.width="1000px";
				material.height="600px";
				source = source + "#toolbar=0&navpanes=0&statusbar=0&view=Fit;readonly=true; disableprint=true;";
				material.src=source;
				material.oncontextmenu="return false;"
				showMaterial.appendChild(material);
			}

		$("myCarousel").show();
		var container = document.getElementById('search-container');
		container.style.display="none";
		});

	});

}


function show()
{
	$("#Adv_search").toggle();
	//$("#bttn_search").hide();
}


/**
 * Function that takes the input from the search bar + type of the user and returns a list with all of the users that match said
 * search criteria
 */
function searchUser()
{
	var usrdiv = document.getElementById("usr_SearchRestults");
	var type = document.getElementById("User_Type").value;
	var usrName = document.getElementById("usrSearch_input").value;
	var url = "/searchUsers?name=" + usrName;
	if(type!=-1)
	{
		url= url+  "&type=" + type ;
	}
	while (usrdiv.childElementCount != 0) {
		try {
			usrdiv.removeChild(usrdiv.childNodes[0]);
		}
		catch (e) {

		}
	}
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: url
	}).then(function (data) {
		
		for (i of data.content) {
			var tr = document.createElement("tr");
			var usrInfo = document.createElement("th");
			usrInfo.innerHTML = i.content.name;
			tr.appendChild(usrInfo);
			var usrInfo = document.createElement("th");
			usrInfo.innerHTML = i.content.surname;
			tr.appendChild(usrInfo);
			var usrInfo = document.createElement("th");
			usrInfo.innerHTML = i.content.email;
			tr.appendChild(usrInfo);
			var usrInfo = document.createElement("th");
			usrInfo.innerHTML = i.content.user_type;
			tr.appendChild(usrInfo);
			usrdiv.appendChild(tr);
		}
	});

}

/**
 * Function that received the Language ID and the Topic Id in order to create tests apropiate for those critatera
 * @param topic_id The topic ID
 * @param option The language ID
 * handleButon function - Appends a event handler for when the user finishes completing the test
 */
function testFunction(topic_id,option)
{
	$("#test_input").unbind("click");
	var testSpace = document.getElementById("testspace");
	$("#test_input").bind("click" , function (e) {
        $("#answer_button").show();
        $("#myCarousel").hide();
        while (testSpace.childElementCount != 0) {
			try {
				testSpace.removeChild(testSpace.childNodes[0]);
			}
			catch (e) {

			}
		}
		$("#testspace").show();
		var url = "technologies/" + option + "/topics/" + topic_id + "/test" ;
		console.log(url);
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: url
		}).then(function (data) {
            var nrofQuestion =0;
			for(i of data.content)
            {
                var nextId=i.content.question.id;
                console.log(nextId,prevId);
                if(nextId!=prevId)
                {
                    nrofQuestion = nrofQuestion + 1;
                    var Question_numbr = document.createElement("p");
                    console.log("Test");
                    var div = document.createElement("div");
                    Question_numbr.innerHTML = "Question " + nrofQuestion;
                    div.appendChild(Question_numbr);
                    var paragraph = document.createElement("p");
                    var questionText = i.content.question.question_text;
                    paragraph.innerHTML = questionText;
                    div.appendChild(paragraph);
                    var questionAnswer = document.createElement("input");
                    questionAnswer.setAttribute('type','checkbox');
                    questionAnswer.name="answer";
                    div1 = document.createElement("div");
                    div1.className="answer_div";
                    div1.id= i.content.id;
                    div1.appendChild(questionAnswer);
                    div1.appendChild(document.createTextNode(i.content.answer_text));
                    questionAnswer.value=i.content.id;
                    div.className="question";
                    div.appendChild(div1);
                    testSpace.appendChild(div);
                }
                else
                {
                    var questionAnswer = document.createElement("input");
                    questionAnswer.setAttribute('type','checkbox');
                    questionAnswer.name="answer";
                    div1 = document.createElement("div");
                    div1.className="answer_div";
                    div1.id= i.content.id;
                    div1.appendChild(questionAnswer);
                    div1.appendChild(document.createTextNode(i.content.answer_text));
                    questionAnswer.value=i.content.id;
                    div.className="question";
                    div.appendChild(div1);
                    testSpace.appendChild(div);
                }
                var prevId =i.content.question.id;
            }

		});
	});

    handleButon(option, topic_id);

}


/**
 * Function that sends the servlet the topic id, language option and the answers from the input and return through an ajax request the score + highlights
 * right and wrong answers
 * @param option Language ID
 * @param topic_id Topic ID
 */

function handleButon(option, topic_id)
{
	var testSpace = document.getElementById("testspace");
    $("#answer_button").unbind("click");
    $("#answer_button").bind("click" , function (e) {
        var test="";
        $('input[name="answer"]:checked').each(function() {
            test = test + this.value + " ";
        });
        var url = "technologies/" + option + "/topics/" + topic_id + "/selectedAnswers?selectedAnswers=" +test;
        console.log(url);
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: url
        }).then(function (data) {
			var k=0;
            var test = 0;
			var result = document.createElement("p");
            var elements = document.getElementsByClassName("answer_div");
            for(i=0 ; i<elements.length ; i++)
            {
                elements[i].style.color="#F9675A";
            }
			for(i of data.content)
			{
                console.log(i.length);
                test= test+1;
				if(k==0)
				{
					result.innerHTML = "You've achieved " + i.content + " points!";
					testSpace.appendChild(result);
					k++;
				}
				else
				{
                    try {
                        var answer = document.getElementById(i.content);
                        console.log(i.content);
                        answer.style.color = "#93FF58";
                    }
                    catch (e)
                        {

                        }
				}
			}
            console.log(test);
        });
    });

}