/**
 * Helper methods and interception stuff for API route handlers.
 */
component {
	function preProcess( event, rc, prc ){
		prc.meta = {
			title : "CFML Cheatsheets",
			author: getSetting( "meta.author", "Michael Born" ),
			description: getSetting("meta.description", "CFML Cheatsheets")
		};
	}
}