component {

	/**
	 * Initialize the ElasticSearch index on app load/reinit
	 */
	void function afterConfigurationLoad( event, interceptData ){
		try {
			var recreateIndex = true;

			if( recreateIndex ){
				getESClient().deleteIndex( "snippets" );
				getESClient().deleteIndex( "cheatsheets" );
			}
			
			if ( !getESClient().indexExists( "snippets" ) ){
				createSnippetIndex();
			}
			if ( !getESClient().indexExists( "cheatsheets" ) ){
				createCheatSheetIndex();
			}

			if ( recreateIndex ){
				var snippetPath = getSetting( "contentPath" ) & "/snippets/";
				populateIndex(
					files = getDataFiles( path = snippetPath ),
					path = snippetPath,
					index = "snippets"
				);
				var cheatsheetPath = getSetting( "contentPath" ) & "/cheatsheets/";
				populateIndex(
					files = getDataFiles( path = cheatsheetPath ),
					path = cheatsheetPath,
					index = "cheatsheets"
				);
			}
		} catch( io.searchbox.client.config.exception.CouldNotConnectException exception ){
			writeOutput( "Unable to connect to ElasticSearch." );
			abort;
		} catch( cbElasticsearch.JestClient.IndexCreationException exception ){
			writeOutput( "Unable to create index, is ElasticSearch up?" );
			abort;
		}
	}

	/**
	 * Creates the snippets index
	 */
	private function createSnippetIndex(){
		getIndexBuilder().new(
			"snippets",
			{
				"_doc" = {
					"_all" = { "enabled" = false },
					"properties" = {
						"slug" = { "type" = "keyword" },
						"title" = { "type" = "text" },
						"cheatsheets" = { "type" = "keyword" },
						"description" = { "type" = "text" },
						"snippet" = {
							"type" = "object",
							"properties" = {
								"type" = { "type" = "keyword" },
								"source" = { "type" = "text" }
							}
						} 
					}
				}
			}
		).save();
	}

	/**
	 * Creates the cheatsheets index
	 */
	private function createCheatSheetIndex(){
		getIndexBuilder().new(
			"cheatsheets",
			{
				"_doc" = {
					"_all" = { "enabled" = false },
					"properties" = {
						"title" = { "type" = "text" },
						"description" = { "type" = "text" },
						"slug" = { "type" = "keyword" }
					}
				}
			}
		).save();
	}

	/**
	 * Pull the snippet JSON files from the cfsnippets data repository.
	 * @returns {Array} array of file names ONLY, to be paired with the content directory for fileRead() calls.
	 */
	array function getDataFiles( required string path ){
		return directoryList(
			path = expandPath( arguments.path ),
			recurse = false,
			listInfo = "name",
			filter = "*.json",
			type = "file"
		);
	}

	function populateIndex(
		required string path,
		required array files,
		string index = "snippets"
	){
		files.each( function( filename ) {
			var filepath = expandPath( path ) & filename;
			if ( fileExists( filepath ) ){
				var json = fileRead( filepath );
				if ( isJSON( json ) ){
					var data = deSerializeJSON( json );
					data["slug"] = replace(filename, ".json", "");
					saveNewESDocument(
						data = data,
						index = index,
						id = data.slug
					);
				}
			}
		} );

		// bulk save
		// TODO: Get it working by removing whitespace from the JSON data first
		// @cite https://stackoverflow.com/a/48131671
		// getESClient().saveAll( documents );
	}
		
	/**
	 * Save a given data object to a new document in ES.
	 *
	 * @data {Struct} the data object after derializing from JSON to struct.
	 */
	private function saveNewESDocument(
		required struct data,
		string index = "snippets",
		string type = "_doc",
		string id = ""
	){
		var document = getDocument()
		.new(
			index = arguments.index,
			type = arguments.type,
			properties = arguments.data
		);
		if ( arguments.id > "" ){
			document = document.setId( arguments.id );
		}
		document.save();
	}

	Client function getESClient() provider="Client@cbElasticsearch"{}

	IndexBuilder function getIndexBuilder() provider="IndexBuilder@cbElasticsearch"{}

	Document function getDocument() provider="Document@cbElasticsearch"{}
}