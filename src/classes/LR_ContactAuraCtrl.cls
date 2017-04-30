public with sharing class LR_ContactAuraCtrl {
	DB_ContactSelector contactSelector;

	private static final Integer RECORD_LIMIT = 20;
	
	public LR_ContactAuraCtrl(DB_ContactSelector contactSelector) {
		this.contactSelector = contactSelector;
	}
	
	public LR_ContactAuraCtrl() {
		this(new DB_ContactSelector());
	}
	
    @AuraEnabled
    public static List<Contact> findAll() {
    	return (new LR_ContactAuraCtrl()).selectList();
    }
    
    @testVisible
    private List<Contact> selectList() {
    	return this.contactSelector.selectList(RECORD_LIMIT);
    }

    @AuraEnabled
    public static List<Contact> findByName(String name) {
    	return (new LR_ContactAuraCtrl()).selectByName(name);
    }
    
    @testVisible
    private List<Contact> selectByName(String name) {
    	return this.contactSelector.selectByNameLikeness(name, RECORD_LIMIT);
    }
}