<cfoutput>
	<article class="mb-10 bg-white border-2 border-purple-900 rounded-lg shadow-lg snippet">
			<div class="px-6 py-8">
				<h2 class="text-2xl font-bold tracking-wide text-gray-900">#encodeForHTML( snippet.title )#</h2>
				<cfif structKeyExists( snippet, "description" ) && Len( snippet.description ) GT 0>
					<div class="mt-4 text-gray-700">#snippet.description#</div>
				</cfif>
				<cfif structKeyExists(snippet.snippet, "source")
					&& len( snippet.snippet.source ) GT 0>
					<cfset lang = "javascript">
					<cfif snippet.snippet.type EQ "tag">
						<cfset lang = "html" />
					</cfif>
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
			</div>
			<pre class="h1js h1js-#lang#"><code class="p-6 rounded-b"># snippet.snippet.source #</code></pre>
		</cfif>
	</article>
</cfoutput>