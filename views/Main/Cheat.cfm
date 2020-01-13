<cfoutput>
	<article class="mb-10 shadow-lg border-2 border-blue-900 cheat rounded-lg">
			<div class="px-6 py-8">
				<h2 class="text-2xl font-bold tracking-wide text-gray-900">#encodeForHTML( Cheat.title )#</h2>
				<cfif structKeyExists( Cheat, "description" ) && Len( Cheat.description ) GT 0>
					<div class="text-gray-700 mt-4">#Cheat.description#</div>
				</cfif>
				<cfif structKeyExists(Cheat.snippet, "source")
					&& len( Cheat.snippet.source ) GT 0>
					<cfset lang = "javascript">
					<cfif Cheat.snippet.type EQ "tag">
						<cfset lang = "html" />
					</cfif>
					<!---
						Hide tag list for the moment.
							 <cfif structKeyExists( Cheat, "tags" )>
								<div class="py-2 cheat__footer">
									<cfloop array="#Cheat.tags#" index="tag">
										<span class="px-2 py-1 text-sm text-white bg-blue-800 rounded"><a href="#event.buildLink( 'tag.#tag#' )#">#encodeForHTML( tag )#</a></span>
									</cfloop>
								</div>
							</cfif>
					--->
			</div>
			<pre class="h1js h1js-#lang#"><code class="p-6 rounded-b"># Cheat.snippet.source #</code></pre>
		</cfif>
	</article>
</cfoutput>