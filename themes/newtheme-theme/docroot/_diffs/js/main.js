AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {

		AUI().use(
			'aui-node',
			'event',
			'dom',
			function(A) {

				var ADOM = A.DOM;

				var Win = A.getWin();

				var latestScrollY = 0;
				var ticking = false;						
				
				A.Event.attach('scroll', onScroll, Win);

				function setVendorStyle(element, property, value) {
					var styles = {};

					styles['Moz' + property] = value;
					styles['ms' + property] = value;
					styles['o' + property] = value;
					styles['webkit' + property] = value;

					element.setStyles(styles);
				}

				function onScroll() {
					latestScrollY = ADOM.docScrollY();
					check();
				}

				function check() {
					if(!ticking) {
						requestAnimationFrame(update);
					}
					ticking = true;
				}

				function update() { 

					ticking = false;

					var currentScrollY = latestScrollY;

					var elements = A.all('.carousel-item-active');

					elements.each(
						function(element) {
							var elementDOMNode = element.getDOMNode();

							if (ADOM.inViewportRegion(elementDOMNode, false, null)) {	
								var elementHeight = element.innerHeight();
								var elementY = element.getY();
								
								var image = element.one('.carousel-image');
								var imageHeight = elementHeight;
								
								if (image) {
									imageHeight = image.height();
								}

								var nextElements = element.siblings('.carousel-item');
									
								var elementBottomY = (elementY + elementHeight);
								var imageExcess = (elementHeight - imageHeight);
								var remainingY = (elementBottomY - currentScrollY);
								var remainderPercentage = (1 - remainingY/elementBottomY);
									
								var offset = (imageExcess * remainderPercentage);
								
								setVendorStyle(image, "Transform", "translateY(" + offset + "px)");

								nextElements.each(
									function(element) {
										setVendorStyle(element.one('.carousel-image'), "Transform", "translateY(" + offset + "px)"); 
									}
								);
							}
						}
					);
				}
			}
		);
	}
);

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	node: the Alloy Node object of the current portlet
	*/

	function(portletId, node) {
	}
);



Liferay.on(
	'allPortletsReady',

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
	}
);




