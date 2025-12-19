List<Candidate__c> results = CandidateController.search('Teja');
System.debug('SEARCH_COUNT:' + results.size());
for (Candidate__c c : results) {
    System.debug('FOUND_ID:' + c.Id + ' NAME:' + c.Name + ' EMAIL:' + c.Email__c);
}
