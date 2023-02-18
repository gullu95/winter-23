import { LightningElement, track, wire } from 'lwc';
import getDogImages from '@salesforce/apex/ParentControllerForCustomEvent.getDogImages';


export default class ParentCmpForCustomEvent extends LightningElement {

    @track dogImages;
    @track breedName = 'hound';
    @track currentIndex = 0;
    @track currentImageLink;
    @track error;

    @track dogImageRefresh;

    @wire(getDogImages, {"breedName" : "$breedName"})
    wiredContacts(value) {
        
        this.dogImageRefresh = value;
        // Destructure the provisioned value 
        const { data, error } = value;
        if (data) {
            console.log('data', data);
            this.dogImages = data;
            this.currentIndex = 0;
            this.currentImageLink = data[this.currentIndex];

            this.error = undefined;
        } else if (error) {
            this.error = error;
            this.contacts = undefined;
        }
    }

    handlePreviousButtonCE() { 
        this.currentIndex = this.currentIndex - 1;
        this.currentImageLink = this.dogImages[this.currentIndex];
    }

    handleNextButtonCE() { 
        console.log('Check next Event Received');
        this.currentIndex = this.currentIndex + 1;
        this.currentImageLink = this.dogImages[this.currentIndex];
        console.log('Check value', this.currentIndex, this.currentImageLink);
    }

    handleBreedNameChangeCE(event) { 
        console.log('Check next Event Received', event.detail);
        this.breedName = event.detail;
    }
}