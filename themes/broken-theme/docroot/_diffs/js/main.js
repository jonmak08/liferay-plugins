AUI().ready(
	'liferay-hudcrumbs', 'liferay-navigation-interaction', 'aui-dialog', 'aui-overlay-manager', 'aui-io-request', 'io-plugin', 'aui-dialog-iframe',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('.site-breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		var eventHandler = function(event) {
			event.preventDefault();
			alert(event.currentTarget.attr('title'));
		};

		A.getBody().delegate('click', eventHandler, 'a.logo');

		A.one('#sign-in').on(
			'click',
			function(event) {
				event.preventDefault();

				var dialog1 = new A.Dialog({
				    title: 'Sign-in',
				    centered: true,
				    modal: true,
				    width: 500,
				    height: 300,
				}).render();

				dialog1.plug(
				A.Plugin.DialogIframe,
					{
						uri: '',
						method: 'POST',
					}
				);
			}
		);
	}
);