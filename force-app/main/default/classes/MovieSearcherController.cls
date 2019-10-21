public with sharing class MovieSearcherController {
    @AuraEnabled
    public static String searchMovies(String searchTerm) {
        Http http = new Http();
        String url = '&t= '+searchTerm;

        HttpRequest request = new HttpRequest();
        request.setEndpoint('callout:OMDB_API'+url);
        request.setHeader('Content-Type', 'application/json');
        request.setMethod('GET');

        HttpResponse response = http.send(request);

        List<MovieWrapper> movies = new List<MovieWrapper>();

        if(response.getStatusCode() == 200) {
            /*for(MovieWrapper m :MovieWrapper.parse(response.getBody()){
                movies.add(m);
            }*/
        }

        return null;
    } 

    public class MovieWrapper{
		public String Title;	//Joker
		public String Year;	//2019
		public String Rated;	//R
		public String Released;	//04 Oct 2019
		public String Runtime;	//121 min
		public String Genre;	//Crime, Drama, Thriller
		public String Director;	//Todd Phillips
		public String Writer;	//Todd Phillips, Scott Silver
		public String Actors;	//Joaquin Phoenix, Robert De Niro, Zazie Beetz, Frances Conroy
		public String Plot;	//A gritty character study of Arthur Fleck, a man disregarded by society.
		public String Language;	//English
		public String Country;	//USA, Canada
		public String Awards;	//N/A
		public String Poster;	//https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg
		public cls_Ratings[] Ratings;
		public String Metascore;	//58
		public String imdbRating;	//9.1
		public String imdbVotes;	//87,202
		public String imdbID;	//tt7286456
		public String Type;	//movie
		public String DVD;	//N/A
		public String BoxOffice;	//N/A
		public String Production;	//Warner Bros. Pictures
		public String Website;	//N/A
		public String Response;	//True
	}
    
	public class cls_Ratings {
		public String Source;	//Internet Movie Database
		public String Value;	//9.1/10
	}

	public static MovieWrapper parse(String json){
		return (MovieWrapper) System.JSON.deserialize(json, MovieWrapper.class);
	}
}
