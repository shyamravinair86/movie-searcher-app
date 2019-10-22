import { LightningElement, track } from 'lwc';

export default class Moviesearcher extends LightningElement {
    @track searchtext = '';
    handleMovieSearchText(event) {
        this.searchtext = event.detail;
    }
}