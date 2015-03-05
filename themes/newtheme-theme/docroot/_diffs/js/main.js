AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {

		AUI().use('event', 'node', 'aui-node', 'dom', function(A) {

			var window = A.one('window');
			var dom = A.DOM;
			var latestScrollY = 0;
			var ticking = false;
			
			A.Event.attach('scroll', onScroll, window);

			function setVendor (element, property, value) { //sets vendor prefixes
					element.style["webkit" + property] = value;
					element.style["Moz" + property] = value;
					element.style["ms" + property] = value;
					element.style["O" + property] = value;
			}

			function onScroll() {
				latestScrollY = dom.docScrollY();
				check();
			}

			function check() { //checks if a request is in progress
				if(!ticking) {
					requestAnimationFrame(update);
				}
				ticking = true;
			}

			function update() { 

				ticking = false;
				var currentScrollY = latestScrollY;
				var elements = A.all('.carousel-item-active');

				elements.each(function(element) {  //loops through images to be animated
					if(dom.inViewportRegion(element.getDOMNode(), false, null)) {	
						var image = element.getDOMNode().children.item(0);
						var domHeight = dom.winHeight();
						var imageHeight = image.offsetHeight;
						var elementHeight = element.innerHeight();
						var elementY = element.getY();
						var offset = ((elementHeight - imageHeight) * (1 - ((elementHeight + elementY - currentScrollY)/(elementHeight + elementY)))); //calculates offset
						
						setVendor(image, "Transform", "translateY(" + offset + "px)");
						
						var nextElements = element.siblings('.carousel-item');
						
						nextElements.each(function(element) { 	//sets position of sibling images
							setVendor(element.getDOMNode().children.item(0), "Transform", "translateY(" + offset + "px)"); 
						});
					}
				});
			}
		});
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




