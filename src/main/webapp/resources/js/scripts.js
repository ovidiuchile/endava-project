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
	var AddTechnology = document.getElementById("select_technology_add");
	var AddTechnologyToTopic = document.getElementById("select_technology_delete");
	var AddTechnologyToMaterial = document.getElementById("select_technology");
	var AddTechnologyToDeleteMaterial = document.getElementById("select_technology_delete_material");
	var AddTechnologyToDeleteQuestion = document.getElementById("delete_question_select_technology");
	var AddTechnologyToAddQuestion = document.getElementById("add_question_select_technology");

	$.ajax({ 
		type: 'GET',
		dataType: 'json',
		url: "technologies"
	}).then(function (data) {
		for (i of data.content) {
			var technology = document.createElement("option");
			var technology1 = document.createElement("option");
			var technology2 = document.createElement("option");
			var technology3 = document.createElement("option");
			var technology4 = document.createElement("option");
			var technology5 = document.createElement("option");
			var technology6 = document.createElement("option");
			
			technology.value = i.content.technology_id;
			technology.innerHTML = i.content.name;

			technology1.value = i.content.technology_id;
			technology1.innerHTML = i.content.name;

			technology2.value = i.content.technology_id;
			technology2.innerHTML = i.content.name;
			
			technology3.value = i.content.technology_id;
			technology3.innerHTML = i.content.name;
			
			technology4.value = i.content.technology_id;
			technology4.innerHTML = i.content.name;
			
			technology5.value = i.content.technology_id;
			technology5.innerHTML = i.content.name;
			
			technology6.value = i.content.technology_id;
			technology6.innerHTML = i.content.name;

			if(AddTech)
			{
				AddTech.add(technology);
			}

			if(AddTechnology){
				AddTechnology.add(technology3);
			}

			if(AddTechnologyToTopic){
				AddTechnologyToTopic.add(technology1);
			}
			if(AddTechnologyToMaterial){
				AddTechnologyToMaterial.add(technology2)
			}
			
			if(AddTechnologyToDeleteMaterial){
				AddTechnologyToDeleteMaterial.add(technology4);
			}
			if(AddTechnologyToDeleteQuestion){
				AddTechnologyToDeleteQuestion.add(technology5);
			}
			if(AddTechnologyToAddQuestion){
				AddTechnologyToAddQuestion.add(technology6);
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
$("#select_technology_delete_material").change(function(){
		var grandparent_height = $('.col-md-9').width();
		$('#notes').width( grandparent_height );
		$('#button_notes').click(function(){
			$("#div_notes").fadeToggle(0);
		});
		$("#div_notes").fadeToggle(0);



		var AddTopic = document.getElementById("select_topic_delete_material");
		while (AddTopic.childElementCount != 0) {
			try {
				AddTopic.removeChild(AddTopic.childNodes[0]);
			}
			catch (e) {

			}
		}
		var child=0;
		var Select_Tech = document.getElementById("select_technology_delete_material").value;
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
				var AddMaterial = document.getElementById("select_material_delete_material");
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
// topic dropdown - delete page
$("#select_technology_delete").change(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);



	var AddTopic = document.getElementById("select_topic_delete");
	while (AddTopic.childElementCount != 0) {
		try {
			AddTopic.removeChild(AddTopic.childNodes[0]);
		}
		catch (e) {

		}
	}
	var Select_Tech = document.getElementById("select_technology_delete").value;
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

// material dropdown - delete page
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
 * 
 * @type {Element}
 */
var carusel = document.getElementById('Carusel');
$(".form-control").change(function() {
	$("#test_input").hide();
	$('#myCarousel').hide();
	$("#testspace").hide();
	$("#material_info").hide();
	$("#answer_button").hide();
	$("#retake_button").hide();
	$("#testAnswer").hide();
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
 * Handles all of the materials inside the carousel created by the language
 * selected and the topics and adds a click event on them that displays
 * materials and or tests
 * 
 * @param i
 *            topic ID
 * @param topic
 *            Topic object - button
 * @param option
 *            language ID
 */
function handleelement(i,topic,option)
{
	$("#search-container").hide();
	topic.addEventListener("click", function (e) {
		$("#test_input").show();
		$("#download_button").hide();
		$("#retake_button").hide();
		$("#material_info").hide();
		$("#testspace").hide();
		$("#search-container").hide();
		$("#myCarousel").show();
		$("#answer_button").hide();
		$("#testAnswer").hide();
		testFunction(i,option);
		testRetake(i,option);
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
				var material_id = k.content.material_id;
				if (test == 0) {
					var carousel = document.getElementById('Carusel');
					var material = document.createElement("img");
					var div = document.createElement("div");
                    var captionDiv = document.createElement("div");
                    var addMaterialCaption = document.createElement("p");
					var type = k.content.type;
					var source = k.content.link;
					div.className = "item active";
					material.name = "material"
					material.innerHTML = " test1";
                    captionDiv.className = "carousel-caption";
                    addMaterialCaption.name = "materialCaption";
                    addMaterialCaption.innerHTML = title;
					if(type==0)
					{
						material.src = k.content.link;
						div.appendChild(material);
						handleMaterial(material,source,type,title,desc,material_id);
					}
					else if(type==1)
					{

						var video = document.createElement("video");
						video.type="video/mp4";
						video.src= k.content.link;
						div.appendChild(video);
						handleMaterial(video,source,type,title,desc,material_id);
					}
					else if(type==2)
					{
						material.src = "http://www.sribu.com/assets/preview-not-available.jpg";
						div.appendChild(material);
						handleMaterial(material,source,type,title,desc,material_id);
					}
                    div.appendChild(captionDiv);
                    captionDiv.appendChild(addMaterialCaption);
					carousel.appendChild(div);
				}
				else {
					var carousel = document.getElementById('Carusel');
					var div2 = document.createElement("div");
                    var captionDiv2 = document.createElement("div");
                    var addMaterialCaption2 = document.createElement("p");
					var material = document.createElement("img");
					var type = k.content.type;
					var source = k.content.link;
					material.name = "material"
					material.innerHTML = " test1";
                    captionDiv2.className = "carousel-caption";
                    addMaterialCaption2.name = "materialCaption";
                    addMaterialCaption2.innerHTML = title;
					if(type==0)
					{
						material.src = k.content.link;
						div2.appendChild(material);
						handleMaterial(material,source,type,title,desc,material_id);
					}
					else if(type==1)
					{

						var video = document.createElement("video");
						video.type="video/mp4";
						video.src= k.content.link;
						div2.appendChild(video);
						handleMaterial(video,source,type,title,desc,material_id);
					}
					else if(type==2)
					{
						material.src = "http://www.sribu.com/assets/preview-not-available.jpg";
						div2.appendChild(material);
						handleMaterial(material,source,type,title,desc,material_id);
					}
					div2.className = "item ";
                    div2.appendChild(captionDiv2);
                    captionDiv2.appendChild(addMaterialCaption2);
					carousel.appendChild(div2);
				}
				test++;
			}
		});
	});
}

/**
 * Handles the materials inside the carousel and adds a click on them in order
 * to show the actual materials / imgs / ppts / pdfs / vids
 * 
 * @param img
 *            Placeholder image for pdf / video / ppt
 * @param source
 *            source for the actual material be it online or local
 * @param type
 *            type as in img / pdf / video
 */
function handleMaterial( img, source, type,title,desc,id)
{
	console.log(type);
	img.addEventListener("click", function (e) {
		/**
		 * Doing the download requirement check for the download button
		 * 
		 */
		var url = "downloadPermissionsUM?user_id=" + user_id + "&material_id=" + id;
		console.log(url);
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: url
		}).then(function (data) {
			try {
				var permision = data.content[0].content.permission;
			}
			catch (e) {
			}
			console.log(id);
			console.log(permision);
			if(permision == false)
			{
				$("#download_button").hide();
			}
			else if ( permision == true)
			{
				var download = document.getElementById("download_button");
				$("#download_button").show();
				download.href = data.content[0].content.material.link;
				download.setAttribute('download','');
			}
		});

		/**
		 * Doing the rest of the things
		 * 
		 * @type {Element}
		 */

        var download = document.getElementById("download_button");
        download.href = "#";
        download.removeAttribute('download','true');
		var url = "downloadPermissionsUM?user_id=" + user_id + "&material_id=" + id;
		$("#download_button").show();
		$("#drop_notes").show();
		DownloadReq(id);
		$("#myCarousel").hide();
		$("#material").show();
		$("#material_info").show();
		$("#retake_button").hide();
		$("#testAnswer").hide();
		$("#test_input").hide();
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
 * Hides all of the other divs and takes all of the search parameters sending it
 * with an ajax request to the servlet It returns the search page populated with
 * all of the search results Appends searchResult() function to all of the
 * buttons created
 */
function search(){
	$("#myCarousel").hide();
	$("#search-container").show();
	$("#material_info").hide();
	$("#test_input").hide();
	$("#material").hide();
	$("#testspace").hide();
	$("#testAnswer").hide();
	$("#retake_button").hide();
	$("#answer_button").hide();
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
			var res = str.split(search).join("<span style = 'color:#D9CB9E;color:#1E1E20;background-color:#D9CB9E'>"+ search + "</span>");
			resultsDescription.innerHTML = res;


			div.appendChild(resultsTitle);
			div.appendChild(resultsDescription);

			div.appendChild(buton);
			search_output.appendChild(div);


		}
	});

}


/**
 * Function that adds a event handler to each of the buttons that takes the user
 * through an ajax request to the actual materials on the site displaying both
 * the languages and the topics for it.
 * 
 * @param buton
 *            The element to which the handler will be attached
 * @param langId
 *            The language ID in order for the topics and materials to be
 *            displayed / obtained
 * @param topicId
 *            The topic ID
 * @param materialId
 *            Material ID
 */
function searchResult(buton, langId, topicId, materialId)
{
	console.log(langId, topicId, materialId);
	buton.addEventListener("click", function(e)
	{
		$("#drop_notes").show();
		$("#material_info").show();
		$("#download_button").show();
		DownloadReq(materialId);
		/**
		 * Doing the download requirement check for the download button
		 *
		 */
		var url = "downloadPermissionsUM?user_id=" + user_id + "&material_id=" + materialId;
		console.log(url);
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: url
		}).then(function (data) {
			try {
				var permision = data.content[0].content.permission;
			}
			catch (e) {
			}
			console.log(permision);
			if(permision == false)
			{
				$("#download_button").hide();
			}
			else if ( permision == true)
			{
				var download = document.getElementById("download_button");
				$("#download_button").show();
				download.href = data.content[0].content.material.link;
				download.setAttribute('download','');
			}
		});



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
		$("#material").show();

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
				material.oncontextmenu="return false;";
				showMaterial.appendChild(material);
			}
			else if ( type == 2 )
			{
				var material = document.createElement("iframe");
				material.width="1000px";
				material.height="600px";
				source = source + "#toolbar=0&navpanes=0&statusbar=0&view=Fit;readonly=true; disableprint=true;";
				material.src=source;
				material.oncontextmenu="return false;";
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
	// $("#bttn_search").hide();
}


/**
 * Function that takes the input from the search bar + type of the user and
 * returns a list with all of the users that match said search criteria
 */
function searchUser()
{
	var usrdiv = document.getElementById("usr_SearchRestults");
	var type = document.getElementById("User_Type").value;
	var usrName = document.getElementById("usrSearch_input").value;
	var url = "searchUsers?name=" + usrName;
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
		
		var tr = document.createElement("tr");
		var usrInfo = document.createElement("th");
		usrInfo.innerHTML = "Name";
		tr.appendChild(usrInfo);
		var usrInfo = document.createElement("th");
		usrInfo.innerHTML = "Surname";
		tr.appendChild(usrInfo);
		var usrInfo = document.createElement("th");
		usrInfo.innerHTML = "E-mail";
		tr.appendChild(usrInfo);
		var usrInfo = document.createElement("th");
		usrInfo.innerHTML = "User Type";
		tr.appendChild(usrInfo);
		usrdiv.appendChild(tr);
		
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
 * Function that received the Language ID and the Topic Id in order to create
 * tests apropiate for those Criteria
 * 
 * @param topic_id
 *            The topic ID
 * @param option
 *            The language ID handleButon function - Appends a event handler for
 *            when the user finishes completing the test
 */
var nrOfQuestionsTest=0;
function testFunction(topic_id,option)
{
	$("#test_input").unbind("click");
	var testSpace = document.getElementById("testspace");
	$("#test_input").bind("click" , function (e) {
		$("#test_input").hide();
		$("#material_info").hide();
		$("#material").hide();
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
			nrOfQuestionsTest=data.content.length;
			if(data.content.length==0)
			{
				var noSearchResult = document.createElement("p");
				noSearchResult.innerHTML = " No test questions available for this topic";
				testSpace.appendChild(noSearchResult);
				$("#answer_button").hide();
			}
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
					if(i.content.answer_text.length!=0)
					{
						console.log(i.content.answer_text.length);
						div.appendChild(div1);
					}
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
					if(i.content.answer_text.length!=0)
					{
						console.log(i.content.answer_text.length);
						div.appendChild(div1);
					}
					testSpace.appendChild(div);
				}
				var prevId =i.content.question.id;
			}
		});
	});

	handleButon(option, topic_id);

}


/**
 * Function that sends the servlet the topic id, language option and the answers
 * from the input and return through an ajax request the score + highlights
 * right and wrong answers
 * 
 * @param option
 *            Language ID
 * @param topic_id
 *            Topic ID
 */

function handleButon(option, topic_id)
{
	var testSpace = document.getElementById("testAnswer");
	$("#answer_button").unbind("click");
	$("#answer_button").bind("click" , function (e) {
		$("#testAnswer").show();
		$("#answer_button").hide();
		$("#retake_button").show();
		testSpace.removeChild(testSpace.childNodes[0]);
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
					result.innerHTML = "You've achieved " + i.content + " points out of 100!";
					if(nrOfQuestionsTest!=0) {
						testSpace.appendChild(result);
					}
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
/* dropdown menus for delete question page */
$(document).ready(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);
	var AddTech =  document.getElementById("question_select_technology");

	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies"
	}).then(function (data) {
		for (i of data.content) {
			var technology = document.createElement("option");

			technology.value = i.content.technology_id;
			technology.innerHTML = i.content.name;

			if(AddTech)
			{
				AddTech.add(technology);
			}
		}
	});
});

$("#delete_question_select_technology").change(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);



	var AddTopic = document.getElementById("delete_question_select_topic");
	while (AddTopic.childElementCount != 0) {
		try {
			AddTopic.removeChild(AddTopic.childNodes[0]);
		}
		catch (e) {

		}
	}
	var child=0;
	var Select_Tech = document.getElementById("delete_question_select_technology").value;
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
			url: "technologies/" + Select_Tech + "/topics/" + child + "/questions"
		}).then(function (data) {
			var AddQuestion = document.getElementById("delete_question_select");
			try
			{
				while (AddQuestion.childElementCount != 0) {
					try {
						AddQuestion.removeChild(AddQuestion.childNodes[0]);
					}
					catch (e) {

					}
				}
			}
			catch(e)
			{

			}
			for (i of data.content) {
				var question = document.createElement("option");

				question.value = i.content.id;
				question.innerHTML = i.content.question_text;


				AddQuestion.add(question);

			}
		});
	});

});

/* dropdown menus for edit question page */
$(document).ready(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);
	var AddTech =  document.getElementById("edit_question_select_technology");

	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies"
	}).then(function (data) {
		for (i of data.content) {
			var technology = document.createElement("option");

			technology.value = i.content.technology_id;
			technology.innerHTML = i.content.name;

			if(AddTech)
			{
				AddTech.add(technology);
			}
		}
	});
});

$("#edit_question_select_technology").change(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);



	var AddTopic = document.getElementById("edit_question_select_topic");
	while (AddTopic.childElementCount != 0) {
		try {
			AddTopic.removeChild(AddTopic.childNodes[0]);
		}
		catch (e) {

		}
	}
	var child=0;
	var Select_Tech = document.getElementById("edit_question_select_technology").value;
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
			}

			AddTopic.add(topic);
		}
        $.ajax({
            type: 'GET',
            dataType: 'json',
            url: "technologies/" + Select_Tech + "/topics/" + child + "/questions"
        }).then(function (data) {
			var AddQuestion = document.getElementById("edit_question_select_question");
			try
			{
				while (AddQuestion.childElementCount != 0) {
					try {
						AddQuestion.removeChild(AddQuestion.childNodes[0]);
					}
					catch (e) {

					}
				}
			}
			catch(e)
			{

			}
			for (i of data.content) {
				var question = document.createElement("option");
				question.value = i.content.id;
				question.innerHTML = i.content.question_text;
				AddQuestion.add(question);
			}
	        var selectedQuestion = document.getElementById("edit_question_select_question").value;
			fillQuestion(Select_Tech, child, selectedQuestion);
		});
	});

});

$("#edit_question_select_question").change(function () {
    var selectedQuestion = document.getElementById("edit_question_select_question").value;
    var Select_Tech = document.getElementById("edit_question_select_technology").value;
    var child = document.getElementById("edit_question_select_topic").value;
    fillQuestion(Select_Tech, child, selectedQuestion);
    
})
$("#edit_question_select_topic").change(function(){
	var Select_Tech = document.getElementById("edit_question_select_technology").value;
    var child = document.getElementById("edit_question_select_topic").value;
    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: "technologies/" + Select_Tech + "/topics/" + child + "/questions"
    }).then(function (data) {
		var AddQuestion = document.getElementById("edit_question_select_question");
		try
		{
			while (AddQuestion.childElementCount != 0) {
				try {
					AddQuestion.removeChild(AddQuestion.childNodes[0]);
				}
				catch (e) {

				}
			}
		}
		catch(e)
		{

		}
		for (i of data.content) {
			var question = document.createElement("option");
			question.value = i.content.id;
			question.innerHTML = i.content.question_text;
			AddQuestion.add(question);
		}
        var selectedQuestion = document.getElementById("edit_question_select_question").value;
		fillQuestion(Select_Tech, child, selectedQuestion);
	});
})
function fillQuestion(selectedTechnology, selectedTopic, selectedQuestion){
	
	var existingQuestion = document.getElementById("question_body").removeAttribute("value");
	
	$.ajax({
        type: 'GET',
        dataType: 'json',
        url: "technologies/" + selectedTechnology + "/topics/" + selectedTopic + "/questions/" + selectedQuestion
    }).then(function (data) {
        var questionBody = document.getElementById("question_body");
        questionBody.value = data.content.question_text;

        var startDate = document.getElementById("datepicker1_edit");
        startDate.value = data.content.start_date;

        var endDate = document.getElementById("datepicker2_edit");
        endDate.value = data.content.end_date;
    })

    $.ajax({
        type: 'GET',
        dataType: 'json',
        url: "technologies/" + selectedTechnology+ "/topics/" + selectedTopic + "/questions/" + selectedQuestion + "/answers"
    }).then(function (data) {
        var answer1 = document.getElementById("answer1");
        answer1.value = data.content[0].content.answer_text;

        var correctRadioButton1 = document.getElementById("radio_correct1");
        var incorrectRadioButton1 = document.getElementById("radio_incorrect1");
        if(data.content[0].content.correct === true) {
            correctRadioButton1.checked = true;
            incorrectRadioButton1.checked = false;
        } else {
            correctRadioButton1.checked = false;
            incorrectRadioButton1.checked = true;
        }


        var answer2 = document.getElementById("answer2");
        answer2.value = data.content[1].content.answer_text;

        var correctRadioButton2 = document.getElementById("radio_correct2");
        var incorrectRadioButton2 = document.getElementById("radio_incorrect2");
        if(data.content[1].content.correct === true) {
            correctRadioButton2.checked = true;
            incorrectRadioButton2.checked = false;
        } else {
            correctRadioButton2.checked = false;
            incorrectRadioButton2.checked = true;
        }

        var answer3 = document.getElementById("answer3");
        answer3.value = data.content[2].content.answer_text;

        var correctRadioButton3 = document.getElementById("radio_correct3");
        var incorrectRadioButton3 = document.getElementById("radio_incorrect3");
        if(data.content[2].content.correct === true) {
            correctRadioButton3.checked = true;
            incorrectRadioButton3.checked = false;
        } else {
            correctRadioButton3.checked = false;
            incorrectRadioButton3.checked = true;
        }

        var answer4 = document.getElementById("answer4");
        answer4.value = data.content[3].content.answer_text;

        var correctRadioButton4 = document.getElementById("radio_correct4");
        var incorrectRadioButton4 = document.getElementById("radio_incorrect4");
        if(data.content[3].content.correct === true) {
            correctRadioButton4.checked = true;
            incorrectRadioButton4.checked = false;
        } else {
            correctRadioButton4.checked = false;
            incorrectRadioButton4.checked = true;
        }

        var answer5 = document.getElementById("answer5");
        answer5.value = data.content[4].content.answer_text;

        var correctRadioButton5 = document.getElementById("radio_correct5");
        var incorrectRadioButton5 = document.getElementById("radio_incorrect5");
        if(data.content[4].content.correct === true) {
            correctRadioButton5.checked = true;
            incorrectRadioButton5.checked = false;
        } else {
            correctRadioButton5.checked = false;
            incorrectRadioButton5.checked = true;
        }
    })
}
function testRetake(topic_id,option)
{
	$("#retake_button").unbind("click");
	var testSpace = document.getElementById("testspace");
	$("#retake_button").bind("click" , function (e) {
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
			if(data.content.length==0)
			{
				var noSearchResult = document.createElement("p");
				noSearchResult.innerHTML = " No test questions available for this topic";
				testSpace.appendChild(noSearchResult);
			}
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
					if(i.content.answer_text.length!=0)
					{
						console.log(i.content.answer_text.length);
						div.appendChild(div1);
					}
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
					if(i.content.answer_text.length!=0)
					{
						console.log(i.content.answer_text.length);
						div.appendChild(div1);
					}
					testSpace.appendChild(div);
				}
				var prevId =i.content.question.id;
			}

		});
	});

	handleButon(option, topic_id);

}
function DownloadReq(id)
{
    var testClick = true;
	console.log(user_id);
	var button_down = document.getElementById("download_button");
    $("#download_button").unbind();
    $("#download_button").bind("click", function(e)
	{
		var url = "downloadPermissionsUM?user_id=" + user_id + "&material_id=" + id;
		console.log(url);
		$.ajax({
			type: 'GET',
			dataType: 'json',
			url: url
		}).then(function (data) {
			try {
				var permision = data.content[0].content.permission;
			}
			catch (e)
			{
				$("#download_button").hide();
				$.ajax({
					type: 'POST',
					dataType: 'json',
					url: url
				}).then(function (data)
				{
					console.log("Try");
				});
				console.log(1);
			}
			console.log(id);
			console.log(permision);
			if(permision == false)
			{
				$("#download_button").hide();
			}
			else if ( permision == true)
			{
				var download = document.getElementById("download_button");
				$("#download_button").show();
				download.href = data.content[0].content.material.link;
				download.setAttribute('download','');
			}
		})
		$("#download_button").show();
	});
}

/* dropdown menus for add question page */

$("#add_question_select_technology").change(function(){
	var AddTopic = document.getElementById("add_question_select_topic");
	 while (AddTopic.childElementCount != 0) {
	    	try {
	    		AddTopic.removeChild(AddTopic.childNodes[0]);
	    		}
	    	catch (e) {
	    		
	    	}
	    }
    var selectedTechnology = document.getElementById("add_question_select_technology").value;
    console.log(selectedTechnology);
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "technologies/" + selectedTechnology + "/topics"
	}).then(function (data) {
		for (i of data.content) {
			var topic = document.createElement("option");
			topic.value = i.content.topic_id;
			topic.innerHTML = i.content.name;
			AddTopic.add(topic);
		}
	});
});

function getDownloadRequests(){
	console.log("test to see if it gets here ");
	
	var addRequest = document.getElementById("downloadRequests");
	
	$.ajax({
		type: 'GET',
		dataType: 'json',
		url: "download_requests"
	}).then(function(data) {
		 while (addRequest.childElementCount != 0) {
		    	try {
		    		addRequest.removeChild(addRequest.childNodes[0]);
		    		}
		    	catch (e) {
		    		
		    	}
		    }
		var tr = document.createElement("tr");
		var header1 = document.createElement("th");
		header1.innerHTML = "Name";
		tr.appendChild(header1);
		var header2 = document.createElement("th");
		header2.innerHTML = "Surname";
		tr.appendChild(header2);
		var header3 = document.createElement("th");
		header3.innerHTML = "Email";
		tr.appendChild(header3);
		var header4 = document.createElement("th");
		header4.innerHTML = "Material";
		tr.appendChild(header4);
		addRequest.appendChild(tr);
		
		for(i of data.content){
			var tr1 = document.createElement("tr");
			var name = document.createElement("th");
			name.innerHTML = i.content.user.name;
			tr1.appendChild(name);
			
			var surname = document.createElement("th");
			surname.innerHTML = i.content.user.surname;
			tr1.appendChild(surname);
			
			var email = document.createElement("th");
			email.innerHTML = i.content.user.email;
			tr1.appendChild(email);
			
			var material = document.createElement("th");
			material.innerHTML = i.content.material.title;
			tr1.appendChild(material);
			
			var accept = document.createElement("th");
			var button = document.createElement("button");
			button.type = "button";
			button.innerHTML = "Accept";
			var permissionId = i.content.permission_id;
			
			handleButton(button, permissionId);
			
			accept.appendChild(button);
			tr1.appendChild(accept);
			
			addRequest.appendChild(tr1);
		}
	})
}

function handleButton(buton, id)
{

	var addRequest = document.getElementById("downloadRequests");
	$(buton).unbind();
	$(buton).bind("click", function(e){
		var data = { "permission" : "true" }
		$.ajax({
			    headers: { 
			        'Accept': 'application/json',
			        'Content-Type': 'application/json' 
			    },
			    'type': 'PUT',
			    'url':  "downloadPermissionsUM/" + id,
			    'data': JSON.stringify(data),
			    'dataType': 'json'
			    }).then(function(data){
			getDownloadRequests();
		});
			   
		});
}
