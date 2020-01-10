/**
 * Handles all cheatsheet url routes.
*/
component extends="BaseHandler" {
	property name="contentPath" inject="coldbox:setting:contentPath";

	// function index( event, rc, prc ){
	// }

	function show( event, rc, prc ) cached="true" {
		event.paramValue( "page", "" );
		var filename = "#expandPath( variables.contentPath )#/#lcase( rc.page )#.md";
		if ( fileExists( filename ) && fileGetMimeType( filename ) == "text/x-web-markdown" ) {
			var file = fileRead( filename );
			prc.html = application.wirebox.getInstance( "Processor@cbmarkdown" ).toHTML( file );
			prc.page.title = rc.page;
			event.setView( "page/show" );
		} else {
			renderPageNotFound( argumentCollection = arguments )
		}
	}
}