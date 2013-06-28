function mainmenu(){
jQuery("#nav ul").css({display: "none"}); // Opera Fix
jQuery(" #nav li").hover(function(){
		jQuery(this).find('ul:first:hidden').css({visibility: "visible",display: "none"}).show(200);
		},function(){
		jQuery(this).find('ul:first').css({visibility: "hidden"});
		});
}

 jQuery(document).ready(function(){
 /*
	This function gets loaded when all the HTML, not including the portlets, is
	loaded.
	*/
	mainmenu();
});

/*
jQuery(document).ready(

	
	function() {
	}
);*/

Liferay.Portlet.ready(

	/*
	This function gets loaded after each and every portlet on the page.

	portletId: the current portlet's id
	jQueryObj: the jQuery wrapped object of the current portlet
	*/

	function(portletId, jQueryObj) {
	}
);

jQuery(document).last(

	/*
	This function gets loaded when everything, including the portlets, is on
	the page.
	*/

	function() {
	}
);
