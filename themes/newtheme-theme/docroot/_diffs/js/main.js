AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {

		AUI().use(
			'event',
			'aui-node',
			'dom',
			function(A) {

				var dom = A.DOM;
				var latestScrollY = 0;
				var ticking = false;
				var window = A.getWin();						
				
				A.Event.attach('scroll', onScroll, window);

				function setVendorStyle(element, property, value) {
					var styles = {};

					styles['Moz' + property] = value;
					styles['ms' + property] = value;
					styles['o' + property] = value;
					styles['webkit' + property] = value;

					element.setStyles(styles);
				}

				function onScroll() { //stores scroll
					latestScrollY = dom.docScrollY();
					check();
				}

				function check() { //prevents parallel instances
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
						function(element) {  //loops through images to be animated
							var elementNode = element.getDOMNode();

							if(dom.inViewportRegion(elementNode, false, null)) {	
								var elementHeight = element.innerHeight();
								var elementY = element.getY();
								var image = element.one('.carousel-image');
								var imageHeight = image.height();
								var nextElements = element.siblings('.carousel-item');
									
								var elementBottom = elementY + elementHeight;
								var imageExcess = elementHeight - imageHeight;
								var remainingY = (elementBottom - currentScrollY)/(elementBottom);
									
								var offset = (imageExcess * (1 - remainingY)); //calculates offset
								
								setVendorStyle(image, "Transform", "translateY(" + offset + "px)"); //positions current image

								nextElements.each(
									function(element) { 	//sets position of sibling images
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




