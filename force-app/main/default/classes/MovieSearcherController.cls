public with sharing class MovieSearcherController {
	
	@AuraEnabled(cacheable=true)
    public static MovieResultsParser searchMovies(String searchTerm) {
        MovieResultsParser movies = null;
        if(!String.isEmpty(searchTerm)){
            String url = System.Label.OMDB_API_URL+'&s='+searchTerm;
            HttpResponse response = httpRetriever(url);
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
            String url = System.Label.OMDB_API_URL+'&i='+movieId;
            HttpResponse response = httpRetriever(url);
            if(response.getStatusCode() == 200) {
                movie = MovieResultParser.parse(response.getBody());
            }
        }
        return movie;
    }

    @AuraEnabled(cacheable=true)
    public static List<My_Favourite_Movie__c> getFavourites() {
        return [SELECT Id, Actors__c, Movie_Name__c, Poster__c FROM My_Favourite_Movie__c WHERE OwnerId = :UserInfo.getUserId()];
    }

    private static HttpResponse httpRetriever(String URL) {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(URL);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        return response;
    }

}
