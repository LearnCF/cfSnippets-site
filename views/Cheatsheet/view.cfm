<cfoutput>
	<cfif StructIsEmpty( prc.page ) || NOT ArrayLen( prc.snippets )>
		#renderView(
			view = "Utilities/_noResults"
		)#
	<cfelse>
		#renderView(
			view = "Snippets/Results"
		)#
	</cfif>
	#renderView( "partials/_signup" )#
</cfoutput>