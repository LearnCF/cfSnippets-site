component {
	function configure(){
		coldbox = {
			environments = {
				development: "127.0.0.1,local.*"
			}
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