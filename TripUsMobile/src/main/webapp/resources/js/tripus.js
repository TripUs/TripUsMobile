$(document).ready(function() {
	$('.img-slider').slick({
		dots : false,
		infinite : true,
		speed : 300,
		slidesToShow : 1,
		centerMode : true,
		variableWidth : false
	});
});

$(document).on("mobileinit", function() {
	$('.img-slider').slick({
		dots : false,
		infinite : true,
		speed : 300,
		slidesToShow : 1,
		centerMode : true,
		variableWidth : false
	});
});