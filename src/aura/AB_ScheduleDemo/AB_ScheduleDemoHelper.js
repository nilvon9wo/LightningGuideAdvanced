({
	createMeeting : function(component) {
		component.find('ApexBridge').callApex({
			component: component,
			request: {
				controller: 'AB_ScheduleDemoAuraCtrl',
				method: 'createMeeting',
				input: {
					demoTopic: component.get('v.demoTopic'),
					demoWhen: new Date(component.get('v.demoWhen')).toJSON(),
					demoDuration: component.get('v.demoDuration')
				}
			},
			callBackMethod: function(request) {
				alert('The event [' + request.output.Id + '] will remind you');
			}
		});
	}
})