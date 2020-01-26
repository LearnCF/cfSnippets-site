component {

	/**
	 * After the config has loaded on first startup or reinit, I think.
	 */
	void function afterConfigurationLoad( event, interceptData ){
		getESClient().deleteIndex( "snippets" );
		if ( !getESClient().indexExists( "snippets" ) ){
			createIndex();
		}
		// TODO: Make a "reloadData=1" URL parameter so this expensive ES indexing doesn't happen on reinit all the time.
		if ( true ){
			populateIndex( getDataFiles() );
		}
	}
	/**
	 * Creates the snippets index
	 */
	private function createIndex(){
		getIndexBuilder().new(
			"snippets",
			{
				"_doc" = {
					"_all" = { "enabled" = false },
					"properties" = {
						"title" = { "type" = "text" },
						"tags" = { "type" = "keyword" },
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
	 * Pull the snippet JSON files from the cfsnippets data repository.
	 * @returns {Array} array of file names ONLY, to be paired with the content directory for fileRead() calls.
	 */
	array function getDataFiles(){
		var path = getSetting( "contentPath" );
		return directoryList(
			path = expandPath( path ),
			recurse = false,
			listInfo = "name",
			filter = "*.json",
			type = "file"
		);
	}

	function populateIndex( required array files ){
		files.each( function( filename ) {
			var filepath = expandPath( getSetting( "contentPath" ) ) & "/" & filename;
			if ( fileExists( filepath ) ){
				var data = fileRead( filepath );
				if ( isJSON( data ) ){
					saveNewESDocument( deSerializeJSON( data ) );
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
		string type = "_doc"
	){
		var result = getDocument()
		.new(
			index = arguments.index,
			type = arguments.type,
			properties = arguments.data
		)
		.save();
	}

	Client function getESClient() provider="Client@cbElasticsearch"{}

	IndexBuilder function getIndexBuilder() provider="IndexBuilder@cbElasticsearch"{}

	Document function getDocument() provider="Document@cbElasticsearch"{}
}