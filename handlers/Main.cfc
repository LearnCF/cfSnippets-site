/**
 * Handle general routes in CFSnippets app
 */
component extends="BaseHandler" {

    function index( event, rc, prc ){

        prc.page = {
            title : "CFSnippets",
            subtitle : "Searchable CFML examples and cheat sheets in modern script syntax"
        };
        
        prc.cheatsheets = getInstance( "Cheatsheets" )
            .getAll()
            .getHits();
    }

}