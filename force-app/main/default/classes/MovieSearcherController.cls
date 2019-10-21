public with sharing class MovieSearcherController {
    @AuraEnabled
    public static String searchMovies(String searchTerm) {
        String movieResults;
        Http http = new Http();
        String url = '&t= '+searchTerm;

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OMDB_API'+url);
        request.setHeader('Content-Type', 'application/json');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        if(response.getStatusCode() == 200) {
            MovieResultParser movies = MovieResultParser.parse(response.getBody());
        }

        return null;
    } 
}
