/**
 * Helper methods and interception stuff for API route handlers.
 */
component {
	function preHandler( event, rc, prc ){
		prc.meta = {
			title : "CF Snippets",
			author: getSetting( "meta_author" ),
			description: getSetting("meta_description" )
		};

		if ( event.getValue( "q", "" ) > "" ){
			prc.meta.title &= " for '#event.getValue( "q" )#'";
		} else if ( event.getValue( "tag", "" ) > "" ){
			prc.meta.title = "#event.getValue( "tag" )# CF Snippets";
		}
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