<cfoutput>
	<article class="p-6 mb-10 shadow-lg border-2 border-green-100 cheat">
		<h2 class="text-2xl font-bold tracking-wide text-gray-900">#encodeForHTML( Cheat.title )#</h2>
		<cfif structKeyExists( Cheat, "description" ) && Len( Cheat.description ) GT 0>
			<div class="my-4 text-gray-700">#Cheat.description#</div>
		</cfif>
		<cfif structKeyExists(Cheat.snippet, "source")
			&& len( Cheat.snippet.source ) GT 0>
			<cfset lang = "javascript">
			<cfif Cheat.snippet.type EQ "tag">
				<cfset lang = "html" />
			</cfif>
			<pre class="h1js h1js-#lang# my-4"><code># Cheat.snippet.source #</code></pre>
		</cfif>
<!---
	Hide tag list for the moment.
			 --->
 		<cfif structKeyExists( Cheat, "tags" )>
			<div class="py-2 cheat__footer">
				<cfloop array="#Cheat.tags#" index="tag">
					<span class="px-2 py-1 text-sm text-white bg-blue-800 rounded"><a href="#event.buildLink( 'tag.#tag#' )#">#encodeForHTML( tag )#</a></span>
				</cfloop>
			</div>
		</cfif>
	</article>
</cfoutput>