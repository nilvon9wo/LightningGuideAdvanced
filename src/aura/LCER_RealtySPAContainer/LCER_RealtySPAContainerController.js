({
	sendMessage : function(component, event, helper) {
		component.find('ReactApp').message({
			name: 'General',
			value: component.get('v.messageToSend')
		});
	},
	
	handleMessage: function(component, event, helper) {
		var payload = message.payload;
		
		switch (payload.name) {
			case 'General': return helper.handleGeneralMessage(component, payload.value);			
			case 'Foo': return helper.handleFooMessage(component, payload.value);			
		}
	},
	
	handleError: function(component, event, helper) {
		var error = event;
		component.set('v.errorMessage', error);		
	}
})