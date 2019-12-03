/**
 * Handles all cheatsheet url routes.
*/
component extends="BaseHandler" {
	property name="cheatSheetPath" inject="coldbox:settings:cheatsheetPath";

	function index( event, rc, prc ){
		event.setView( "cheats.index" );
	}

	function show( event, rc, prc ){
		var filename = expand( variables.cheatSheetPath ) & rc.sheet & ".md";
		if ( fileExists( filename ) && fileGetMimeType( filename ) == "text/plain" ) {
			var file = fileRead( filename );
			prc.html = application.wirebox.getInstance( "Processor@cbmarkdown" ).toHTML( file );
			event.setView( "cheats.show" );
		} else {
			event.setView( "Utilities.fourOhFour" );
		}
	}
}