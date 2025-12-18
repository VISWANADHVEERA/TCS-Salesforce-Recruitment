public with sharing class CandidateController {
    @AuraEnabled(cacheable=true)
    public static List<Candidate__c> search(String name) {
        String key = '%';
        if (name != null && name.trim().length() > 0) {
            key = '%' + String.escapeSingleQuotes(name.trim()) + '%';
        }
        return [SELECT Id, Name FROM Candidate__c WHERE Name LIKE :key LIMIT 50];
    }
}
