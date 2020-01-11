component extends="BaseHandler"{
	function index( event, rc, prc ){
		// do summat!!
	}
	
	/**
	 * Search all cheatsheets!
	 * We can search by tag: /search?tag=queryexecute
	 * or by function name or tag name: /search?q=directoryList
	 */
	function search( event, rc, prc ) cache="true" cacheTimeout="30" {
		event.paramValue( "tag", "" );
		event.paramValue( "q", "" );

		// pagination setup
		cfparam( name="rc.s", default="1", type="integer" );
		var maxRows = 20;
		var startRow = int( rc.s );
		if ( startRow < 0 ) {
			startRow = 1;
		}

		var search  = getInstance( "SearchBuilder@cbElasticSearch" )
			.new(
				index = "content",
				type = "content"
			)
			.setStartRow( startRow )
			.setMaxRows( maxRows );

			if ( event.getValue( "tag" ) > "" ){
				search.match( "tags", event.getValue( "tag" ) );
			} else if ( event.getValue( "q" ) > "" ) {
				search.match( "snippet.source", event.getValue( "q" ) );
			} else {
				// just pull script cheats for now
				search.match( "snippet.type", "script" );
			}
			searchResults = search.execute();

			prc.pagination = {
				start: startRow,
				max: maxRows,
				count: arrayLen( searchResults.getHits() ),
				total: searchResults.getHitCount()
			};
		
			prc.cheats = [];
			searchResults.getHits().each( function( item ){
				prc.cheats.append( item.getMemento() );
			} );

			event.setView( "Main/List" );
		}
}