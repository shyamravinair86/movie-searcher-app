public class MovieResultsParser {

	public class Search_Z {
		@AuraEnabled public String Title {get;set;} 
		@AuraEnabled public String Year {get;set;} 
		@AuraEnabled public String imdbID {get;set;} 
		@AuraEnabled public String Type_Z {get;set;} // in json: Type
		@AuraEnabled public String Poster {get;set;} 

		public Search_Z(JSONParser parser) {
			while (parser.nextToken() != System.JSONToken.END_OBJECT) {
				if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
					String text = parser.getText();
					if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
						if (text == 'Title') {
							Title = parser.getText();
						} else if (text == 'Year') {
							Year = parser.getText();
						} else if (text == 'imdbID') {
							imdbID = parser.getText();
						} else if (text == 'Type') {
							Type_Z = parser.getText();
						} else if (text == 'Poster') {
							Poster = parser.getText();
						} else {
							System.debug(LoggingLevel.WARN, 'Search_Z consuming unrecognized property: '+text);
							consumeObject(parser);
						}
					}
				}
			}
		}
    }
    	
	@AuraEnabled public List<Search_Z> Search_Z {get;set;} // in json: Search
	@AuraEnabled public String totalResults {get;set;} 
	@AuraEnabled public String Response {get;set;} 

	public MovieResultsParser(JSONParser parser) {
		while (parser.nextToken() != System.JSONToken.END_OBJECT) {
			if (parser.getCurrentToken() == System.JSONToken.FIELD_NAME) {
				String text = parser.getText();
				if (parser.nextToken() != System.JSONToken.VALUE_NULL) {
					if (text == 'Search') {
						Search_Z = arrayOfSearch_Z(parser);
					} else if (text == 'totalResults') {
						totalResults = parser.getText();
					} else if (text == 'Response') {
						Response = parser.getText();
					} else {
						System.debug(LoggingLevel.WARN, 'MovieResultsParser consuming unrecognized property: '+text);
						consumeObject(parser);
					}
				}
			}
		}
	}
		
	public static MovieResultsParser parse(String json) {
		System.JSONParser parser = System.JSON.createParser(json);
		return new MovieResultsParser(parser);
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
	
    private static List<Search_Z> arrayOfSearch_Z(System.JSONParser p) {
        List<Search_Z> res = new List<Search_Z>();
        if (p.getCurrentToken() == null) p.nextToken();
        while (p.nextToken() != System.JSONToken.END_ARRAY) {
            res.add(new Search_Z(p));
        }
        return res;
    }
}