/**
 * I interface with ES to search for snippets.
 * 
 * To retrieve hits, call getHits() - will return array of hits.
 * To retrieve pagination details, call getPaging() - will return pagination struct.
 */
component extends="BaseSearch" {

    property name="index" default="snippets";
    property name="type" default="_doc";

    /**
     * Search for snippets by slug.
     * 
     * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
     */
    public component function getBySlug( required string slug ){
        var search = getSearchBuilder().new(
                index = variables.index,
                type = variables.type
            )
            .term( "_id", arguments.slug )
            .execute();
        return normalizeSearchResult( search );
    }

    /**
     * Search for snippets by cheatsheet.
     * 
     * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
     */
    public component function getByCheatsheet( required string cheatsheet ){
        var search = getSearchBuilder().new(
                index = variables.index,
                type = variables.type
            )
            .match( "cheatsheets", arguments.cheatsheet )
            .execute();
        return normalizeSearchResult( search );
    }

    /**
     * Search for snippets by tag.
     * 
     * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
     */
    public component function getByTag( required string tag ){
        var search = getSearchBuilder().new(
                index = variables.index,
                type = variables.type
            )
            .match( "tags", arguments.tag )
            .execute();
        return normalizeSearchResult( search );
    }

    /**
     * Search for snippets by query - searches all fields in snippet.
     * 
     * @returns this component containing the "normalized" result - e.g. call getHits(), getPaging(), etc.
     */
    public component function getByQuery( required string query ){
        var search = getSearchBuilder().new(
                index = variables.index,
                type = variables.type
            )
            .multiMatch(
                names = [ "title", "description", "snippet.source", "tags" ],
                value = arguments.query
            )
            .execute();
        return normalizeSearchResult( search );
    }
}