AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function(A) {
		var toggle = false;

		A.one('.btn-navbar').on('click', function() {
			if(!toggle) {
				A.one('#collapse-content').setStyles({height:'auto', overflow:'visible'})
				toggle = true;
			}
			else {
				A.one('#collapse-content').removeAttribute('style');
				toggle = false;
			}
		})
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