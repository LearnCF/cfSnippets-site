<cfoutput>
	<cfif NOT ArrayLen( prc.cheats )>
		<p class="alert alert-info">No results found.</p>
	<cfelse>
		#renderView(
			view = "Main/Cheat",
			collection = prc.cheats
		)#

		#renderView(
			view = "partials/pagination",
			args = prc.pagination
		)#
	</cfif>
</cfoutput>