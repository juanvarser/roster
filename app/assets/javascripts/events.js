var handleErrorEvent = function(){
	console.log('ERROR')
};
var handleEvent = function(event){
	if(event.completed == true){
		$('a[controller=finances]').addClass('is-disabled');
		$('a[controller=finances]').addClass('is-lighter-color')
	}
};


$(document).on('ready', function(){

	var base_url = window.location.host;
	var api_resource = window.location.pathname;
	$.ajax({
    method: 'GET',    
		url: 'http://' + base_url + api_resource + '/event_info',
		success: handleEvent,
		error: handleErrorEvent,
		dataType: 'json'
	});

	var eventsAll = $("a[js-data='events-all']").on('click', function(){
		$(this).addClass('is-active');
		$("div[id='events-all']").removeClass('js-is-hidden');

		$("div[id='events-ontour']").addClass('js-is-hidden');
		$("div[id='events-expired']").addClass('js-is-hidden');
		$("a[js-data='events-ontour']").removeClass('is-active');
		$("a[js-data='events-expired']").removeClass('is-active');
	});

	var eventsOnTour = $("a[js-data='events-ontour']").on('click', function(){
		$(this).addClass('is-active');
		$("div[id='events-ontour']").removeClass('js-is-hidden');

		$("div[id='events-all']").addClass('js-is-hidden');
		$("div[id='events-expired']").addClass('js-is-hidden');
		$("a[js-data='events-all']").removeClass('is-active');
		$("a[js-data='events-expired']").removeClass('is-active');
		
	});

	var eventsExpired = $("a[js-data='events-expired']").on('click', function(){
		$(this).addClass('is-active');
		$("div[id='events-expired']").removeClass('js-is-hidden');
		$("div[id='events-all']").addClass('js-is-hidden');
		$("div[id='events-ontour']").addClass('js-is-hidden');
		$("a[js-data='events-all']").removeClass('is-active');
		$("a[js-data='events-ontour']").removeClass('is-active');	
	});
})

