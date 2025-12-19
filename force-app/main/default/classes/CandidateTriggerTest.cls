@isTest
public class CandidateTriggerTest {
    @isTest
    static void testDuplicatePrevention() {
        // 1. Create an initial candidate
        Candidate__c c1 = new Candidate__c(Name='John Doe', Email__c='john@example.com');
        insert c1;
        
        // 2. Try to create another candidate with the SAME email
        Candidate__c c2 = new Candidate__c(Name='Duplicate John', Email__c='john@example.com');
        
        Test.startTest();
        try {
            insert c2;
        } catch (Exception e) {
            // 3. Verify the error message was triggered
            System.assert(e.getMessage().contains('A candidate with this email already exists'));
        }
        Test.stopTest();
    }


    @isTest
    static void testValidCandidateInsertionWithExistingDuplicates() {
        // 1. Create an initial candidate
        Candidate__c c1 = new Candidate__c(Name='John Doe', Email__c='john@example.com');
        insert c1;

        // 2. Create a DIFFERENT candidate with a UNIQUE email
        Candidate__c c2 = new Candidate__c(Name='Jane Doe', Email__c='jane@example.com');

        Test.startTest();
        insert c2;
        Test.stopTest();

        // 3. Verify c2 was inserted successfully
        Candidate__c retrievedC2 = [SELECT Id FROM Candidate__c WHERE Id = :c2.Id];
        System.assertNotEquals(null, retrievedC2);
    }
}