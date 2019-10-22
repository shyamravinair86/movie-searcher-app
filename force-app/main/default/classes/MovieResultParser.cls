public class MovieResultParser {

	@AuraEnabled public String Title {get;set;} 
	@AuraEnabled public String Year {get;set;} 
	@AuraEnabled public String Rated {get;set;} 
	@AuraEnabled public String Released {get;set;} 
	@AuraEnabled public String Runtime {get;set;} 
	@AuraEnabled public String Genre {get;set;} 
	@AuraEnabled public String Director {get;set;} 
	@AuraEnabled public String Writer {get;set;} 
	@AuraEnabled public String Actors {get;set;} 
	@AuraEnabled public String Plot {get;set;} 
	@AuraEnabled public String Language {get;set;} 
	@AuraEnabled public String Country {get;set;} 
	@AuraEnabled public String Awards {get;set;} 
	@AuraEnabled public String Poster {get;set;} 
	@AuraEnabled public List<Ratings> Ratings {get;set;} 
	@AuraEnabled public String Metascore {get;set;} 
	@AuraEnabled public String imdbRating {get;set;} 
	@AuraEnabled public String imdbVotes {get;set;} 
	@AuraEnabled public String imdbID {get;set;} 
	@AuraEnabled public String Type_Z {get;set;} // in json: Type
	@AuraEnabled public String DVD {get;set;} 
	@AuraEnabled public String BoxOffice {get;set;} 
	@AuraEnabled public String Production {get;set;} 
	@AuraEnabled public String Website {get;set;} 
	@AuraEnabled public String Response {get;set;} 

	public MovieResultParser(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'Title') {
						Title = parser.getText();
					} else if (text == 'Year') {
						Year = parser.getText();
					} else if (text == 'Rated') {
						Rated = parser.getText();
					} else if (text == 'Released') {
						Released = parser.getText();
					} else if (text == 'Runtime') {
						Runtime = parser.getText();
					} else if (text == 'Genre') {
						Genre = parser.getText();
					} else if (text == 'Director') {
						Director = parser.getText();
					} else if (text == 'Writer') {
						Writer = parser.getText();
					} else if (text == 'Actors') {
						Actors = parser.getText();
					} else if (text == 'Plot') {
						Plot = parser.getText();
					} else if (text == 'Language') {
						Language = parser.getText();
					} else if (text == 'Country') {
						Country = parser.getText();
					} else if (text == 'Awards') {
						Awards = parser.getText();
					} else if (text == 'Poster') {
						Poster = parser.getText();
					} else if (text == 'Ratings') {
						Ratings = arrayOfRatings(parser);
					} else if (text == 'Metascore') {
						Metascore = parser.getText();
					} else if (text == 'imdbRating') {
						imdbRating = parser.getText();
					} else if (text == 'imdbVotes') {
						imdbVotes = parser.getText();
					} else if (text == 'imdbID') {
						imdbID = parser.getText();
					} else if (text == 'Type') {
						Type_Z = parser.getText();
					} else if (text == 'DVD') {
						DVD = parser.getText();
					} else if (text == 'BoxOffice') {
						BoxOffice = parser.getText();
					} else if (text == 'Production') {
						Production = parser.getText();
					} else if (text == 'Website') {
						Website = parser.getText();
					} else if (text == 'Response') {
						Response = parser.getText();
					} else {
						System.debug(LoggingLevel.WARN, 'MovieResultParser consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
	
	public class Ratings {
		@AuraEnabled public String Source {get;set;} 
		@AuraEnabled public String Value {get;set;} 

		public Ratings(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Source') {
							Source = parser.getText();
						} else if (text == 'Value') {
							Value = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Ratings consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
	}
	
	
	public static MovieResultParser parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new MovieResultParser(parser);
	}
	
	public static void consumeObject(System.JSONParser parser) {
		Integer depth = 0;
		do {
			System.JSONToken curr = parser.getCurrentToken();
			if (curr == System.JSONToken.START_OBJECT || 
				curr == System.JSONToken.START_ARRAY) {
				depth++;
			} else if (curr == System.JSONToken.END_OBJECT ||
				curr == System.JSONToken.END_ARRAY) {
				depth--;
			}
		} while (depth > 0 && parser.nextToken() != null);
	}
	
    private static List<Ratings> arrayOfRatings(System.JSONParser p) {
        List<Ratings> res = new List<Ratings>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Ratings(p));
        }
        return res;
    }

}