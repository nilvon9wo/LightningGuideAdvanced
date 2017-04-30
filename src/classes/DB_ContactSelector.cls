public class DB_ContactSelector extends fflib_SObjectSelector {

    public List<Schema.SObjectField> getSObjectFieldList() {
        return new List<Schema.SObjectField>{
                Contact.id,
                Contact.name
        };
    }

    public Schema.SObjectType getSObjectType() {
        return Contact.sObjectType;
    }
    
    public List<Contact> selectList(Integer recordLimit) {
        return (List<Contact>) Database.query(
                newQueryFactory()
                        .setLimit(recordLimit)
                        .toSOQL()
        );
    }

    public List<Contact> selectByNameLikeness(String name, Integer recordLimit) {
    	String likeness = '%' + name + '%';
        return (List<Contact>) Database.query(
                newQueryFactory()
                		.setCondition('name LIKE :likeness')
                        .setLimit(recordLimit)
                        .toSOQL()
        );
    }
}