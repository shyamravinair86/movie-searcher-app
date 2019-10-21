import { LightningElement } from 'lwc';

export default class Moviesearchform extends LightningElement {
    
    handleMovieSearchText(event) {
        const moviesearchtext = event.detail.value;
        const moviesearchevent = new CustomEvent( 'moviesearchentered', {detail: moviesearchtext} );
        this.dispatchEvent(moviesearchevent);
    }
}