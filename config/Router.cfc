/**
 * Configure URL routes for this cb app.
 * 
 * Inherits from Router and FrameworkSuperType
 */
component {
	function configure(){
		// Turn on Full URL Rewrites, no index.cfm in the URL
		setFullRewrites( true );

		route( "/tag/:tag" ).to( "main.tag" );

		// Routing by Convention
		route( "/:handler/:action?" ).end();
	}
}