<cfoutput>
	<div class="container py-10 mx-auto">
		<div class="px-4">
			<cfif NOT ArrayLen( prc.snippets )>
				#renderView(
					view = "Utilities/_noResults"
				)#
			<cfelse>
				#renderView(
					view = "Snippets/Snippet",
					collection = prc.snippets
				)#

				#renderView(
					view = "partials/_pagination",
					args = prc.pagination
				)#
			</cfif>
		</div>
	</div>
</cfoutput>