component extends="BaseHandler"{
	function index( event, rc, prc ){
		// do summat!!
	}
	
	function tag( event, rc, prc ){
		var searchResults  = getInstance( "SearchBuilder@cbElasticSearch" )
			.new(
				index = "content",
				type = "content"
			)
			.match( "tags", event.getValue( "tag", "" ) )
			.execute();
		
			prc.cheats = [];
			searchResults.getHits().each( function( item ){
				prc.cheats.append( item.getMemento() );
			} );

			event.setView( "Main/List" );
		}
}