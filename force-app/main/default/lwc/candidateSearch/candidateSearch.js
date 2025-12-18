import { LightningElement, track } from 'lwc';
import searchCandidates from '@salesforce/apex/CandidateController.search';

export default class CandidateSearch extends LightningElement {
    @track searchKey = '';
    @track candidates;

    handleKeyChange(event) {
        this.searchKey = event.target.value;
        searchCandidates({ name: this.searchKey })
            .then(result => { this.candidates = result; })
            .catch(error => { console.error(error); });
    }
}