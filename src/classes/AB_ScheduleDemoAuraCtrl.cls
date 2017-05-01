public class AB_ScheduleDemoAuraCtrl extends ETLC_ApexBridge_Abstract {
	DB_SecureDml secureDml;
	
	public AB_ScheduleDemoAuraCtrl(DB_SecureDml secureDml) {
		this.secureDml = secureDml;
	}

	public AB_ScheduleDemoAuraCtrl() {
		this(new DB_SecureDml());
	}
		
	public override Object handleRequest(ETLC_ApexBridge_Request request) {
		if (request.method == 'createMeeting') {
			return createMeeting(request);
		}
		throw new ETLC_ApexBridge_InvalidRequest_Exception();
	}
    
    private Event createMeeting(ETLC_ApexBridge_Request request) {
    	Event event = new Event(
    		subject = String.valueOf(request.getInputValue('demoTopic')),
    		activityDateTime = DateTime.valueOf(request.getInputValue('demoWhen')),
    		durationInMinutes = Integer.valueOf(request.getInputValue('demoDuration'))
    	);
    	this.secureDml.doInsert(new List<Event>{event});
    	return event;
    }
}