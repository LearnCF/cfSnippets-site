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

		var search  = getInstance( "SearchBuilder@cbElasticSearch" )
			.new(
				index = "content",
				type = "content"
			);

			if ( event.getValue( "tag" ) > "" ){
				search.match( "tags", event.getValue( "tag" ) );
			} else if ( event.getValue( "q" ) > "" ) {
				search.match( "snippet.source", event.getValue( "q" ) );
			} else {
				// just pull script cheats for now
				search.match( "snippet.type", "script" );
			}
			search = search.execute();
		
			prc.cheats = [];
			search.getHits().each( function( item ){
				prc.cheats.append( item.getMemento() );
			} );

			event.setView( "Main/List" );
		}
}