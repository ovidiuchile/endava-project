$(document).ready(function(){
	$("#myCarousel").carousel({interval: false});
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
	$('#button_notes').click(function(){
		$("#div_notes").fadeToggle(0);
	});
	$("#div_notes").fadeToggle(0);
});
$(window).resize(function(){
	var grandparent_height = $('.col-md-9').width();
	$('#notes').width( grandparent_height );
});










$.ajaxSetup({
	async: false
});
var carusel = document.getElementById('Carusel');
$(".form-control").change(function() {
	var option = document.getElementById('Language_Selector').value;
	var AddTopic = document.getElementById('Topics');
	var material = document.createElement("img");
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

function handleelement(i,topic,option)
{
	topic.addEventListener("click", function (e) {
		$("#myCarousel").show();
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
			console.log(data.content.length);
			for(k of data.content) {
				if (test == 0) {
					var carousel = document.getElementById('Carusel');
					var material = document.createElement("img");
					var div = document.createElement("div");
					var type = k.content.type;
					var source = k.content.link;
					div.className = "item active";
					material.name = "material"
					material.innerHTML = " test";
					material.src = k.content.link;
					material.style.zIndex= " 50";
					handleMaterial(material,source,type);
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
					material.innerHTML = " test";
					material.src = k.content.link;
					material.style.zIndex= " 50";
					div2.className = "item ";
					handleMaterial(material,source,type);
					div2.appendChild(material);
					carousel.appendChild(div2);
				}
				test++;
			}
		});
	});
}


function handleMaterial( img, source, type)
{
	console.log(type);
		img.addEventListener("click", function (e) {
			$("#myCarousel").hide();
			$("material").show();
			var showMaterial = document.getElementById('material');
			showMaterial.style.display = " initial";
			showMaterial.removeChild(showMaterial.childNodes[0]);
			if( type==0 )
			{
				var material = document.createElement("img");
				material.name = "material"
				material.innerHTML = " test";
				material.src = source;
				showMaterial.appendChild(material);
			}
			else if ( type == 1)
			{
				var material = document.createElement("iframe");
				material.width="560";
				material.height="560";
				material.src=source;
				showMaterial.appendChild(material);
			}
			else if ( type == 2 )
			{
				var material = document.createElement("iframe");
				material.width="560";
				material.height="560";
				material.src=source;
				showMaterial.appendChild(material);
			}
		});
}









function openNav() {
	document.getElementById("mySidenav").style.width = "200px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}