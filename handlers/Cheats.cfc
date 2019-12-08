/**
 * Handles all cheatsheet url routes.
*/
component extends="BaseHandler" {
	property name="cheatSheetPath" inject="coldbox:setting:cheatsheetPath";

	function index( event, rc, prc ){
		event.setView( "cheats.index" );
	}

	function show( event, rc, prc ) cached="true" {
		var filename = "#expandPath( variables.cheatSheetPath )#/#rc.sheet#.md";
		if ( fileExists( filename ) && fileGetMimeType( filename ) == "text/x-web-markdown" ) {
			var file = fileRead( filename );
			prc.html = application.wirebox.getInstance( "Processor@cbmarkdown" ).toHTML( file );
			prc.page.title = rc.sheet;
			event.setView( "cheats/show" );
		} else {
			renderPageNotFound( argumentCollection = arguments )
		}
	}
}