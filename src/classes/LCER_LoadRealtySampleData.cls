public class LCER_LoadRealtySampleData {
	DB_GenericDml genericDml;
	
	public LCER_LoadRealtySampleData(DB_GenericDml genericDml) {
		this.genericDml = genericDml;
	}

	public LCER_LoadRealtySampleData() {
		this(new DB_GenericDml());
	}
	
	public static void load() {
		(new LCER_LoadRealtySampleData()).buildSampleData();
	} 
	
	public void buildSampleData() {
        List<Broker__c> brokerList = this.loadBrokers();
        List<Contact> contactList = this.loadContacts();
        
        List<Property__c> propertyList = this.loadProperties();
        List<PropertyActivityType__c> propertyActivityTypeList = this.loadPropertyActivityTypes();

        loadPropertyActivities(contactList, propertyList, propertyActivityTypeList);
        loadPropertyBrokers(brokerList, propertyList);
	}
	
	private List<Contact> loadContacts() {
        List<Contact> contactList = new List<Contact> {
	        new Contact(
	            ExternalId__c = '1',
				FirstName = 'Tanya',
	            LastName = 'Sharma',
	            Address__c = '18 Henry st',
	            City__c = 'Cambridge',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Medical Doctor',
	            MobilePhone = '617-985-6955',
	            HomePhone = '617-666-5555',
	            Email = 'tsharma@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/tanya_sharma.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '2',
				FirstName = 'Miriam',
	            LastName = 'Aupont',
	            Address__c = '56 Broad st',
	            City__c = 'Cambridge',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Software Engineer',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'maupont@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/miriam_aupont.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '3',
				FirstName = 'Jonathan',
	            LastName = 'Bradley',
	            Address__c = '52 Elm st',
	            City__c = 'Boston',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Architect',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'jbradley@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/jonathan_bradley.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '4',
				FirstName = 'Anup',
	            LastName = 'Gupta',
	            Address__c = '101 Massachusetts Avenue',
	            City__c = 'Boston',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Software Engineer',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'agupta@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/anup_gupta.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '5',
				FirstName = 'Kenneth',
	            LastName = 'Sato',
	            Address__c = '3 Oak st',
	            City__c = 'Boston',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Software Engineer',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'ksato@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/kenneth_sato.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '6',
				FirstName = 'James',
	            LastName = 'Kennedy',
	            Address__c = '56 Chestnut st',
	            City__c = 'Boston',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Software Engineer',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'jkennedy@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/james_kennedy.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '7',
				FirstName = 'Amy',
	            LastName = 'Taylor',
	            Address__c = '24 Belmont st',
	            City__c = 'Boston',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Software Engineer',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'ataylor@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/amy_taylor.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '8',
				FirstName = 'Olivia',
	            LastName = 'Green',
	            Address__c = '85 Boylston st',
	            City__c = 'Cambridge',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Software Engineer',
	            MobilePhone = '617-123-4567',
	            HomePhone = '617-987-6543',
	            Email = 'ogreen@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/olivia_green.jpg'
	        ),
	        new Contact(
	            ExternalId__c = '9',
				FirstName = 'Michael',
	            LastName = 'Jones',
	            Address__c = '184 Gloucester st',
	            City__c = 'Cambridge',
	            State__c = 'MA',
	            Zip__c = '01742',
	            Occupation__c = 'Medical Doctor',
	            MobilePhone = '617-985-6955',
	            HomePhone = '617-666-5555',
	            Email = 'mjones@fakemail.com',
	            LeadSource = 'Open House',
	            Category__c = 'Buyer',
	            Notes__c = 'Lorem Ipsum',
	            MemberSince__c = Date.valueOf('2015-01-15'),
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/michael_jones.jpg'
	        )        	
        };
        this.genericDml.doInsert(contactList);
        return contactList;
	}
	
	private List<Broker__c> loadBrokers() {
        List<Broker__c> brokerList = new List<Broker__c> {
			new Broker__c (
				ExternalId__c = '1',
				FirstName__c = 'Caroline',
				LastName__c = 'Kingsley',
				Title__c = 'Senior Broker',
				Address__c = '1 Federal street',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02180',
				MobilePhone__c = '617-985-6955',
				OfficePhone__c = '617-666-5555',
				Email__c = 'caroline@lightningrealty.com',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/caroline_kingsley.jpg'
			),
			new Broker__c (
				ExternalId__c = '2',
				FirstName__c = 'Brad',
				LastName__c = 'Moretti',
				Title__c = 'Senior Broker',
				Address__c = '1 Federal street',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02180',
				MobilePhone__c = '617-985-6955',
				OfficePhone__c = '617-666-5555',
				Email__c = 'brad@lightningrealty.com',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/people/brad_moretti.jpg'
			)
		};
        this.genericDml.doInsert(brokerList);
        return brokerList;
	}	

	private List<PropertyActivityType__c> loadPropertyActivityTypes() {
        List<PropertyActivityType__c> typeList = new List<PropertyActivityType__c> {
	        new PropertyActivityType__c (
				ExternalId__c = '1',
				Name = 'Listed'
	        ),
	        new PropertyActivityType__c (
				ExternalId__c = '2',
				Name = 'Open House'
	        ),
	        new PropertyActivityType__c (
				ExternalId__c = '3',
				Name = 'Inquiry'
	        ),
	        new PropertyActivityType__c (
				ExternalId__c = '4',
				Name = 'Price Reduction'
	        ),
	        new PropertyActivityType__c (
				ExternalId__c = '5',
				Name = 'Offer'
	        )
		};
        this.genericDml.doInsert(typeList);
        return typeList;
	}	
	
	private List<Property__c> loadProperties() {
        List<Property__c> propertyList = new List<Property__c> {
			new Property__c (
				ExternalId__c = '1',
				Address__c = '18 Henry st',
				City__c = 'Cambridge',
				State__c = 'MA',
				Zip__c = '01742',
				Price__c = 975000,
				Teaser__c = 'Stunning Victorian',
				Bedrooms__c = 4,
				Bathrooms__c = 3,
				Size__c = '3800',
				LotSize__c = '7',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house01.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '2',
				Address__c = '24 Pearl st',
				City__c = 'Cambridge',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 1200000,
				Teaser__c = 'Ultimate Sophistication',
				Bedrooms__c = 5,
				Bathrooms__c = 4,
				Size__c = '4000',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house02.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '3',
				Address__c = '72 Francis st',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 825000,
				Teaser__c = 'Modern City Living',
				Bedrooms__c = 5,
				Bathrooms__c = 4,
				Size__c = '4000',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house03.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '4',
				Address__c = '32 Prince st',
				City__c = 'Cambridge',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 930000,
				Teaser__c = 'Stunning Colonial',
				Bedrooms__c = 5,
				Bathrooms__c = 4,
				Size__c = '4000',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house04.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '5',
				Address__c = '110 Baxter street',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 850000,
				Teaser__c = 'Waterfront in the City',
				Bedrooms__c = 3,
				Bathrooms__c = 2,
				Size__c = '4000',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house05.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '6',
				Address__c = '448 Hanover st',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 725000,
				Teaser__c = 'Quiet Retreat',
				Bedrooms__c = 4,
				Bathrooms__c = 2,
				Size__c = '4000',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house06.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '7',
				Address__c = '127 Endicott st',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 450000,
				Teaser__c = 'City Living',
				Bedrooms__c = 3,
				Bathrooms__c = 1,
				Size__c = '1500',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house07.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '8',
				Address__c = '48 Brattle st',
				City__c = 'Cambridge',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 450000,
				Teaser__c = 'Heart of Harvard Square',
				Bedrooms__c = 5,
				Bathrooms__c = 4,
				Size__c = '2000',
				LotSize__c = '8',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house10.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '9',
				Address__c = '121 Harborwalk',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 450000,
				Teaser__c = 'Seaport District Retreat',
				Bedrooms__c = 3,
				Bathrooms__c = 3,
				Size__c = '1500',
				LotSize__c = '2',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house09.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			),
			new Property__c (
				ExternalId__c = '10',
				Address__c = '640 Harrison Ave',
				City__c = 'Boston',
				State__c = 'MA',
				Zip__c = '02420',
				Price__c = 650000,
				Teaser__c = 'City Living',
				Bedrooms__c = 2,
				Bathrooms__c = 2,
				Size__c = '950',
				LotSize__c = '0',
				Pic__c = 'https =//s3-us-west-1.amazonaws.com/sfdc-demo/realty/house08.jpg',
				Description__c = 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.'
			)
		};
        this.genericDml.doInsert(propertyList);
        return propertyList;
	}	

	private List<PropertyActivity__c> loadPropertyActivities(
	        	List<Contact> contactList,  
	        	List<Property__c> propertyList, 
	        	List<PropertyActivityType__c> propertyActivityTypeList
			) {
        List<PropertyActivity__c> propertyActivityList = new List<PropertyActivity__c> {
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '1'),
				Contact__c =  this.findFromExternalId(contactList, '1'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 975000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '2'),
				Contact__c =  this.findFromExternalId(contactList, '2'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 1200000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '3'),
				Contact__c =  this.findFromExternalId(contactList, '3'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 825000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '4'),
				Contact__c =  this.findFromExternalId(contactList, '4'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 930000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '5'),
				Contact__c =  this.findFromExternalId(contactList, '5'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 850000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '6'),
				Contact__c =  this.findFromExternalId(contactList, '6'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 725000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '7'),
				Contact__c =  this.findFromExternalId(contactList, '7'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '8'),
				Contact__c =  this.findFromExternalId(contactList, '8'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '9'),
				Contact__c =  this.findFromExternalId(contactList, '9'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '9'),
				Contact__c =  this.findFromExternalId(contactList, '9'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '1'),
				Comment__c = 'Officially on the market as of today',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-12')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '1'),
				Contact__c =  this.findFromExternalId(contactList, '1'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 975000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '2'),
				Contact__c =  this.findFromExternalId(contactList, '2'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 1200000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '3'),
				Contact__c =  this.findFromExternalId(contactList, '3'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 825000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '4'),
				Contact__c =  this.findFromExternalId(contactList, '4'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 930000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '5'),
				Contact__c =  this.findFromExternalId(contactList, '5'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 850000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '6'),
				Contact__c =  this.findFromExternalId(contactList, '6'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 725000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '7'),
				Contact__c =  this.findFromExternalId(contactList, '7'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '8'),
				Contact__c =  this.findFromExternalId(contactList, '8'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '9'),
				Contact__c =  this.findFromExternalId(contactList, '9'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			),
			new PropertyActivity__c (
				Property__c = this.findFromExternalId(propertyList, '9'),
				Contact__c =  this.findFromExternalId(contactList, '9'),
				ActivityType__c =  this.findFromExternalId(propertyActivityTypeList, '2'),
				Comment__c = 'First open house',
				Price__c = 450000,
				ActivityDate__c = Date.valueOf('2015-07-19')
			)
        };
        this.genericDml.doInsert(propertyActivityList);
        return propertyActivityList;
	}
	
	private List<PropertyBroker__c> loadPropertyBrokers(
	        	List<Broker__c> brokerList,  
	        	List<Property__c> propertyList
			) {
        List<PropertyBroker__c> propertyBrokerList = new List<PropertyBroker__c> {
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '1'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '2'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '3'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '3'),
				Broker__c =  this.findFromExternalId(brokerList, '2')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '4'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '5'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '5'),
				Broker__c =  this.findFromExternalId(brokerList, '2')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '6'),
				Broker__c =  this.findFromExternalId(brokerList, '2')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '7'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '7'),
				Broker__c =  this.findFromExternalId(brokerList, '2')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '8'),
				Broker__c =  this.findFromExternalId(brokerList, '2')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '9'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '10'),
				Broker__c =  this.findFromExternalId(brokerList, '1')
			),
			new PropertyBroker__c(
				Property__c = this.findFromExternalId(propertyList, '10'),
				Broker__c =  this.findFromExternalId(brokerList, '2')
			)
		};
		this.genericDml.doInsert(propertyBrokerList);
        return propertyBrokerList;
	}
	
	private Id findFromExternalId (List<SObject> sObjectList, String externalId) {
		for (SObject sObj : sObjectList) {
			if (sObj.get('ExternalId__c') == externalId) {
				return sObj.id;
			}
		}
		return null;
	}
}