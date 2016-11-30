AUI().ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/
	'aui-base',
	'event-hover',
	'node-event-delegate',
	'transition',

	function(Y) {
		Y.one('.child-menu').hide(true);
		function over() {
			this.one('.child-menu').show(true);
		}
		function out() {
			this.one('.child-menu').hide(true);
		}
		Y.one('.dropMenu').on('hover', over, out);
	}

	//,
	// function(Y) {
	// 	var activeMenu = Y.one('li.selected');
	// 	var menuWithChild = activeMenu.ancestor('li');
	// 	if (menuWithChild.getAttribute('class') === 'dropdown') {
	// 		var menuWithChildClass = menuWithChild.getAttribute('class');
	// 		menuWithChildClass += ' selected';
	// 		menuWithChild.setAttribute('class', menuWithChildClass);
	// 	}
	// }
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
