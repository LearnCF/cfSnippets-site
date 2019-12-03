component {
	function configure(){
		coldbox = {
		};
		environments = {
			development : "127.*,local.*"
		};
		settings = {
			cheatsheetPath : getSystemSetting("cheatsheet_path", "resources/cheatsheets"),
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
		coldbox.handlerCaching = false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	}

}