var do_on_load;
var repage;
do_on_load = function() {

	repage =  function() {
		$('#container').BlocksIt({
			numOfCol: 3,
			offsetX: 8,
			offsetY: 8
		});
	};
	
	
	//window resize
	var currentWidth = 760;
	$(window).resize(function() {
		var winWidth = $(window).width();
		var conWidth;
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
			conWidth = 760;
			col = 4;
		}
		
		if(conWidth != currentWidth) {
			currentWidth = conWidth;
			$('#container').width(conWidth);
			$('#container').BlocksIt({
				numOfCol: col,
				offsetX: 8,
				offsetY: 8
			});
		}
	});

	$(window).load(repage)
	$(window).on('page:load', repage);
};

$(document).ready(do_on_load)
$(window).on('page:change', do_on_load)
