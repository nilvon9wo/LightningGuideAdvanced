({
	areYouThere : function(component) {
		component.find('ApexBridge').callApex({
			component: component,
			request: {
				controller: 'AB_HelloWorldAuraCtrl',
				method: 'areYouThere'
			},
			callBackMethod: function(request) {
				alert(request.output);
			}
		});
	},
	
	greet : function(component) {
		component.find('ApexBridge').callApex({
			component: component,
			request: {
				controller: 'AB_HelloWorldAuraCtrl',
				method: 'greet',
				input: {
					personName: component.get('v.yourName')
				}
			},
			callBackMethod: function(request) {
				alert(request.output);
			}
		});
	}
})