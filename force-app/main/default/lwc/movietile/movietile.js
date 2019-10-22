import { LightningElement, api, wire } from 'lwc';
import { fireEvent } from 'c/pubsub';
import { CurrentPageReference } from 'lightning/navigation';


export default class Movietile extends LightningElement {
    @api movie;
    @api selectedmovieid;

    @wire(CurrentPageReference) pageRef;

    //need to finish later
    handleMovieSelected(event) {
        event.preventDefault();
        const movieid = this.movie.imdbID;
        const movieselected = new CustomEvent('movieselect', {detail: movieid});
        this.dispatchEvent(movieselected);

        fireEvent(this.pageRef, 'movieselect', movieid);
    }

    get isMovieSelected() {
        if(this.movie.imdbID === this.selectedmovieid) {
            return "tile selected";
        }
        return "tile";
    }

}