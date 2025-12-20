import { LightningElement, track } from 'lwc';
import searchCandidates from '@salesforce/apex/CandidateController.search';
import { NavigationMixin } from 'lightning/navigation';

const COLUMNS = [
    { label: 'Name', fieldName: 'Name', type: 'text' },
    { label: 'Email', fieldName: 'Email__c', type: 'email' }
];

export default class CandidateSearch extends NavigationMixin(LightningElement) {
    @track searchKey = '';
    @track candidates;
    columns = COLUMNS;

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