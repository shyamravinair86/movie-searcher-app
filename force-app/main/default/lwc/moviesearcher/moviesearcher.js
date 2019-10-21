import { LightningElement, track } from 'lwc';

export default class Moviesearcher extends LightningElement {
    @track movieSearchText = '';
    handleMovieSearchText(event) {
        this.movieSearchText = event.detail;
    }
}