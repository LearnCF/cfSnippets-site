component {
	function configure(){
		coldbox = {
			// allow Coldbox to introspect event handlers to look for caching annotations.
			eventCaching : true,
			// cache handlers as singletons. Try NOT to set this to true in development, and try NOT to set it to false in production.
			handlerCaching : true,
			// enable Coldbox to cache a rendered view IF `cache=true` is passed to `renderView()`.
			viewCaching : true,
			// How to handle page not found requests?
			onInvalidEventHandler = "main.renderPageNotFound"
		};
		environments = {
			development : "127.*,local.*"
		};
		settings = {
			contentPath : getSystemSetting("CONTENT_PATH", "resources/cheatsheets/data/en"),
			meta_author : getSystemSetting( "META_AUTHOR", "Michael Born" ),
			meta_title : getSystemSetting( "META_TITLE", "CFML Cheatsheets" ),
			meta_description : getSystemSetting( "META_DESCRIPTION", "CFML Cheatsheets" )
		};
	}

	/**
	 * Development-specific settings
	 */
	function development(){
		coldbox.reinitPassword = "";
		coldbox.eventCaching = false;
		coldbox.viewCaching = false;
		coldbox.handlerCaching = false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	}

}