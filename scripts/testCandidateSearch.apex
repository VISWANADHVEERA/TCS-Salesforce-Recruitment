List<Candidate__c> results = CandidateController.search('Test');
System.debug('SEARCH_COUNT:' + results.size());
for (Candidate__c c : results) {
    System.debug('FOUND_ID:' + c.Id + ' NAME:' + c.Name);
}
