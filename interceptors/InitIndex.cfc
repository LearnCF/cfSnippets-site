component {

	/**
	 * After the config has loaded on first startup or reinit, I think.
	 */
	void function afterConfigurationLoad( event, interceptData ){
		getESClient().deleteIndex( "snippets" );
		getESClient().deleteIndex( "cheatsheets" );
		if ( !getESClient().indexExists( "snippets" ) ){
			createSnippetIndex();
		}
		if ( !getESClient().indexExists( "cheatsheets" ) ){
			createCheatSheetIndex();
		}
		// TODO: Make a "reloadData=1" URL parameter so this expensive ES indexing doesn't happen on reinit all the time.
		if ( true ){
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