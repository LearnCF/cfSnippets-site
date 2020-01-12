<cfoutput>
	<article class="px-4 py-4 mb-10 shadow cheat">
		<h2 class="text-2xl font-bold tracking-wide text-gray-900">#encodeForHTML( Cheat.title )#</h2>
		<cfif structKeyExists( Cheat, "description" ) && Len( Cheat.description ) GT 0>
			<p class="my-4 text-gray-700">#encodeForHTML( Cheat.description )#</p>
		</cfif>
		<cfif structKeyExists( Cheat, "body" ) && Len( Cheat.body ) GT 0>
			<p class="my-4">#encodeForHTML( Cheat.body )#</p>
		</cfif>
		<cfif structKeyExists(Cheat.snippet, "source")
			&& len( Cheat.snippet.source ) GT 0>
			<cfset lang = "javascript">
			<cfif Cheat.snippet.type EQ "tag">
				<cfset lang = "html" />
			</cfif>
			<pre class="h1js h1js-#lang# my-2"><code># Cheat.snippet.source #</code></pre>
		</cfif>
<!---
	Hide tag list for the moment.
			 --->
 		<cfif structKeyExists( Cheat, "tags" )>
			<div class="py-2 cheat__footer">
				<cfloop array="#Cheat.tags#" index="tag">
					<span class="px-1 py-1 text-sm text-white bg-blue-800 rounded"><a href="#event.buildLink( 'tag.#tag#' )#">#encodeForHTML( tag )#</a></span>
				</cfloop>
			</div>
		</cfif>
	</article>
</cfoutput>