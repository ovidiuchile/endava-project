$(document).ready(function(){
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
	while (carusel.childElementCount != 0) {
		try {
			carusel.removeChild(carusel.childNodes[0]);
		}
		catch (e) {

		}
	}
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
		var j = data.content.length;
		for (i of data.content) {
			var topic = document.createElement("button");
			topic.className="btn btn-primary";
			topic.type="button";
			topic.name = i.content.name;
			topic.value = j;
			topic.innerHTML = i.content.name;
			handleelement(j,topic,option);
			j--;
			AddTopic.appendChild(topic);
		}
	});
});

function handleelement(i,topic,option)
{
	topic.addEventListener("click", function (e) {
		console.log(i,topic,option);
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
					div.className = "item active";
					material.name = "material"
					material.innerHTML = " test";
					material.src = k.content.link;
					div.appendChild(material);
					carousel.appendChild(div);
				}
				else {
					var carousel = document.getElementById('Carusel');
					var div2 = document.createElement("div");
					var material = document.createElement("img");
					material.name = "material"
					material.innerHTML = " test";
					material.src = k.content.link;
					div2.className = "item ";
					console.log(k, material.name);
					div2.appendChild(material);
					carousel.appendChild(div2);
				}
				test++;
			}
		});
	});
}












function openNav() {
	document.getElementById("mySidenav").style.width = "200px";
}

/* Set the width of the side navigation to 0 */
function closeNav() {
	document.getElementById("mySidenav").style.width = "0";
}