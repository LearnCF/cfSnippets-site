/**
 * Helper methods and interception stuff for API route handlers.
 */
component {
	function preHandler( event, rc, prc ){
		prc.meta = {
			title : "CFML Cheatsheets",
			author: getSetting( "meta_author" ),
			description: getSetting("meta_description" )
		};

		// Make sure the search parameter exists
		event.paramValue( "search", "" );
	}

	function renderPageNotFound( event, rc, prc ){
		prc.meta.title = "Page Not Found";
		prc.page.title = "Page Not Found";
		prc.page.subtitle = "So sorry.";
		event.setView( "Utilities/FourOhFour" );
	}

	function onInvalidHTTPMethod( event, rc, prc ){
		// Handle bad HTTP method, like POST instead of GET.
	}
}