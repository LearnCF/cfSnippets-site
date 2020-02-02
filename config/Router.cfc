/**
 * Configure URL routes for this cb app.
 * 
 * Inherits from Router and FrameworkSuperType
 */
component {
	function configure(){
		// Turn on Full URL Rewrites, no index.cfm in the URL
		setFullRewrites( true );

		// TODO: Enable these once I have a full listing of content
		// for most functions and tags.
		// route( "/function/:tag" ).to( "main.search" );
		// route( "/tag/:tag" ).to( "main.search" );

		route( "/search" ).to( "snippets.search" );
		route( "/snippets/:slug" ).to( "snippets.view" );
		route( "/cheatsheet/:slug" ).to( "cheatsheet.view" );

		// Routing by Convention
		route( "/:handler/:action?" ).end();
	}
}