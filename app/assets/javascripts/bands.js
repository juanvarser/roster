var handlerCardIn = function(){
		var $this = $(this);
		$this.find('.card-title-ellipsis').addClass('is-primary-color');
		$this.find('.card-submenu').removeClass('js-is-hidden')
		.animate({
      opacity: 1,
    	}, 300);
};

var handlerCardOut = function(){
		var $this = $(this);
		$this.find('.card-submenu').addClass('js-is-hidden');
		$this.find('.card-title-ellipsis').removeClass('is-primary-color');
		$this.find('.card-submenu').css('opacity',0.7);

};

var setNavigation = function() {
  	$("#tab_menu a").each(function() {   
    	if (this.href == window.location.href) {
        $(this).closest('li').addClass("is-active");
    	}
		});
	};

var updateBandInfo = function(data,callback){
	var base_url = window.location.host;
	var api_resource = window.location.pathname.split("/");
	$.ajax({
    method: 'PATCH',   
		url: 'http://' + base_url + '/users/'+ api_resource[2] + '/bands/' + api_resource[4] + '/update_band_info',
		data: data,
		success: callback,
		error: function(data) {
			console.log(data);
		}
	});
};

var handleBandDescription = function(){
	var content = $('p[data-js="description"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-content-button'></i>";
	var editField = "<textarea id='band_description' class='textarea' data-js='description'>" + content + "</textarea>";
	
	$('p[data-js="description"]').replaceWith(editField);
	$('h1[data-js="description-content"] i').remove();
	$('h1[data-js="description-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			band_description: $('#band_description').val()
		};
		updateBandInfo(data,saveBandDescription);
	});
};
	
var saveBandDescription = function(result){
	var editButton = '<i class="fa fa-pencil is-update-content-button" onclick="handleBandDescription()"></i>'
	$('textarea[data-js="description"]').replaceWith('<p data-js="description">' + result.band.description + '</p>');
	$('h1[data-js="description-content"] i').remove();
	$('h1[data-js="description-content"]').append(editButton);
};

var handleBandCache = function(){
	var content = $('p[data-js="cache"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-content-button'></i>";
	var editField = "<input id='band_cache' class='input' data-js='cache'placeholder=" + content.toString() + "></input>";
	
	$('p[data-js="cache"]').replaceWith(editField);
	$('h1[data-js="cache-content"] i').remove();
	$('h1[data-js="cache-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			band_cache: $('#band_cache').val()
		};
		updateBandInfo(data,saveBandCache);
	});
};

var saveBandCache = function(result){
	var editButton = '<i class="fa fa-pencil is-update-content-button" onclick="handleBandCache()"></i>'
	$('input[data-js="cache"]').replaceWith('<p data-js="cache">' + result.band.cache + '</p>');
	$('h1[data-js="cache-content"] i').remove();
	$('h1[data-js="cache-content"]').append(editButton);
};

var handleBandComission = function(){
	var content = $('p[data-js="comission"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-content-button'></i>";
	var editField = "<input id='band_comission' class='input' data-js='comission' placeholder=" + content.toString() + "></input>";
	
	$('p[data-js="comission"]').replaceWith(editField);
	$('h1[data-js="comission-content"] i').remove();
	$('h1[data-js="comission-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			band_comission: $('#band_comission').val()
		};
		updateBandInfo(data,saveBandComission);
	});
};

var saveBandComission = function(result){
	var editButton = '<i class="fa fa-pencil is-update-content-button" onclick="handleBandComission()"></i>'
	$('input[data-js="comission"]').replaceWith('<p data-js="cache">' + result.band.comission + '</p>');
	$('h1[data-js="comission-content"] i').remove();
	$('h1[data-js="comission-content"]').append(editButton);
};

var handleBandName = function(){
	var content = $('h1[data-js="name"]').html();
	var saveButton = "<i class='fa fa-floppy-o is-update-hero-button'></i>";
	var editField = "<input id='band_name' class='input' data-js='name' placeholder=" + content.toString() + "></input>";
	
	$('h1[data-js="name"]').replaceWith(editField);
	$('div[data-js="name-content"] i').remove();
	$('div[data-js="name-content"]').append(saveButton);

	$('.fa-floppy-o').on('click', function(){
		var data = {
			band_name: $('#band_name').val()
		};
		updateBandInfo(data,saveBandName);
	});
};

var saveBandName = function(result){
	console.log(result);
	var editButton = '<i class="fa fa-pencil is-update-hero-button" onclick="handleBandName()"></i>'
	$('input[data-js="name"]').replaceWith('<h1 data-js="name" class="title is-1 artist-page-title">' + result.band.name + '</h1>');
	$('div[data-js="name-content"] i').remove();
	$('div[data-js="name-content"]').append(editButton);
};

$(document).on('ready', function(){

	var HandleCardListener = function(){
		$('.card').hover(handlerCardIn,handlerCardOut);
	}();

	setNavigation();	

	$('i[data-js="description"]').click(handleBandDescription);
	$('i[data-js="cache"]').click(handleBandCache);
	$('i[data-js="comission"]').click(handleBandComission);	
	$('i[data-js="name"]').click(handleBandName);	

});
