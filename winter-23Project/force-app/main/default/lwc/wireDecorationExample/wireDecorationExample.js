import { LightningElement, track, wire } from 'lwc';
import getContacts from '@salesforce/apex/WireAnnotationLWCApexController.getContacts';

import updateContact from '@salesforce/apex/WireAnnotationLWCApexController.updateContact';

import { refreshApex } from '@salesforce/apex';

export default class WireDecorationExample extends LightningElement {

    @track contacts;
    @track searchKey = '';
    @track error;

    @track contactsRefresh;

    @wire(getContacts, {"searchKey" : "$searchKey"})
        wiredContacts(value) {
            // Hold on to the provisioned value so we can refresh it later.
            this.contactsRefresh = value;
            // Destructure the provisioned value 
            const { data, error } = value;
            if (data) {
                this.contacts = data;
                this.error = undefined;
            } else if (error) {
                this.error = error;
                this.contacts = undefined;
            }
        }

    
    handleSearchInput(event) { 
        this.searchKey = event.target.value;
    }

    handleRejection(event) {
        var recordId = event.target.dataset.id;
        var status = 'Rejected';
        console.log('recordId', recordId);
        updateContact({"contactId": recordId, "status": status })
            .then(result => {
                refreshApex(this.contactsRefresh);
            })
            .catch(error => {
                this.error = error;
                console.log('error', error);
            });
    }

    handleApproval(event) { 
        var recordId = event.target.dataset.id;
        var status = 'Approved';
        
        updateContact({"contactId": recordId, "status": status })
            .then(result => {
                refreshApex(this.contactsRefresh);
            })
            .catch(error => {
                this.error = error;
                console.log('error', error);
            });
    }
}