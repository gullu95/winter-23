import { LightningElement, track } from 'lwc';
import {
    subscribe,
    unsubscribe,
    onError
} from 'lightning/empApi';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import makeHTTPCallout from '@salesforce/apex/SAPIntegeration.makeHTTPCallout';

export default class LeadPlatformEvent extends LightningElement {
    @track recordId = '00Q2w00000R1gCiEAJ';
    @track objectApiName = 'Lead';

    @track channelName = '/event/MyNotificationEvent__e';
    @track isSubscribeDisabled = false;
    @track isUnsubscribeDisabled = !this.isSubscribeDisabled;

    @track subscription = {};

    // Tracks changes to channelName text field
    handleChannelName(event) {
        this.channelName = event.target.value;
    }

    // Initializes the component
    connectedCallback() {
        // Register error listener
        this.registerErrorListener();
        this.handleSubscribe();
        this.showRecord = true;
    }

    handleApprove(){
    console.log('SEND REQUEST');
        makeHTTPCallout({ recordId: this.recordId})
            .then((result) => {
                //this.showToast('Request Sent', 'Please Wait for the Response.');
            })
            .catch((error) => {
            });
    }

    // Handles subscribe button click
    handleSubscribe() {
        var self = this;
        // Callback invoked whenever a new event message is received
        const messageCallback = function (response) {
            console.log('New message received: ', JSON.stringify(response));
            self.showToast('PLATFORM EVENT', "Lead is Updated from SAP");
            
            self.refreshValues();
        };

        // Invoke subscribe method of empApi. Pass reference to messageCallback
        subscribe(this.channelName, -1, messageCallback).then((response) => {
            // Response contains the subscription information on subscribe call
            console.log(
                'Subscription request sent to: ',
                JSON.stringify(response.channel)
            );
            this.subscription = response;
            this.toggleSubscribeButton(true);
        });
    }

    // Handles unsubscribe button click
    handleUnsubscribe() {
        this.toggleSubscribeButton(false);

        // Invoke unsubscribe method of empApi
        unsubscribe(this.subscription, (response) => {
            console.log('unsubscribe() response: ', JSON.stringify(response));
            // Response is true for successful unsubscribe
        });
    }

    toggleSubscribeButton(enableSubscribe) {
        this.isSubscribeDisabled = enableSubscribe;
        this.isUnsubscribeDisabled = !enableSubscribe;
    }

    registerErrorListener() {
        // Invoke onError empApi method
        onError((error) => {
            console.log('Received error from server: ', JSON.stringify(error));
            // Error contains the server-side error
        });
    }

    refreshValues() {
        const inputFields = this.template.querySelectorAll('lightning-input-field');
        if (inputFields) {
            inputFields.forEach((field) => {
                field.reset();
            });
        }
    }   

    showToast(title, mymessage) {
        console.log('TOAST EVENT');
        const event = new ShowToastEvent({
            title: title,
            message: mymessage,
            mode: 'sticky'
        });
        this.dispatchEvent(event);
    }
}