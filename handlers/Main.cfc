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

		var search  = getInstance( "SearchBuilder@cbElasticSearch" )
			.new(
				index = "snippets",
				type = "_doc"
			)
			.setStartRow( startRow )
			.setMaxRows( maxRows );

			if ( event.getValue( "tag" ) > "" ){
				search.match( "tags", event.getValue( "tag" ) );
			} else if ( event.getValue( "cheatsheet" ) > "" ){
				search.match( "cheatsheets", event.getValue( "cheatsheet" ) );
			} else if ( event.getValue( "q" ) > "" ) {
				search.multiMatch(
					names = [ "title", "description", "snippet.source", "tags" ],
					value = event.getValue( "q" )
				);
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

			event.setView( "Main/Results" );
		}
}