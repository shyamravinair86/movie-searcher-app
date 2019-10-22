import { LightningElement, track, wire } from 'lwc';
import { registerListener, unregisterAllListeners} from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import getMovie from '@salesforce/apex/MovieSearcherController.searchMovie';

export default class Moviedetail extends LightningElement {

    @track movieid;
    @track movie;

    @wire(CurrentPageReference) pageRef;
    @wire(getMovie, {movieId: '$movieid'})
    wiredMovie({data, error}) {
        console.log(data);
        if(data){
            this.movie = data;
            console.log('movie ',this.movie.Title);
        }else if(error) {
            this.showToast('Movie not found!!', error.body.message, 'error');
        }
    }

    connectedCallback() {
        registerListener('movieselect', this.callbackMethod, this);
    }

    disconnectedCallback() {
        unregisterAllListeners(this);
    }

    callbackMethod(payload) {
        this.movieid = payload;
    }

    showToast(title, message, variant){
        const evt = new ShowToastEvent({
            title : title,
            message : message,
            variant : variant,
        });
        this.dispatchEvent(evt);
    }

    get movieFound() {
        if(this.movie) {
            return true;
        }
        return false;
    }

}