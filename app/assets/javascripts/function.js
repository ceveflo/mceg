var do_on_load;
var repage;
var winWidth;
var conWidth;
var currentWidth = 980;
do_on_load = function() {

	repage =  function() {

		winWidth = $(window).width();
		conWidth;
		if(winWidth < 481) {
			conWidth = 320;
			col = 1
		} else if(winWidth < 769) {
			conWidth = 480;
			col = 2
		} else if(winWidth < 1091) {
			conWidth = 548;
			col = 3;
		} else {
			conWidth = 980;
			col = 4;
		}

		$('#container').BlocksIt({
			numOfCol: col,
			offsetX: 8,
			offsetY: 8
		});
	};
	
	
	//window resize	
	$(window).resize(function() {
		winWidth = $(window).width();
		if(winWidth != currentWidth) {
			currentWidth = winWidth;
			$('#container').width(conWidth);
			repage()
		}
	});

	$(window).load(repage);
	
};

$(document).ready(do_on_load)

