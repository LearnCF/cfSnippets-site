/**
 * Configure URL routes for this cb app.
 * 
 * Inherits from Router and FrameworkSuperType
 */
component {
	function configure(){
		// Turn on Full URL Rewrites, no index.cfm in the URL
		setFullRewrites( true );

		route( "/tag/:tag" ).to( "main.search" );

		route( "/search" ).to( "main.search" );

		// Routing by Convention
		route( "/:handler/:action?" ).end();
	}
}