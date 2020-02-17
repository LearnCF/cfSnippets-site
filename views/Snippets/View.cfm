<cfif structKeyExists( prc, "snippet" ) && !structKeyExists( variables, "snippet" )>
	<cfset variables.snippet = prc.snippet />
</cfif>

<cfoutput>
	<div class="container mx-auto">
		<article class="my-10 bg-purple-900">
			<cfif structKeyExists(snippet.snippet, "source")
			&& len( snippet.snippet.source ) GT 0>
			<cfset lang = "javascript">
			<cfif snippet.snippet.type EQ "tag">
				<cfset lang = "html" />
			</cfif>
				<pre class="h1js h1js-#lang#"><code class="p-6 rounded-b"># snippet.snippet.source #</code></pre>
			</cfif>
		</article>
	</div>

	#renderView( "partials/_signup" )#
</cfoutput>