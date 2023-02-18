import { LightningElement,track, api } from 'lwc';

export default class ChildComponent extends LightningElement {

    @api stepValue;

    get stepMessage() { 
        if (this.stepValue == '1') { 
            return 'Message 1';
        }else if(this.stepValue == '2') { 
            return 'Message 2';
        }
    }
}