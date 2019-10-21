public class MovieResultParser{
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
	class cls_Ratings {
		public String Source;	//Internet Movie Database
		public String Value;	//9.1/10
	}

    public static MovieResultParser parse(String json){
		return (MovieResultParser) System.JSON.deserialize(json, MovieResultParser.class);
	}

	/*static testMethod void testParse() {
		String json=		'{"Title":"Joker","Year":"2019","Rated":"R","Released":"04 Oct 2019","Runtime":"121 min","Genre":"Crime, Drama, Thriller","Director":"Todd Phillips","Writer":"Todd Phillips, Scott Silver","Actors":"Joaquin Phoenix, Robert De Niro, Zazie Beetz, Frances Conroy","Plot":"A gritty character study of Arthur Fleck, a man disregarded by society.","Language":"English","Country":"USA, Canada","Awards":"N/A","Poster":"https://m.media-amazon.com/images/M/MV5BNGVjNWI4ZGUtNzE0MS00YTJmLWE0ZDctN2ZiYTk2YmI3NTYyXkEyXkFqcGdeQXVyMTkxNjUyNQ@@._V1_SX300.jpg","Ratings":[{"Source":"Internet Movie Database","Value":"9.1/10"},{"Source":"Rotten Tomatoes","Value":"77%"},{"Source":"Metacritic","Value":"58/100"}],"Metascore":"58","imdbRating":"9.1","imdbVotes":"87,202","imdbID":"tt7286456","Type":"movie","DVD":"N/A","BoxOffice":"N/A","Production":"Warner Bros. Pictures","Website":"N/A","Response":"True"}';
		MovieResultParser obj = parse(json);
		System.assert(obj != null);
	}*/
}