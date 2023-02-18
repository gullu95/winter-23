import { LightningElement, track, api } from 'lwc';

export default class ChildCmpForCustomEvent extends LightningElement {
    
    @api currentImage;
    @api breedName;



    handlePreviousClick(event) { 
        this.dispatchEvent(new CustomEvent('previous'));
    }

    handleNextClick(event) { 
        console.log('Check next Event Fired');
        this.dispatchEvent(new CustomEvent('next'));
    }

    handleSearchNewBreed(event) { 
        this.breedName = event.target.value;
    }

    handleSearch(event) { 
        // Prevents the anchor element from navigating to a URL.
        event.preventDefault();

        // Creates the event with the contact ID data.
        const selectedEvent = new CustomEvent('breedsearch', { detail: this.breedName });

        // Dispatches the event.
        this.dispatchEvent(selectedEvent);
    }
}