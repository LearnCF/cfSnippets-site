<cfoutput>
	<article class="cheat">
		<h2>#encodeForHTML( Cheat.title )#</h2>
		<cfif structKeyExists( Cheat, "description" ) && Len( Cheat.description ) GT 0>
			<p>#encodeForHTML( Cheat.description )#</p>
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
			<pre class="h1js h1js-#lang#"><code># Cheat.snippet.source #</code></pre>
		</cfif>
		<cfif structKeyExists( Cheat, "tags" )>
			<div class="cheat__footer">
				<cfloop array="#Cheat.tags#" index="tag">
					<span><a href="#event.buildLink( 'tag.#tag#' )#">#encodeForHTML( tag )#</a></span>
				</cfloop>
			</div>
		</cfif>
	</article>
</cfoutput>