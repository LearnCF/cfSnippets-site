<cfoutput>
    <div class="container py-20 mx-auto">
        <h2 class="text-3xl font-bold">Cheatsheets</h2>
        <ul>
            <cfloop array="#prc.cheatsheets#" item="cheatsheet">
                <li><a href="/cheatsheet/#cheatsheet.slug#" class="text-xl">#encodeForHTML( cheatsheet.title )#</a></li>
            </cfloop>
        </ul>
    </div>

    #renderView( "partials/_signup" )#
</cfoutput>