// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require chart.js.js

var setNavigation = function() {
  	$("#tab_menu a").each(function() {
    	if (this.href == window.location.href) {
        $(this).closest('li').addClass("is-active");
    	}
		});
	};

var flashNotice = function(){
  $(".notification").html("<%= flash[:notice] %>");
  setTimeout(function(){
    $('.notification').fadeOut('slow',function(){
      $('.notification').remove();
    });
  }, 3000);

};

$(document).on('ready',function(){
	setNavigation();
})
