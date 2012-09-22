AUI().use('transition').ready(

	/*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/

	function(A) {
		console.log('hey');
		A.one('#main-content').all('div').each(
			function (e) {
				if (e.hasClass('portlet-boundary')) {
					e.all('menu').each(
						function(f) {
							if(f.hasClass('portlet-topper-toolbar')) {
								f.all('span').each(
									function (g) {
										if (g.hasClass('portlet-minimize-icon')) {

											g.one('a').on(
												'click',
												if (f.hasClass('portlet-content')) {
													console.log('worked');
													f.toggleClass('aui-helper-hidden');
													f.transition({
														duration: 1, 
														easing: 'ease-out',
														height: 0
													});

													f.toggleClass('aui-helper-hidden');
												}
											);
										}
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