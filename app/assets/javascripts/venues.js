var updateVenueInfo = function(data,callback){
	var base_url = window.location.host;
	var api_resource = window.location.pathname.split("/");
	$.ajax({
    method: 'post',   
		url: 'http://' + base_url + '/users/'+ api_resource[2] + '/venues/' + api_resource[4] + '/update_venue_info',
		data: data,
		success: callback,
		error: function(data) {
			console.log(data);
		}
	});
};

var handleVenueCache = function(){
	var content = $('p[data-js="cache"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-content-button'></i>";
	var editField = "<input id='venue_cache' class='input' data-js='cache'placeholder=" + content.toString() + "></input>";
	
	$('p[data-js="cache"]').replaceWith(editField);
	$('h1[data-js="cache-content"] i').remove();
	$('h1[data-js="cache-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			venue_cache: $('#venue_cache').val()
		};
		updateVenueInfo(data,saveVenueCache);
	});
};

var saveVenueCache = function(result){
	console.log(result)
	var editButton = '<i class="fa fa-pencil is-update-content-button" onclick="handleVenueCache()"></i>'
	$('input[data-js="cache"]').replaceWith('<p data-js="cache">' + result.venue.cache + '</p>');
	$('h1[data-js="cache-content"] i').remove();
	$('h1[data-js="cache-content"]').append(editButton);
};

$(document).ready(function(){
	$('i[data-js="comission"]').click(handleVenueCache);	
});