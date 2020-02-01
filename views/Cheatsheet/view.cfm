<cfoutput>
	<cfif StructIsEmpty( prc.page ) || NOT ArrayLen( prc.snippets )>
		#renderView(
			view = "Utilities/_noResults"
		)#
	<cfelse>
		#renderView(
			view = "Main/Results"
		)#
	</cfif>
</cfoutput>