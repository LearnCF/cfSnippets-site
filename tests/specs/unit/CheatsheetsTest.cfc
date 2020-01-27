/**
* The base model test case will use the 'model' annotation as the instantiation path
* and then create it, prepare it for mocking and then place it in the variables scope as 'model'. It is your
* responsibility to update the model annotation instantiation path and init your model.
*/
component extends="coldbox.system.testing.BaseModelTest" model="models.Cheatsheets"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		
		// setup the model
		super.setup();
		
		// init the model object
		model.init();
		model.setSearchBuilder( application.wirebox.getInstance( "SearchBuilder@cbElasticSearch") );
	}

	function afterAll(){
		super.afterAll();
	}

	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "Cheatsheets Suite", function(){
			it( "can pull cheatsheets from ES by slug", function() {
				var result = model.getBySlug( "error-handling" );
				expect( result ).toBeComponent();
			})			

		});

	}

}
