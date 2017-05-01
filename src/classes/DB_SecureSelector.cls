public with sharing class DB_SecureSelector {
    public List<SObject> query (String soqlQuery) {
    	return ETLC_SecuredDB.query(soqlQuery);
    }
}