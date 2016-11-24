AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
		var $banner = AUI.$('#banner');
		var $document = AUI.$(document);
		var $firstPortlet = AUI.$('#content').find('.portlet-boundary').first();

		var $mainContent = AUI.$('#main-content').attr('class');
		var singleColumnFormat = $mainContent.indexOf('column-1') >= 0 || $mainContent.indexOf('columns-1') >= 0;

		function toggleBannerFill() {
			$banner.toggleClass('filled', $document.scrollTop() > 150);
		}

		if ($firstPortlet.hasClass('portlet-banner') && singleColumnFormat) {

			toggleBannerFill();

			$document.scroll(
				function() {
					toggleBannerFill();
				}
			);
		}
		else {
			$banner.addClass('filled');
			AUI.$('#content').addClass('content-under-header');
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