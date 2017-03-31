AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
		var $document = $(document);
		var $firstPortlet = $('.portlet-boundary').first();
		var $banner = $('#banner');

		/* Gives the banner a solid background if the first portlet is not an image */
		if (!portletIsBanner($firstPortlet)) {

			$banner.addClass('filled');
		} else {
			changeHeaderFillOnScroll();
		}

		function portletIsBanner(selector) {
			return selector.hasClass('portlet-banner');
		}

		function changeHeaderFillOnScroll() {
			$document.scroll(function() {
				if ($document.scrollTop() > 150) {
					$banner.addClass('filled');
				} else {
					$banner.removeClass('filled');
				};
			});
		}

		/* Fills the banner if the document is loaded from the middle of the page */
		if ($(document).scrollTop() > 150) {
			$banner.addClass('filled');
		}
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