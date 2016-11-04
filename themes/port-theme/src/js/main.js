AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
		var banner = jQuery('#banner');
		var doc = jQuery(document);
		var firstPortlet = jQuery('#content').find('.portlet-boundary').first();

		function toggleBannerFill() {
			banner.toggleClass('filled', doc.scrollTop() > 150);
		}

		if (firstPortlet.hasClass('portlet-banner')) {

			toggleBannerFill();

			doc.scroll(
				function() {
					toggleBannerFill();
				}
			);
		}
		else {
			banner.addClass('filled');
			firstPortlet.addClass('first-portlet-margin');
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