AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function() {
		var banner = document.getElementById('banner');
		var firstPortlet = document.querySelector('.portlet-boundary');

		if (firstPortlet.classList.contains('portlet-banner')) {

			function toggleBannerFill() {
				scrollTop = document.documentElement.scrollTop || document.body.scrollTop;
				console.log(scrollTop)
				banner.classList.toggle('filled', scrollTop > 150);
			}

			toggleBannerFill();
			document.onscroll = function() {
				toggleBannerFill();
			}
		}
		else {
			banner.classList.add('filled');
			firstPortlet.classList.add('first-portlet-margin')
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