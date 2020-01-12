component {

	void function postModuleLoad( event, interceptData ){
		getESClient().deleteIndex( "content" );
		if ( !getESClient().indexExists( "content" ) ){
			createIndex();
		}
		// TODO: Make a "reloadData=1" URL parameter so this expensive ES indexing doesn't happen on reinit all the time.
		if ( true ){
			populateIndex( getDataFiles() );
		}
	}
	/**
	 * Creates the content index
	 */
	private function createIndex(){
		getIndexBuilder().new(
			"content",
			{
				"content" = {
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

	private array function getDataFiles(){
		var path = getSetting( "contentPath" );
		return directoryList(
			path = expandPath( path ),
			recurse = true,
			listInfo = "name",
			filter = "*.json",
			type = "file"
		);
	}

	private function populateIndex( required array files ){
		files.each( function( filename ) {
			var filepath = expandPath( getSetting( "contentPath" ) ) & "/" & filename;
			if ( fileExists( filepath ) ){
				var data = fileRead( filepath );
				if ( isJSON( data ) ){
					var result = getDocument()
					.new(
						index = "content",
						type = "content",
						properties = deSerializeJSON( data )
					)
					.save();
				}
			}
		} );

		// bulk save
		// TODO: Get it working by removing whitespace from the JSON data first
		// @cite https://stackoverflow.com/a/48131671
		// getESClient().saveAll( documents );
	}

	Client function getESClient() provider="Client@cbElasticsearch"{}

	IndexBuilder function getIndexBuilder() provider="IndexBuilder@cbElasticsearch"{}

	Document function getDocument() provider="Document@cbElasticsearch"{}
}