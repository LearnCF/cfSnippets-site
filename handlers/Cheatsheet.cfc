/**
* I handler /cheatsheet requests.
*/
component extends="BaseHandler" {
	// list all cheatsheets?
	function index( event, rc, prc ){
	}

	/**
	 * View a single cheatsheet with all snippets
	 */
	function view( event, rc, prc ){
		event.paramValue( "slug", "" );

		var hits = getInstance( "Cheatsheets" )
			.getById( event.getValue( "slug" ) )
			.getHits();

		if ( arrayLen( hits ) ){
			prc.page = hits.first();

			var snippetSearch = getInstance( "Snippets" )
				.getByCheatsheet( event.getValue( "slug" ) );

			prc.snippets = snippetSearch.getHits();
			prc.pagination = snippetSearch.getPaging();
		} else {
			renderPageNotFound(
				argumentCollection = arguments
			);
		}
	}
}