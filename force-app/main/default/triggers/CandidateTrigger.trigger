trigger CandidateTrigger on Candidate__c (before insert) {
    if (Trigger.isBefore && Trigger.isInsert) {
        CandidateTriggerHandler.preventDuplicateCandidates(Trigger.New);
    }
}
