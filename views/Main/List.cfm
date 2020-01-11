<cfoutput>
	<div class="-mt-8">
		<cfif NOT ArrayLen( prc.cheats )>
			<p class="alert alert-info">No results found.</p>
		<cfelse>
			#renderView(
				view = "Main/Cheat",
				collection = prc.cheats
			)#
		</cfif>
	</div>
</cfoutput>