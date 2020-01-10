<cfoutput>
	<h2>#encodeForHTML( Cheat.title )#</h2>
	<p>#encodeForHTML( Cheat.body )#</p>
	<cfif structKeyExists(Cheat.snippet, "source")
		&& len( Cheat.snippet.source ) GT 0>
		<cfset lang = "javascript">
		<cfif Cheat.snippet.type EQ "tag">
			<cfset lang = "html" />
		</cfif>
		<pre class="h1js h1js-#lang#"><code># Cheat.snippet.source #</code></pre>
	</cfif>
</cfoutput>