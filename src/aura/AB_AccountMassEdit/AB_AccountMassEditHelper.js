({ 
	findAccounts : function(component, helper) {
		component.find('ApexBridge').callApex({
			component: component,
			request: {
				controller: 'AB_AccountMassEditAuraCtrl',
				method: 'findAccounts',
				input: {
					howMany: 5,
					offset: 0,
					orderBy: 'Name'
				},
				pleaseWait: {
					type: 'Full',
					message: 'Finding accounts, please wait'
				},
				callBackMethod: function(request) {
					component.set('v.accountList', request.output)
				}
			}
		});
	},
	saveAccounts: function(component, helper) {
		component.find('ApexBridge').callApex({
			component: component,
			request: {
				controller: 'AB_AccountMassEditAuraCtrl',
				method: 'saveAccounts',
				records: component.get('v.accountList'),
				pleaseWait: {
					type: 'Full',
					message: 'Saving accounts, please wait'
				},
				callBackMethod: function(request) {
					helper.findAccounts(component, helper);
				}
			}
		});
	}
})