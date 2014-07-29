AUI().ready(
	'liferay-hudcrumbs',
	'liferay-navigation-interaction',
	'liferay-sign-in-modal',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('#breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		var signIn = A.one('li.sign-in a');

		if (signIn && signIn.getData('redirect') !== 'true') {
			signIn.plug(Liferay.SignInModal);
		}
	}
);


// Scroll to top button

$(function() {
	$(document).on(
		'scroll',
		function() {
			if ($(window).scrollTop() > 100) {
					$('.scroll-top-wrapper').addClass('show');
			}
			else {
					$('.scroll-top-wrapper').removeClass('show');
			}
		}
	);

	$('.scroll-top-wrapper').on('click', scrollToTop);
});

function scrollToTop() {
	element = $('body');

	offset = element.offset();
	offsetTop = offset.top;

	verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;

	$('html, body').animate(
		{scrollTop: offsetTop},
		500,
		'linear'
	);
}

