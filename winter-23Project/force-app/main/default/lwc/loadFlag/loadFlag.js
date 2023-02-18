import { LightningElement, track } from 'lwc';
import { loadStyle, loadScript } from 'lightning/platformResourceLoader';

import bootstrap from '@salesforce/resourceUrl/bootstrap';
export default class LoadFlag extends LightningElement {
    

    @track isOpen = false;

    get dropdownClass() {
        return this.isOpen ? 'slds-dropdown slds-dropdown_right slds-is-open' : 'slds-dropdown slds-dropdown_right';
    }

    toggleDropdown() {
        this.isOpen = !this.isOpen;
    }

    selectOption1() {
        this.isOpen = false;
        console.log('Option 1 selected');
    }

    selectOption2() {
        this.isOpen = false;
        console.log('Option 2 selected');
    }

    selectOption3() {
        this.isOpen = false;
        console.log('Option 3 selected');
    }
}