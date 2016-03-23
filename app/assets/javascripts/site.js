var scrollToAnchor = function(aid){
    var aTag = $("a[id='"+ aid +"']");
    console.log(aTag);
    $('html,body').animate({scrollTop: aTag.offset().top}, 'slow');
};


$(document).ready(function(){
	$("#arrow-scroll i").click(function() {
   	scrollToAnchor('features');
   });
})