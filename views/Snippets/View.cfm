<cfif structKeyExists( prc, "snippet" ) && !structKeyExists( variables, "snippet" )>
	<cfset variables.snippet = prc.snippet />
</cfif>

<cfoutput>
	<div class="container mx-auto">
		<article class="my-10">
			<cfif isArray( snippet.snippet )>
				#renderView( view = "Snippets/source", collection = snippet.snippet, collectionAs = "source" )#
			<cfelse>
				#renderView( view = "Snippets/source", args = { "source": snippet.snippet } )#
			</cfif>
		</article>
	</div>
</cfoutput>