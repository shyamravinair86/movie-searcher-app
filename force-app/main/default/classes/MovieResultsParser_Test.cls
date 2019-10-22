@IsTest
public class MovieResultsParser_Test {
	
	// This test method should give 100% coverage
	static testMethod void testParse() {
		String json = '{\"Search\":[{\"Title\":\"Batman v Superman: Dawn of Justice\",\"Year\":\"2016\",\"imdbID\":\"tt2975590\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BYThjYzcyYzItNTVjNy00NDk0LTgwMWQtYjMwNmNlNWJhMzMyXkEyXkFqcGdeQXVyMTQxNzMzNDI@._V1_SX300.jpg\"},{\"Title\":\"Superman Returns\",\"Year\":\"2006\",\"imdbID\":\"tt0348150\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BNzY2ZDQ2MTctYzlhOC00MWJhLTgxMmItMDgzNDQwMDdhOWI2XkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg\"},{\"Title\":\"Superman\",\"Year\":\"1978\",\"imdbID\":\"tt0078346\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BMzA0YWMwMTUtMTVhNC00NjRkLWE2ZTgtOWEzNjJhYzNiMTlkXkEyXkFqcGdeQXVyNjc1NTYyMjg@._V1_SX300.jpg\"},{\"Title\":\"Superman II\",\"Year\":\"1980\",\"imdbID\":\"tt0081573\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BMWUzNDJjMDUtNGEzMi00YThlLTlkMmEtNjVlOGQwOWM3MjM3XkEyXkFqcGdeQXVyMTMxODk2OTU@._V1_SX300.jpg\"},{\"Title\":\"Superman III\",\"Year\":\"1983\",\"imdbID\":\"tt0086393\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BMzI3ZDllMTctNmI2Mi00OGQ4LTk2ZTQtYTJhMjA5ZGI2YmRkXkEyXkFqcGdeQXVyNjUwNzk3NDc@._V1_SX300.jpg\"},{\"Title\":\"Superman IV: The Quest for Peace\",\"Year\":\"1987\",\"imdbID\":\"tt0094074\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BMmIwZWY1YTYtNDlhOS00NDRmLWI4MzItNjk2NDc1N2NhYzNlXkEyXkFqcGdeQXVyNTUyMzE4Mzg@._V1_SX300.jpg\"},{\"Title\":\"Superman/Batman: Apocalypse\",\"Year\":\"2010\",\"imdbID\":\"tt1673430\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BMjk3ODhmNjgtZjllOC00ZWZjLTkwYzQtNzc1Y2ZhMjY2ODE0XkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg\"},{\"Title\":\"Superman/Batman: Public Enemies\",\"Year\":\"2009\",\"imdbID\":\"tt1398941\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BZDc5NTFiMzgtZWJiOS00N2M1LWJmOGYtZmNjMzFhMzcxZjRiXkEyXkFqcGdeQXVyNTAyODkwOQ@@._V1_SX300.jpg\"},{\"Title\":\"Lois & Clark: The New Adventures of Superman\",\"Year\":\"1993–1997\",\"imdbID\":\"tt0106057\",\"Type\":\"series\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BZTU1ZGFjNzEtZWYzZC00ZmI0LTg2NmMtN2YyNTY4YzhlODIyXkEyXkFqcGdeQXVyMjExMjk0ODk@._V1_SX300.jpg\"},{\"Title\":\"Superman/Doomsday\",\"Year\":\"2007\",\"imdbID\":\"tt0934706\",\"Type\":\"movie\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BZjU4MzIyZWUtNWQ4Yy00YTU4LTk5NjUtNDBiNDkxZTVlZDgwXkEyXkFqcGdeQXVyNjExODE1MDc@._V1_SX300.jpg\"}],\"totalResults\":\"215\",\"Response\":\"True\"}';
		MovieResultsParser r = MovieResultsParser.parse(json);
		System.assert(r != null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		MovieResultsParser.Search_Z objSearch_Z = new MovieResultsParser.Search_Z(System.JSON.createParser(json));
		System.assert(objSearch_Z != null);
		System.assert(objSearch_Z.Title == null);
		System.assert(objSearch_Z.Year == null);
		System.assert(objSearch_Z.imdbID == null);
		System.assert(objSearch_Z.Type_Z == null);
		System.assert(objSearch_Z.Poster == null);

		json = '{\"TestAMissingObject\": { \"TestAMissingArray\": [ { \"TestAMissingProperty\": \"Some Value\" } ] } }';
		MovieResultsParser objMovieResultsParser = new MovieResultsParser(System.JSON.createParser(json));
		System.assert(objMovieResultsParser != null);
		System.assert(objMovieResultsParser.Search_Z == null);
		System.assert(objMovieResultsParser.totalResults == null);
		System.assert(objMovieResultsParser.Response == null);
	}
}