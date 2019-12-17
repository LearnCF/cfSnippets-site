/**
 * Configure URL routes for this cb app.
 * 
 * Inherits from Router and FrameworkSuperType
 */
component {
	function configure(){
		// Turn on Full URL Rewrites, no index.cfm in the URL
		setFullRewrites( true );
		
		route( "/:page" )
			.to( "page.show" );

		route( "/" )
			.rc("page", "readme")
			.to( "page.show" );

		// Routing by Convention
		// route( "/:handler/:action?" ).end();
	}
}