import { LightningElement, api, wire, track } from 'lwc';
import getMovies from '@salesforce/apex/MovieSearcherController.searchMovies';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Moviesearchresults extends LightningElement {
    @api moviesearchtext;
    @track movies;
    @track movieselectedid;

    @wire(getMovies, {searchTerm: '$moviesearchtext'}) 
    wiredMovies({data, error}) {
        if(data) {
            this.movies = data;
        }
        else if(error) {
            this.showToast('Movies not found!!', error.body.message, 'error');
        }
    }

    handleMovieSelect(event) {
        this.movieselectedid = event.detail;
    }

    showToast(title, message, variant){
        const evt = new ShowToastEvent({
            title : title,
            message : message,
            variant : variant,
        });
        this.dispatchEvent(evt);
    }

    get moviesFound() {
        if(this.movies) {
            return true;
        }
        return false;
    }
    
}