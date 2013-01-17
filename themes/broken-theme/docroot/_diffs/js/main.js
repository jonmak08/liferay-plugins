AUI().ready(
	'liferay-hudcrumbs', 'liferay-navigation-interaction', 'aui-dialog', 'aui-io-request',
	function(A) {
		var navigation = A.one('#navigation');

		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('.site-breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}

		var signInDialog = function(event) {
			event.preventDefault();
			var href = event.currentTarget.get('href');

			var signInDialog = new A.Dialog({
				align: {
					node: 'a#sign-in',
					points: [ 'tr', 'br' ]
				},
				constrain2view: true,
				resizable: false,
				title: 'Sign-in Form'
			});

			A.io.request(href, {
				on: {
					success: function(event, id, xhr) {
						var ajaxContent = A.Node.create('<div></div>').html(this.get('responseData'));
						var ajaxSignIn = ajaxContent.one('#portlet_58');
						signInDialog.set('bodyContent', ajaxSignIn).render();
					}
			  }
			});
		};

		A.one('body').delegate('click', signInDialog, 'a#sign-in');
	}
);