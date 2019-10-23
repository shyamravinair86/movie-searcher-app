@isTest
global class MockHttpResponseGeneratorForMovie implements HttpCalloutMock {
    global HttpResponse respond(HTTPRequest req) {
        System.assertEquals(System.Label.OMDB_API_URL+'&i=Batman', req.getEndpoint());
        System.assertEquals('GET', req.getMethod());

        String json = '{\"Title\":\"Batman Beyond: Return of the Joker\",\"Year\":\"2000\",\"Rated\":\"PG-13\",\"Released\":\"N/A\",\"Runtime\":\"76 min\",\"Genre\":\"Animation, Action, Crime, Sci-Fi, Thriller\",\"Director\":\"Curt Geda\",\"Writer\":\"Bob Kane (character created by: Batman), Paul Dini (story), Glen Murakami (story), Bruce Timm (story), Paul Dini (screenplay)\",\"Actors\":\"Will Friedle, Kevin Conroy, Mark Hamill, Angie Harmon\",\"Plot\":\"The Joker is back with a vengeance, and Gotham\'s newest Dark Knight needs answers as he stands alone to face Gotham\'s most infamous Clown Prince of Crime.\",\"Language\":\"English\",\"Country\":\"USA\",\"Awards\":\"3 wins & 5 nominations.\",\"Poster\":\"https://m.media-amazon.com/images/M/MV5BNmRmODEwNzctYzU1MS00ZDQ1LWI2NWMtZWFkNTQwNDg1ZDFiXkEyXkFqcGdeQXVyNTI4MjkwNjA@._V1_SX300.jpg\",\"Ratings\":[{\"Source\":\"Internet Movie Database\",\"Value\":\"7.8/10\"},{\"Source\":\"Rotten Tomatoes\",\"Value\":\"90%\"}],\"Metascore\":\"N/A\",\"imdbRating\":\"7.8\",\"imdbVotes\":\"21,428\",\"imdbID\":\"tt0233298\",\"Type\":\"movie\",\"DVD\":\"12 Dec 2000\",\"BoxOffice\":\"N/A\",\"Production\":\"Warner Home Video\",\"Website\":\"N/A\",\"Response\":\"True\"}';

        HttpResponse res = new HttpResponse();
        res.setBody(json);
        res.setStatusCode(200);
        return res;
    }
}