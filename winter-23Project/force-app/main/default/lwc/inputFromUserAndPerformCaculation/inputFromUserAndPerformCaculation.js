import { LightningElement, track } from 'lwc';

export default class InputFromUserAndPerformCaculation extends LightningElement {
    // these are know as comments, comments are non-executable statements.
    //in JS, we are using @track::variable, a temporary locaiton with name
    //which is used to hold values
    //from the user input, values that are used in prcoessing, etc.
    //important thing is that we can use @track at any place within the JS file
    //as well as in the HTML File. So as a result, we can use @track variable to display values
    //over the HTML file.
    @track outputValue = 'This is the Output value';
    @track firstNumber;
    @track secondNumber;
    
    myOnChangeMethod(event) { 
        //console.log is used to print any message, any values, any output 
        //on the console tab of the developer window. 
        console.log('My Onchange Event is Executed.');
        //varaible: these are the temporary locaiton which is used to hold values
        //from the user input, values that are used in prcoessing, etc.

        //in JS, we are using var/let::variable,
        //after that we are giving the name to that temporary location.
        var userInput = event.target.value;
        console.log(userInput);
        //When we are re-using the var/let, then there is no change,
        //but in case of @track, we need to use 'this.' keyword before the variable name.
        this.outputValue = 'first Name: ' + userInput;
    }

    onchangeFirstNumber(event) { 
        var userInputFistNumber = event.target.value;
        console.log(userInputFistNumber);
        //we need to conver the input into numnber.
        this.firstNumber = +userInputFistNumber;
    }

    onchangeSecondNumber(event) { 
        var userInputSecondNumber = event.target.value;
        console.log(userInputSecondNumber);
        this.secondNumber = +userInputSecondNumber;
    }

    onclickSumTwoNumber(event) { 
        this.outputValue = this.firstNumber + this.secondNumber;
    }
}