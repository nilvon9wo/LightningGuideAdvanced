({
    showMessage : function(component) {
        var apexBridge = component.find("ApexBridge");
        var type = component.get("v.messageType");
        var message = component.get("v.message");
        
        apexBridge.callApex({
            component: component,
            request: {
                controller: "ETLC_DEMO_04",
                method: "pleaseWait"
            },
            pleaseWait: {
                type: type,
                message: message
            },
            callBackMethod: function (request) {
                // console.log(request.output);
            }
        });
    }
})