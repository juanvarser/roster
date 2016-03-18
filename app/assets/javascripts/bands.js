var eventAnimation = function(){

}

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

$(document).on('ready', function(){

	var HandleCardListener = function(){
		$('.card').hover(handlerCardIn,handlerCardOut);
	}();

});
