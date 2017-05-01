({
	showMessage : function(component, event, helper) {
		helper.showMessage(component);
	},
    pleaseWaitEvent : function(component, event, helper) {
        var params = event.getParams();
        console.log((params.isShow ? "Show: " : "Hide: ") + params.message);
    }
})