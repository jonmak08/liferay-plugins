YUI({

	gallery: 'gallery-2011.04.20-13-04' // Last Gallery Build of this module.

}).use('gallery-yui-slideshow', function(Y) {

	var slideshow = new Y.Slideshow({ 
		srcNode: '#slideshow',
		nextButton: '#nextButton',
		previousButton: '#prevButton',
		autoplay: true,
		pauseOnChange: false,
		interval: 6
	});

	slideshow.render();

});