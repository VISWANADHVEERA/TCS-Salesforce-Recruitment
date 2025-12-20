import { LightningElement, track } from 'lwc';
import searchCandidates from '@salesforce/apex/CandidateController.search';
import { NavigationMixin } from 'lightning/navigation';

export default class CandidateSearch extends NavigationMixin(LightningElement) {
    @track searchKey = '';
    @track candidates;

    handleKeyChange(event) {
        this.searchKey = event.target.value;
        searchCandidates({ name: this.searchKey })
            .then(result => { this.candidates = result; })
            .catch(error => { console.error(error); });
    }

    handleCreate() {
        this[NavigationMixin.Navigate]({
            type: 'standard__objectPage',
            attributes: {
                objectApiName: 'Candidate__c',
                actionName: 'new'
            }
        });
    }
}