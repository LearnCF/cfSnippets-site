component {
	function configure(){
		coldbox = {
			// allow Coldbox to introspect event handlers to look for caching annotations.
			eventCaching : true,
			// cache handlers as singletons. Try NOT to set this to true in development, and try NOT to set it to false in production.
			handlerCaching : true,
			// enable Coldbox to cache a rendered view IF `cache=true` is passed to `renderView()`.
			viewCaching : true,
			// How to handle page not found requests?
			onInvalidEventHandler : "main.renderPageNotFound",
			// The page to render if no other event is found. (e.g. Homepage!)
			defaultEvent : "Main.search"
		};
		environments = {
			development : "127.*,local.*",
			production  : "cfsnippets.com"
		};
		settings = {
			contentPath : expandPath( getSystemSetting("CONTENT_PATH", "/cfSnippets/data/en") ),
			meta_author : getSystemSetting( "META_AUTHOR", "Michael Born" ),
			meta_title : getSystemSetting( "META_TITLE", "CFSnippets" ),
			meta_description : getSystemSetting( "META_DESCRIPTION", "Examples of modern CFML source code" )
		};

		moduleSettings = {
			cbElasticsearch = {
				// The native client Wirebox DSL for the transport client
        client = "JestClient@cbElasticsearch",
        // The default hosts - an array of host connections
        //  - REST-based clients (e.g. JEST):  round robin connections will be used
        //  - Socket-based clients (e.g. Transport):  cluster-aware routing used
				hosts = [{
					serverProtocol: "http",
					serverName: getSystemSetting( "ES_HOST", "127.0.0.1" ),
					serverPort: getSystemSetting( "ES_PORT", "9200" )
				}],
				// The default index
        defaultIndex = "snippets",
        // The default number of shards to use when creating an index
        defaultIndexShards = 3,
        // The default number of index replicas to create
        defaultIndexReplicas = 0,
        // Whether to use separate threads for client transactions
        multiThreaded = true,
        // The maximum number of connections allowed per route ( e.g. search URI endpoint )
        maxConnectionsPerRoute = 10,
        // The maxium number of connectsion, in total for all Elasticsearch requests
        maxConnections = 100
			}
		}


		// register the interceptor which runs on app start/reinit
		// and sets up the ES index
		interceptors = [{
			class = "interceptors.InitIndex",
			properties	= {},
			name			= "InitIndex"
		}];
	}

	/**
	 * Development-specific settings
	 */
	function development(){
		coldbox.reinitPassword = "";
		coldbox.eventCaching = false;
		coldbox.viewCaching = false;
		coldbox.handlerCaching = false;
		coldbox.handlersIndexAutoReload = true;
		coldbox.customErrorTemplate = "/coldbox/system/includes/BugReport.cfm";
	}

}