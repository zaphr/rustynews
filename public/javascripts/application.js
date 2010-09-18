$(document).ready(function(){

//Larger thumbnail preview

$("#article_image img").hover(function() {
	$(this).css({'z-index' : '10'});
	$(this).find('img').addClass("hover").stop()
		.animate({
			marginTop: '-110px',
			marginLeft: '-110px',
			top: '50%',
			left: '50%',
			width: '174px',
			height: '174px',
			padding: '20px'

		}, 200);

	} , function() {
	$(this).css({'z-index' : '0'});
	$(this).find('img').removeClass("hover").stop()
		.animate({
			marginTop: '0',
			marginLeft: '0',
			top: '0',
			left: '0',
			width: '100px',
			height: '100px',
			padding: '5px'
		}, 400);
});

//Swap Image on Click
	$("ul.thumb li a").click(function() {

		var mainImage = $(this).attr("href"); //Find Image Name
		$("#main_view img").attr({ src: mainImage });
		return false;
	});

});

$(document).ready(function(){

  if (!$.browser.msie) {
//    $(".round").corner("round  10px");
//    $("#header").corner("round br  10px");
//    $("#top_pagination").corner("round tl tr 10px");
    }
});