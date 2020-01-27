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

			if ( rc.tag > "" ){
				search = search.getByTag( event.getValue( "tag" ) );
			} else if ( rc.cheatsheet > "" ){
				search = search.getByCheatsheet( rc.cheatsheet );
			} else if ( rc.q > "" ) {
				search = search.getByQuery( rc.q );
			} else {
				// query for just script stuff
				search = search.getByQuery( "script" );
			}

			prc.pagination = search.getPaging();
			prc.snippets = search.getHits();

			event.setView( "Main/Results" );
		}
}