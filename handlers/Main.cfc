component extends="BaseHandler"{
	
	/**
	 * Search all snippets!
	 * We can search by tag: /search?tag=queryexecute
	 * or by title/description/source: /search?q=directoryList
	 * 
	 * Or even by cheatsheet! /category/testbox
	 */
	function search( event, rc, prc ) cache="true" cacheTimeout="30" {
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

			if ( event.getValue( "tag" ) > "" ){
				search = search.getByTag( event.getValue( "tag" ) );
			} else if ( event.getValue( "cheatsheet" ) > "" ){
				search = search.getByCheatsheet( event.getValue( "cheatsheet" ) );
			} else if ( event.getValue( "q" ) > "" ) {
				search = search.getByQuery( event.getValue( "q" ) );
			} else {
				// query for just script stuff
				search = search.getByQuery( event.getValue( "if" ) );
			}

			prc.pagination = search.getPaging();
			prc.snippets = search.getHits();

			event.setView( "Main/Results" );
		}
}