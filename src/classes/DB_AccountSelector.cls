public class DB_AccountSelector  extends fflib_SObjectSelector {
	DB_SecureSelector secureSelector;
	
	public DB_AccountSelector(DB_SecureSelector secureSelector) {
		this.secureSelector = secureSelector;
	}

	public DB_AccountSelector() {
		this(new DB_SecureSelector());
	}

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
                Account.id,
                Account.name,
                Account.lastModifiedDate
        };
    } 

    public Schema.SObjectType getSObjectType() {
        return Account.sObjectType;
    }
    
    public List<Account> selectFor(ETLC_ApexBridge_Request request) {
    	fflib_QueryFactory queryFactory = newQueryFactory();
    	
    	if (request.getInputValue('orderBy') != null) {
    		String fieldName = String.valueOf(request.getInputValue('orderBy'));
    		queryFactory.addOrdering(fieldName, fflib_QueryFactory.SortOrder.ASCENDING);
    	}
    	
    	if (request.getInputValue('howMany') != null) {
    		queryFactory.setLimit(Integer.valueOf(request.getInputValue('howMany')));
    	}

    	if (request.getInputValue('offset') != null) {
    		queryFactory.setOffset(Integer.valueOf(request.getInputValue('offset')));
    	}
    	
        return this.secureSelector.query(queryFactory.toSOQL());
    }
}