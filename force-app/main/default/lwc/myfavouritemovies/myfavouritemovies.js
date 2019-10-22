import { LightningElement, track, wire } from 'lwc';
import getFavourites from '@salesforce/apex/MovieSearcherController.getFavourites';

export default class Myfavouritemovies extends LightningElement {
    @track favouritemovies;

    @wire(getFavourites)
    wiredFavourites({ data, error }) {
        if(data){
            this.favouritemovies = data;
        } else if(error) {
            this.showToast('Favourites not found!!', error.body.message, 'error');
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

    get hasFavourites() {
        if(this.favouritemovies) {
            return true;
        }
        return false;
    }
}