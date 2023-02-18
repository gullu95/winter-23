import { LightningElement, track } from 'lwc';

export default class ParentComponent extends LightningElement {
    
    @track currentStep = '1';

    handleNext(event) { 
        this.currentStep = '' + (+this.currentStep + 1);
        console.log(this.currentStep);
    }

    handlePrevious(event) { 
        this.currentStep = ''+(+this.currentStep - 1);
        console.log(this.currentStep);
    }   
}