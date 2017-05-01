public class DB_SecureDml {
    public void doInsert(List<SObject> sObjectList) {
    	ETLC_SecuredDB.performDML(ETLC_SecuredDB.Operation.inserting, sObjectList);
    }
    public void doUpdate(List<SObject> sObjectList) {
    	ETLC_SecuredDB.performDML(ETLC_SecuredDB.Operation.updating, sObjectList);
    }
}