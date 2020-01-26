/*******************************************************************************
*	Integration Test as BDD (CF10+ or Railo 4.1 Plus)
*
*	Extends the integration class: coldbox.system.testing.BaseTestCase
*
*	so you can test your ColdBox application headlessly. The 'appMapping' points by default to 
*	the '/root' mapping created in the test folder Application.cfc.  Please note that this 
*	Application.cfc must mimic the real one in your root, including ORM settings if needed.
*
*	The 'execute()' method is used to execute a ColdBox event, with the following arguments
*	* event : the name of the event
*	* private : if the event is private or not
*	* prePostExempt : if the event needs to be exempt of pre post interceptors
*	* eventArguments : The struct of args to pass to the event
*	* renderResults : Render back the results of the event
*******************************************************************************/
component extends="coldbox.system.testing.BaseTestCase" appMapping="/"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		// Better performance for multiple test specs.
		// @cite https://coldbox.ortusbooks.com/testing/testing-coldbox-applications/integration-testing/life-cycle-events
		// this.unloadColdBox=false
		// do your own stuff here
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "Search Page", function(){

			beforeEach(function( currentSpec ){
				// Setup as a new ColdBox request for this suite, VERY IMPORTANT. ELSE EVERYTHING LOOKS LIKE THE SAME REQUEST.
				setup();
			});

			it( "+Renders search results for home page", function(){
				var event = execute( route = "/", renderResults=true );
				expect(	event.getValue( name="cheats", private=true ) ).toBeArray( "should be array of snippets" );
				expect(	event.getValue( name="cheats", private=true ).len() ).toBeGT( 0, "should be array of snippets" );
			});

			it( "+Returns results by keyword search", function(){
				var event = execute(
					route = "/search?q=fileExists",
					renderResults=true
				);
				expect(	event.getValue( name="cheats", private=true ) ).toBeArray( "should be array of snippets" );
				expect(	event.getValue( name="cheats", private=true ).len() ).toBeGT( 0, "should be array of snippets" );
			});

			it( "+Returns results by cheatsheet search", function(){
				var event = execute(
					route = "/cheatsheet/error-handling",
					renderResults=true
				);
				expect(	event.getValue( name="cheats", private=true ) ).toBeArray( "should be array of snippets" );
				expect(	event.getValue( name="cheats", private=true ).len() ).toBeGT( 0, "should be array of snippets" );
			});
		
		});

	}

}
