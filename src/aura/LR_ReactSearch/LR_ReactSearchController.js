({
	reactInit: function(component, event, helper) {
		var dataService = {
			findAll: $A.getCallback(handleFindAllResponse),
			findByName: $A.getCallback(handleFindByNameResponse)  
		}
		
		var container = component.find('container').getElement();
		reactSearch.init(container, dataService);
		
		function handleFindAllResponse(callback){
			helper.handleContactResponse(component, 'findAll', callback);
		}
		
		function handleFindByNameResponse(name, callback){
			var actionParams = {name: name}; 
			helper.handleContactResponse(component, 'findByName', callback, actionParams);
		}
	}
})