component extends="BaseHandler"{

	/**
	* index
	*/
	function index( event, rc, prc ){
		prc.page.title = "cfCheats";
		prc.page.subtitle = "Simple, practical cheatsheets for CFML";
		event.setView( "Main/index" );
	}

}