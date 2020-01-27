/**
* I handler /cheatsheet requests.
*/
component extends="BaseHandler" {
	// list all cheatsheets?
	function index(){
	}

	/**
	 * View a single cheatsheet with all snippets
	 */
	function view(){
		event.paramValue( "cheatsheet", "" );

		var hits = getInstance( "Cheatsheets" )
			.getBySlug( event.getValue( "cheatsheet" ) )
			.getHits();

		if ( arrayLen( hits ) ){
			prc.cheatsheet = hits.first();

			var snippetSearch = getInstance( "Snippets" )
				.getByCheatsheet( event.getValue( "cheatsheet" ) )
				.getHits();

			prc.snippets = snippetSearch.getHits();
			prc.pagination = snippetSearch.getPaging();
		} else {
			prc.cheatsheet = {};
		}

		renderView( "Cheatsheet/view" );
	}
}