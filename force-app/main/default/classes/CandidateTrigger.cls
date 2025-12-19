public with sharing class CandidateTriggerHandler {
    public static void preventDuplicateCandidates(List<Candidate__c> newList) {
        Set<String> emailSet = new Set<String>();
        for(Candidate__c cand : newList) {
            emailSet.add(cand.Email__c);
        }
        
        List<Candidate__c> existingCandidates = [SELECT Email__c FROM Candidate__c WHERE Email__c IN :emailSet];
        
        Set<String> existingEmails = new Set<String>();
        for (Candidate__c c : existingCandidates) {
            existingEmails.add(c.Email__c);
        }
        
        for(Candidate__c cand : newList) {
            if(existingEmails.contains(cand.Email__c)) {
                cand.Email__c.addError('A candidate with this email already exists in the system.');
            }
        }
    }
}