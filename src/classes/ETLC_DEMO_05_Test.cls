@isTest
public class ETLC_DEMO_05_Test {
    static String controller = 'ETLC_DEMO_05';
    static ETLC_ApexBridge_BaseTests base = new ETLC_ApexBridge_BaseTests();
    @isTest public static void invalidMethodTest() { base.invalidMethodTest(controller); }
    
    @isTest
    public static void saveAccountsTest() {
        List<Account> acs = new List<Account>();
        for (Integer i = 0; i < 10; i++) {
            acs.add(new Account(Name='ELTOROIT #' + i));
        }
        ETLC_ApexBridge_Request requestOut = base.testHelperRecords(controller, 'insertAccounts', acs);
        List<Account> acs2 = (List<Account>) JSON.deserialize(requestOut.output, List<Account>.class);
		System.assertEquals(acs.size(), acs2.size());
    }
}