/**
 * Provides a base for models extending the ES search documents.
*/
component accessors="true" mappedSuperClass="true"{
	
	// Properties
	property name="SearchBuilder" inject="SearchBuilder@cbElasticSearch";

	// search results
  property name="hits" type="array";
	property name="paging" type="struct";
	
	// pagination
  property name="maxRows" type="Number" default="10";
  property name="startRow" type="Number" default="0";

	/**
	 * Constructor
	 */
  public function init(){
    return this;
	}

  package component function normalizeSearchResult( required component search ){
		
		// normalize hits into array
		var items = [];
		arguments.search.getHits().each( function( item ){
			items.append( arguments.item.getMemento() );
		} );
		setHits( items );

		// normalize pagination
		setPaging( {
			start: getStartRow(),
			max: getMaxRows(),
			count: arrayLen( getHits() ),
			total: arguments.search.getHitCount()
		} );

		return this;
  }
}