@isTest
public class ETLC_DEMO_04_Test {
    static String controller = 'ETLC_DEMO_04';
    static ETLC_ApexBridge_BaseTests base = new ETLC_ApexBridge_BaseTests();
    @isTest public static void invalidMethodTest() { base.invalidMethodTest(controller); }
    
	@isTest
    public static void pleaseWaitTest() {
        ETLC_ApexBridge_Request requestOut = base.testHelper(controller, 'pleaseWait');
        System.assertEquals('""', requestOut.output);
    }
}