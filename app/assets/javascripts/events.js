var eventCompleted = function(event){
	if(event.completed == true){
		$('[js-data=table-finances]').find('a').addClass('is-disabled is-lighter-color');
	}
};

var getEventsInfo = function(){
	var base_url = window.location.host;
	var api_resource = window.location.pathname;
	$.ajax({
    method: 'GET',
		url: 'http://' + base_url + api_resource,
		success: eventCompleted,
		error: function(data){console.log(data)},
		dataType: 'json'
	});
};

var handleEvents = function(){
	$('a[js-data=events]').on('click', function(event){
		$(event.target).addClass('is-active');
		$('a[js-data=events]').not(event.target).removeClass('is-active');
		setEvents(event);
	})
};

var setEvents = function(param){
	// var arr = $('#events').children();
	if($(param.target).text().toLowerCase().indexOf('on tour') > -1){
		$('#events-title').text('Events on tour');
		$('div[js-data=true]').hide();
		$('div[js-data=false]').show();
		} else if($(param.target).text().toLowerCase().indexOf('completed') > -1) {
		$('#events-title').text('Completed Events');
		$('div[js-data=false]').hide();
		$('div[js-data=true]').show();
	} else {
		$('#events-title').text('All Events');
		$('div[js-data]').show();
	};
};

$(document).on('ready', function(){
	getEventsInfo();
	handleEvents();
})
