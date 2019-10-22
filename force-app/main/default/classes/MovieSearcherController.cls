public with sharing class MovieSearcherController {
	
	@AuraEnabled(cacheable=true)
    public static MovieResultsParser searchMovies(String searchTerm) {
        MovieResultsParser movies = null;
        if(!String.isEmpty(searchTerm)){
            Http http = new Http();
            String url = '&s= '+searchTerm;

            HttpRequest request = new HttpRequest();
            //request.setEndpoint('callout:OMDB_API'+url);
            request.setEndpoint('http://www.omdbapi.com/?apikey=4fe98cb1'+url);
            request.setMethod('GET');

            HttpResponse response = http.send(request);

			System.debug('response--> '+response.getBody());

            if(response.getStatusCode() == 200) {
                movies = MovieResultsParser.parse(response.getBody());
            }
        }
        return movies;
    }

}
