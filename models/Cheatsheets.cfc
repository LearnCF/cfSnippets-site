/**
 * I interface with ES to search for cheatsheets.
 * 
 * To retrieve hits, call getHits() - will return array of hits.
 * To retrieve pagination details, call getPaging() - will return pagination struct.
 */
component extends="BaseSearch"{

  property name="index" default="cheatsheets";
  property name="type" default="_doc";

	/**
	 * Retrieve a single cheatsheet by document id.
	 * 
	 * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
	 */
	public component function getById( required string id ){
		var search = getSearchBuilder().new(
				index = variables.index,
				type = variables.type
			)
			.match( "_id", arguments.id )
			.execute();
		return normalizeSearchResult( search );
	}

	/**
	 * Retrieve all cheatsheets from the index
	 * 
	 * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
	 */
	public component function getAll( numeric size = 10 ){
		var search = getSearchBuilder().new(
				index = variables.index,
				type = variables.type,
				properties = {
					"query" = {
						"match_all" = {}
					}
				}
			)
			.execute();
		return normalizeSearchResult( search );
	}

}