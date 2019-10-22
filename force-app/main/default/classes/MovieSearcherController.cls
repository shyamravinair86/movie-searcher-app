public with sharing class MovieSearcherController {
	
	@AuraEnabled(cacheable=true)
    public static MovieResultsParser searchMovies(String searchTerm) {
        MovieResultsParser movies = null;
        if(!String.isEmpty(searchTerm)){
            String url = 'http://www.omdbapi.com/?apikey=4fe98cb1&s= '+searchTerm;
            HttpResponse response = httpRetriever(url);
            System.debug('response--> '+response.getBody());
            if(response.getStatusCode() == 200) {
                movies = MovieResultsParser.parse(response.getBody());
            }
        }
        return movies;
    }

    @AuraEnabled(cacheable=true)
    public static MovieResultParser searchMovie(String movieId){
        MovieResultParser movie = null;
        if(!String.isEmpty(movieId)) {
            String url = 'http://www.omdbapi.com/?apikey=4fe98cb1&i= '+movieId;
            HttpResponse response = httpRetriever(url);
            System.debug('response--> '+response.getBody());
            if(response.getStatusCode() == 200) {
                movie = MovieResultParser.parse(response.getBody());
            }
        }
        System.debug('movie--> '+movie);
        return movie;
    }

    private static HttpResponse httpRetriever(String URL) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        //request.setEndpoint('callout:OMDB_API'+url);
        request.setEndpoint(URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response;
    }

}
