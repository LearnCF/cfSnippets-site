/**
 * I interface with ES to search for cheatsheets.
 * 
 * To retrieve hits, call getHits() - will return array of hits.
 * To retrieve pagination details, call getPaging() - will return pagination struct.
 */
component extends="BaseSearch" {

  property name="index" default="cheatsheets";
  property name="type" default="_doc";

	/**
	 * Search for cheatsheets by slug.
	 * Slug is a unique field, so this should only return a single item.
	 * 
	 * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
	 */
	public component function getBySlug( required string slug ){
		var search = getSearchBuilder().new(
				index = getIndex(),
				type = getType()
			)
			.match( "slug", arguments.slug )
			.execute();
		return normalizeSearchResult( search );
	}

}