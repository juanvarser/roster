var handleEvent = function(event){
	if(event.completed == true){
		$('a[controller=finances]').addClass('is-disabled');
		$('a[controller=finances]').addClass('is-lighter-color')
	}
};

var getEventsInfo = function(){
	var base_url = window.location.host;
	var api_resource = window.location.pathname;
	$.ajax({
    method: 'GET',    
		url: window.location.protocol + base_url + api_resource + '/event_info',
		success: handleEvent,
		error: function(data){console.log(data)},
		dataType: 'json'
	});
};



$(document).on('ready', function(){

	getEventsInfo();

	var eventsAll = $("a[js-data='events-all']").on('click', function(){
		$(this).addClass('is-active');
		$("div[id='events-all']").removeClass('js-is-hidden');

		$("div[id='events-ontour']").addClass('js-is-hidden');
		$("div[id='events-expired']").addClass('js-is-hidden');
		$('#events-title').text('All Events');
		$("a[js-data='events-ontour']").removeClass('is-active');
		$("a[js-data='events-expired']").removeClass('is-active');
	});

	var eventsOnTour = $("a[js-data='events-ontour']").on('click', function(){
		$(this).addClass('is-active');
		$("div[id='events-ontour']").removeClass('js-is-hidden');

		$("div[id='events-all']").addClass('js-is-hidden');
		$("div[id='events-expired']").addClass('js-is-hidden');
		$('#events-title').text('Events on tour');
		$("a[js-data='events-all']").removeClass('is-active');
		$("a[js-data='events-expired']").removeClass('is-active');
		
	});

	var eventsExpired = $("a[js-data='events-expired']").on('click', function(){
		$(this).addClass('is-active');
		$("div[id='events-expired']").removeClass('js-is-hidden');
		$("div[id='events-all']").addClass('js-is-hidden');
		$("div[id='events-ontour']").addClass('js-is-hidden');
		$('#events-title').text('Completed Events');
		$("a[js-data='events-all']").removeClass('is-active');
		$("a[js-data='events-ontour']").removeClass('is-active');	
	});
})

