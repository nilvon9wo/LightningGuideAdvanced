public with sharing class ETLC_DEMO_04 extends ETLC_ApexBridge_Abstract {
    public override Object handleRequest(ETLC_ApexBridge_Request request) {
        if (request.method == 'pleaseWait') {
            pleaseWait(request);
            return null;
        }
        throw new ETLC_ApexBridge_InvalidRequest_Exception();
    }
    
    private void pleaseWait(ETLC_ApexBridge_Request request) {
        System.debug(request);
    }
}