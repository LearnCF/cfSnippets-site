/**
* The base interceptor test case will use the 'interceptor' annotation as the instantiation path to the interceptor
* and then create it, prepare it for mocking, and then place it in the variables scope as 'interceptor'. It is your
* responsibility to update the interceptor annotation instantiation path.
*/
component extends="coldbox.system.testing.BaseInterceptorTest" interceptor="interceptors.InitIndex"{
	
	/*********************************** LIFE CYCLE Methods ***********************************/

	function beforeAll(){
		super.beforeAll();
		
		// interceptor configuration properties, if any
		configProperties = {};
		// init and configure interceptor
		super.setup();
		// mock the ES client
		variables.mockClient = getMockBox().createMock( "modules.cbElasticSearch.models.Client" );
		mockClient.$( "indexExists", false )
							.$( "deleteIndex", mockClient );
	
		// mock the ES index builder
		variables.mockIndexBuilder = getMockBox().createMock( "modules.cbElasticSearch.models.IndexBuilder" );
		mockClient.$( "new", mockIndexBuilder )
							.$( "save", mockIndexBuilder );

		interceptor.$("getESClient", mockClient )
							 .$("getIndexBuilder", mockIndexBuilder )
							 .$property( propertyName = "getSetting", mock = function( string setting ) {
								if ( arguments.setting == "contentPath" ){
									return getTempDirectory();
								}
							 });
	}

	function afterAll(){
		// do your own stuff here
		super.afterAll();
	}
	
	/*********************************** BDD SUITES ***********************************/
	
	function run(){

		describe( "interceptors.InitIndex", function(){
			
			it( "should configure correctly", function(){
				interceptor.configure();
				// Expectations here.
				expect( false ).toBeTrue();
			});
			
			it( "should create index on afterConfigurationLoad", function(){
				// mocks
				var mockEvent = getMockRequestContext();
				var mockData  = {};
				
				// execute afterConfigurationLoad
				interceptor.afterConfigurationLoad( mockEvent, mockData );
				
				// expectations here
				expect( variables.mockIndexBuilder.$atLeast( 1, "new") ).toBeTrue( "should call indexBuilder.new() ");
				expect( variables.mockIndexBuilder.$atLeast( 1, "save") ).toBeTrue( "should call indexBuilder.save() ");
			});

			describe( "JSON file import", function() {
				var dummyFilePath = getTempDirectory() & "myDummyFile.json";
				beforeEach(function() {
					var dummyJSONData = serializeJSON( {
						"name" : "myDummyFile",
						"age" : "13"
					} );
					fileWrite( dummyFilePath, dummyJSONData );
				});
				afterEach(function() {
					if ( fileExists( dummyFilePath ) ){
						fileDelete( dummyFilePath );
					}
				});

				it( "finds the dummy JSON snippet file", function() {
					var snippetFilenames = interceptor.getDataFiles();
					expect( snippetFilenames ).toBeArray( "should be array of filenames" );
					expect( snippetFilenames.len() ).toBeGT( 0, "should have at least our dummy snippet file" );
					expect( arrayFind( snippetFilenames, "myDummyFile.json" ) ).toBeGT( 0, "should find our dummy snippet file name" );
				});
			});

			
		});

	}
	
}
