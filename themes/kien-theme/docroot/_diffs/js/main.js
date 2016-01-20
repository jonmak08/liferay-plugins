AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/
	'aui-base',
	'event-hover',
	'node-event-delegate',
	'transition',

	function(A) {
		var childMenuExists = A.one('.child-menu');
		var parentOfChildExists = A.one('.drop-menu');

		if (childMenuExists && parentOfChildExists) {
			A.one('.child-menu').hide(true);

			A.one('.drop-menu').on('hover', over, out);
		}

		function over() {
			this.one('.child-menu').show(true);
		}

		function out() {
			this.one('.child-menu').hide(true);
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
