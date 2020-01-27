<cfoutput>
	<cfif StructIsEmpty( prc.cheatsheet ) || NOT ArrayLen( prc.cheats )>
		#renderView(
			view = "Utilities/_noResults"
		)#
	<cfelse>
		#renderView(
			view = "partials/_header"
		)#
		#renderView(
			view = "Main/Results"
		)#
	</cfif>
</cfoutput>