<!--- Support rendering this view with a "source" struct argument --->
<cfif structKeyExists( args, "source" )>
    <cfset var source = args.source />
</cfif>
<!--- <cfdump var="#variables.source#" /><cfabort /> --->
<cfoutput>
    <div class="my-4">
        <cfset lang = "javascript">
        <cfif source.type EQ "tag">
            <cfset lang = "html" />
        </cfif>
        <cfif source.keyExists( "description" )>
            <p class="mb-4">#row.description#</p>
        </cfif>
        <pre class="h1js h1js-#lang#"><code class="p-6">#source.source#</code></pre>
    </div>
</cfoutput>