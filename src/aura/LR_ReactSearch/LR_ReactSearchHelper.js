({
	handleContactResponse : function (component, serverMethodName, callback, actionParams) {
		var action = component.get('c.' + serverMethodName);
		if (actionParams) {
			action.setParams(actionParams);	
		}

		action.setCallback(this, function(response) {
			callback(response.getReturnValue());
		});
		$A.enqueueAction(action, false);
	}
})