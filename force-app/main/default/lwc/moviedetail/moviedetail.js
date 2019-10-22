import { LightningElement, track, wire } from 'lwc';
import { registerListener, unregisterAllListeners} from 'c/pubsub';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import { createRecord } from 'lightning/uiRecordApi';
import { CurrentPageReference } from 'lightning/navigation';
import getMovie from '@salesforce/apex/MovieSearcherController.searchMovie';
import FAVOURITE_MOVIE_OBJ from '@salesforce/schema/My_Favourite_Movie__c';
import MOVIE_NAME from '@salesforce/schema/My_Favourite_Movie__c.Movie_Name__c';
import MOVIE_POSTER from '@salesforce/schema/My_Favourite_Movie__c.Poster__c';
import MOVIE_ACTOR from '@salesforce/schema/My_Favourite_Movie__c.Actors__c';
import MOVIE_PLOT from '@salesforce/schema/My_Favourite_Movie__c.Plot__c';

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

    addToFavourite() {
        const fields = {};
        fields[MOVIE_NAME.fieldApiName] = this.movie.Title;
        fields[MOVIE_POSTER.fieldApiName] = this.movie.Poster;
        fields[MOVIE_ACTOR.fieldApiName] = this.movie.Actors;
        fields[MOVIE_PLOT.fieldApiName] = this.movie.Plot;
        const recordInput = { apiName: FAVOURITE_MOVIE_OBJ.objectApiName, fields };
        createRecord(recordInput)
            .then(favourite => {
                this.showToast('SUCCESS', 'Added as favourite.', 'success');
            })
            .catch(error => {
                this.showToast('ERROR', error.body.message, 'error');
            });
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