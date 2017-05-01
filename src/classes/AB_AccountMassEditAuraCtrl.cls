public with sharing class AB_AccountMassEditAuraCtrl extends ETLC_ApexBridge_Abstract {
	DB_AccountSelector accountSelector; 
	DB_SecureDml secureDml;
	 
	public AB_AccountMassEditAuraCtrl(DB_AccountSelector accountSelector, DB_SecureDml secureDml) {
		this.accountSelector = accountSelector;
		this.secureDml = secureDml;
	}

	public AB_AccountMassEditAuraCtrl() {
		this(new DB_AccountSelector(), new DB_SecureDml());
	}
	
    public override Object handleRequest(ETLC_ApexBridge_Request request) {
    	if (request.method == 'findAccounts') {
    		return this.findAccounts(request);
    	} else if (request.method == 'saveAccounts') {
    		return this.saveAccounts(request);
    	}
    	throw new ETLC_ApexBridge_InvalidRequest_Exception();
    }
    
    private List<Account> findAccounts(ETLC_ApexBridge_Request request) {
    	return this.accountSelector.selectFor(request);
    }
    
    private List<Account> saveAccounts(ETLC_ApexBridge_Request request) {
    	List<Account> accountList = request.records;
    	this.secureDml.doUpdate(accountList); 
    	return accountList;
    }
}