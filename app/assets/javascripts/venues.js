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
	$('input[data-js="cache"]').replaceWith('<p data-js="cache">' + result.cache + '</p>');
	$('h1[data-js="cache-content"] i').remove();
	$('h1[data-js="cache-content"]').append(editButton);
};

var handleVenueAddress = function(){
	var address_content = $('p[data-js="address"]').html();
	var city_content = $('p[data-js="city"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-content-button'></i>";
	var venue_address = "<input id='venue_address' class='input' data-js='address'placeholder=" + address_content.toString() + "></input>";
	var venue_city = "<input id='venue_city' class='input' data-js='city'placeholder=" + city_content.toString() + "></input>";
	
	$('p[data-js="address"]').replaceWith(venue_address);
	$('p[data-js="city"]').replaceWith(venue_city);
	$('h1[data-js="address-content"] i').remove();
	$('h1[data-js="address-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			venue_address: $('#venue_address').val(),
			venue_city: $('#venue_city').val(),

		};
		updateVenueInfo(data,saveVenueAddress);
	});
};

var saveVenueAddress = function(result){
	console.log(result)
	var editButton = '<i class="fa fa-pencil is-update-content-button" onclick="handleVenueAddress()"></i>'
	$('input[data-js="address"]').replaceWith('<p data-js="address">' + result.address + '</p>');
	$('input[data-js="city"]').replaceWith('<p data-js="city">' + result.city + '</p>');
	$('h1[data-js="address-content"] i').remove();
	$('h1[data-js="address-content"]').append(editButton);
};

var handleVenueContact = function(){
	var content_name = $('p[data-js="contact-name"]').html();
	var content_phone = $('p[data-js="contact-phone"]').html();
	var content_email = $('p[data-js="contact-email"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-content-button'></i>";
	var editNameField = "<input id='venue_contact_name' class='input' data-js='contact-name'placeholder=" + content_name.toString() + "></input>";
	var editPhoneField = "<input id='venue_phone' class='input' data-js='contact-phone'placeholder=" + content_phone.toString() + "></input>";
	var editEmailField = "<input id='venue_contact_email' class='input' data-js='contact-email'placeholder=" + content_email.toString() + "></input>";
	
	$('p[data-js="contact-name"]').replaceWith(editNameField);
	$('p[data-js="contact-phone"]').replaceWith(editPhoneField);
	$('p[data-js="contact-email"]').replaceWith(editEmailField);
	$('h1[data-js="contact-content"] i').remove();
	$('h1[data-js="contact-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			venue_contact_name: $('#venue_contact_name').val(),
			venue_phone: $('#venue_phone').val(),
			venue_email: $('#venue_email').val()
		};
		updateVenueInfo(data,saveVenueContact);
	});
};

var saveVenueContact = function(result){
	var editButton = '<i class="fa fa-pencil is-update-content-button" onclick="handleVenueContact()"></i>'
	$('input[data-js="contact-name"]').replaceWith('<p data-js="contact-name">' + result.contact_name + '</p>');
	$('input[data-js="contact-phone"]').replaceWith('<p data-js="contact-phone">' + result.phone + '</p>');
	$('input[data-js="contact-email"]').replaceWith('<p data-js="contact-email">' + result.email + '</p>');

	$('h1[data-js="contact-content"] i').remove();
	$('h1[data-js="contact-content"]').append(editButton);
};

$(document).ready(function(){
	$('i[data-js="address"]').click(handleVenueAddress);
	$('i[data-js="cache"]').click(handleVenueCache);
	$('i[data-js="contact"]').click(handleVenueContact);	
});