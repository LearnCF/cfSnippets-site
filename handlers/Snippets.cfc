component extends="BaseHandler"{
	
	/**
	 * Search all snippets!
	 * We can search by tag: /search?tag=queryexecute
	 * or by title/description/source: /search?q=directoryList
	 * 
	 * Or even by cheatsheet! /category/testbox
	 */
	function search( event, rc, prc ) cache="true" {
		event.paramValue( "tag", "" );
		event.paramValue( "q", "" );
		event.paramValue( "cheatsheet", "" );

		// pagination - param and sanitize start row.
		cfparam( name="rc.s", default="0", type="integer" );
		var maxRows = 20;
		var startRow = int( rc.s );
		if ( startRow < 0 ) {
			startRow = 0;
		}

		var search  = getInstance( "Snippets" )
			.setStartRow( startRow )
			.setMaxRows( maxRows );

			if ( rc.tag > "" ){
				search = search.getByTag( event.getValue( "tag" ) );
			} else if ( rc.cheatsheet > "" ){
				search = search.getByCheatsheet( rc.cheatsheet );
			} else if ( rc.q > "" ) {
				search = search.getByQuery( rc.q );
			} else {
				// query for basically anything
				search = search.getByQuery( "if" );
			}

			prc.pagination = search.getPaging();
			prc.snippets = search.getHits();

			event.setView( "Snippets/Results" );
		}

		/**
		 * View an individual snippet based on its "slug".
		 * e.g: /snippets/:slug
		 */
		function view( event, rc, prc ) cache="true" {
			var search  = getInstance( "Snippets" )
			.setMaxRows( 1 )
			.getBySlug( event.getValue( "slug", "" ) );

			if ( !search.getHits().len() ){
				return renderPageNotFound(
					argumentCollection = arguments
				);
			}
			prc.snippet = search.getHits().first();

			// snippet becomes a decent full-blown "page"
			prc.page = prc.snippet;
		}
}