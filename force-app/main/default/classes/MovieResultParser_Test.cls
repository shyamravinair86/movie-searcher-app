@IsTest
public class MovieResultParser_Test {
	
	// This test method should give 100% coverage
	static testMethod void testParse() {
		String json = '{\"Title\":\"Batman Beyond: Return of the Joker\",\"Year\":\"2000\",\"Rated\":\"PG-13\",\"Released\":\"N/A\",\"Runtime\":\"76 min\",\"Genre\":\"Animation, Action, Crime, Sci-Fi, Thriller\",\"Director\":\"Curt Geda\",\"Writer\":\"Bob Kane (character created by: Batman), Paul Dini (story), Glen Murakami (story), Bruce Timm (story), Paul Dini (screenplay)\",\"Actors\":\"Will Friedle, Kevin Conroy, Mark Hamill, Angie Harmon\",\"Plot\":\"The Joker is back with a vengeance, and Gotham\'s newest Dark Knight needs answers as he stands alone to face Gotham\'s most infamous Clown Prince of Crime.\",\"Language\":\"English\",\"Country\":\"USA\",\"Awards\":\"3 wins & 5 nominations.\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BNmRmODEwNzctYzU1MS00ZDQ1LWI2NWMtZWFkNTQwNDg1ZDFiXkEyXkFqcGdeQXVyNTI4MjkwNjA@._V1_SX300.jpg\",\"Ratings\":[{\"Source\":\"Internet Movie Database\",\"Value\":\"7.8/10\"},{\"Source\":\"Rotten Tomatoes\",\"Value\":\"90%\"}],\"Metascore\":\"N/A\",\"imdbRating\":\"7.8\",\"imdbVotes\":\"21,428\",\"imdbID\":\"tt0233298\",\"Type\":\"movie\",\"DVD\":\"12 Dec 2000\",\"BoxOffice\":\"N/A\",\"Production\":\"Warner Home Video\",\"Website\":\"N/A\",\"Response\":\"True\"}';
		MovieResultParser r = MovieResultParser.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		MovieResultParser objMovieResultParser = new MovieResultParser(System.JSON.createParser(json));
		System.assert(objMovieResultParser != null);
		System.assert(objMovieResultParser.Title == null);
		System.assert(objMovieResultParser.Year == null);
		System.assert(objMovieResultParser.Rated == null);
		System.assert(objMovieResultParser.Released == null);
		System.assert(objMovieResultParser.Runtime == null);
		System.assert(objMovieResultParser.Genre == null);
		System.assert(objMovieResultParser.Director == null);
		System.assert(objMovieResultParser.Writer == null);
		System.assert(objMovieResultParser.Actors == null);
		System.assert(objMovieResultParser.Plot == null);
		System.assert(objMovieResultParser.Language == null);
		System.assert(objMovieResultParser.Country == null);
		System.assert(objMovieResultParser.Awards == null);
		System.assert(objMovieResultParser.Poster == null);
		System.assert(objMovieResultParser.Ratings == null);
		System.assert(objMovieResultParser.Metascore == null);
		System.assert(objMovieResultParser.imdbRating == null);
		System.assert(objMovieResultParser.imdbVotes == null);
		System.assert(objMovieResultParser.imdbID == null);
		System.assert(objMovieResultParser.Type_Z == null);
		System.assert(objMovieResultParser.DVD == null);
		System.assert(objMovieResultParser.BoxOffice == null);
		System.assert(objMovieResultParser.Production == null);
		System.assert(objMovieResultParser.Website == null);
		System.assert(objMovieResultParser.Response == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		MovieResultParser.Ratings objRatings = new MovieResultParser.Ratings(System.JSON.createParser(json));
		System.assert(objRatings != null);
		System.assert(objRatings.Source == null);
		System.assert(objRatings.Value == null);
	}
}