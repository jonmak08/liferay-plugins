YUI({

	gallery: 'gallery-2011.04.20-13-04' // Last Gallery Build of this module.

}).use('gallery-yui-slideshow', function(Y) {

	var slideshow = new Y.Slideshow({
		autoplay: true,
		interval: 6,
		nextButton: '#nextButton',
		pauseOnChange: false,
		previousButton: '#prevButton',
		srcNode: '#slideshow',
	}).render();
});