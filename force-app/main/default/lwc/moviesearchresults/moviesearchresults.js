import { LightningElement, api, wire, track } from 'lwc';
import getMovies from '@salesforce/apex/MovieSearcherController.searchMovies';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';

export default class Moviesearchresults extends LightningElement {
    @api movieSearchText;
    @track movies;

    @wire(getMovies, {searchTerm: '$movieSearchText'}) 
    movies({data, error}) {
        if(data) {
            this.movies = data;
        }
        else if(error) {
            this.showToast('Cars Not Found', error.body.message, 'error');
        }
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