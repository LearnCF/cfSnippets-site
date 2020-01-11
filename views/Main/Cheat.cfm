<cfoutput>
	<article class="cheat shadow py-4 px-4 mb-10">
		<h2 class="text-2xl text-gray-700">#encodeForHTML( Cheat.title )#</h2>
		<cfif structKeyExists( Cheat, "description" ) && Len( Cheat.description ) GT 0>
			<p class="text-gray-500">#encodeForHTML( Cheat.description )#</p>
		</cfif>
		<cfif structKeyExists( Cheat, "body" ) && Len( Cheat.body ) GT 0>
			<p>#encodeForHTML( Cheat.body )#</p>
		</cfif>
		<cfif structKeyExists(Cheat.snippet, "source")
			&& len( Cheat.snippet.source ) GT 0>
			<cfset lang = "javascript">
			<cfif Cheat.snippet.type EQ "tag">
				<cfset lang = "html" />
			</cfif>
			<pre class="h1js h1js-#lang# my-2"><code># Cheat.snippet.source #</code></pre>
		</cfif>
		<cfif structKeyExists( Cheat, "tags" )>
			<div class="cheat__footer py-2">
				<cfloop array="#Cheat.tags#" index="tag">
					<span class="bg-green-500 text-white text-sm py-1 px-1 rounded"><a href="#event.buildLink( 'tag.#tag#' )#">#encodeForHTML( tag )#</a></span>
				</cfloop>
			</div>
		</cfif>
	</article>
</cfoutput>