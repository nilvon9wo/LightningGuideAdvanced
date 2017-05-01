public with sharing class ETLC_DEMO_05 extends ETLC_ApexBridge_Abstract {
    public override Object handleRequest(ETLC_ApexBridge_Request request) {
        if (request.method == 'insertAccounts') {
            return insertAccounts(request);
        }
        throw new ETLC_ApexBridge_InvalidRequest_Exception();
    }
    private List<Account> insertAccounts(ETLC_ApexBridge_Request request) {
        List<Account> accounts = request.records;
        for (Integer i = 0; i < accounts.size(); i++) {
            accounts[i].NumberOfEmployees = 100 + (i * 10);
        }
        ETLC_SecuredDB.performDML(ETLC_SecuredDB.Operation.Inserting, accounts);
        return accounts;
    }
}