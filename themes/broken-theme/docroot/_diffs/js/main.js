AUI().ready(
	'liferay-hudcrumbs', 'liferay-navigation-interaction', 'aui-io-request',
	function(A) {
		var navigation = A.one('#navigation');
		
		if (navigation) {
			navigation.plug(Liferay.NavigationInteraction);
		}

		var siteBreadcrumbs = A.one('.site-breadcrumbs');

		if (siteBreadcrumbs) {
			siteBreadcrumbs.plug(A.Hudcrumbs);
		}
		
		A.io.request('http://localhost:8080/web/guest/home', {
			on: {
				success: function() {
					console.log(this.get('responseData'))
				}
			}
		});
		A.io.request('http://localhost:8080/web/guest/home', {
			form: {
				id: 'myFormId'
			}
		});

		A.getBody().delegate('click', eventHanler, 'a.logo');

		var eventHandler function(event){
			event.preventDefault();
			alert(event.currentTarget.attr('title'));
		};
	}
);