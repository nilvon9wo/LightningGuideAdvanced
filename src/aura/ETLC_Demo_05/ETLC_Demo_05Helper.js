({
    createAccounts : function(component, helper) {
        var apexBridge = component.find("ETLC_ApexBridge");
        apexBridge.makeRecords({
            sObjectType: "Account",
            records: [
                {
                    Name: "Acme Inc. #1",
                    Description: "Account created in JavaScript"
                },
                {
                    Name: "Acme Inc. #2",
                    Description: "Another account created in JavaScript"
                }
            ],
            callBackMethod: function(records) {
                helper.insertAccounts(component, records);
            }
        });
    },
    insertAccounts : function(component, records) {
        var apexBridge = component.find("ETLC_ApexBridge");
        apexBridge.callApex({
            component: component,
            request: {
                controller: "ETLC_DEMO_05",
                method: "insertAccounts",
                records: records
            },
            pleaseWait: { type: "Toast" },
            callBackMethod: function(request) {
                console.log(request.output);
            }
        });
    }
})