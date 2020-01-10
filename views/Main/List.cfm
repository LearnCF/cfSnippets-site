<cfoutput>
	<cfif NOT ArrayLen( prc.cheats )>
		<p class="alert alert-info">No results found.</p>
	<cfelse>
		#renderView(
			view = "Cheat",
			collection = prc.cheats
		)#
	</cfif>
</cfoutput>