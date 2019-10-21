import { LightningElement, api, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';


export default class Movietile extends LightningElement {
    @api movie;
    //@api movieselectedid;

    @wire(CurrentPageReference) pageRef;

    //need to finish later
    handleMovieSelected(event) {

    }

}