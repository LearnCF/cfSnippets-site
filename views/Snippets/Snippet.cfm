<cfif structKeyExists( prc, "snippet" ) && !structKeyExists( variables, "snippet" )>
	<cfset variables.snippet = prc.snippet />
</cfif>

<cfoutput>
	<article class="mb-10 bg-white border-2 border-purple-900 rounded-lg shadow-lg snippet">
		<div class="px-6 py-8">
			<h2 class="text-2xl font-bold tracking-wide text-gray-900">
				<a href="#event.buildLink( 'snippets.#snippet.slug#' )#">#encodeForHTML( snippet.title )#</a>
			</h2>
			<cfif structKeyExists( snippet, "description" ) && Len( snippet.description ) GT 0>
				<div class="mt-4 text-gray-700">#snippet.description#</div>
			</cfif>

			#renderView( view = "Snippets/Source", args = { "source": snippet.snippet } )#

			<!---
				Hide tag list for the moment.
						<cfif structKeyExists( snippet, "tags" )>
						<div class="py-2 snippet__footer">
							<cfloop array="#snippet.tags#" index="tag">
								<span class="px-2 py-1 text-sm text-white bg-blue-800 rounded"><a href="#event.buildLink( 'tag.#tag#' )#">#encodeForHTML( tag )#</a></span>
							</cfloop>
						</div>
					</cfif>
			--->
	</article>
</cfoutput>