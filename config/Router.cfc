/**
 * Configure URL routes for this cb app.
 * 
 * Inherits from Router and FrameworkSuperType
 */
component {
	function configure(){
		// Turn on Full URL Rewrites, no index.cfm in the URL
		setFullRewrites( true );

		route( "/cheats/:sheet" ).to( "cheats.show" );

		// Routing by Convention
		// route( "/:handler/:action?" ).end();
	}
}