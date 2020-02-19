<cfoutput>
    <div class="text-white bg-blue-800">
        <div class="container py-20 mx-auto">
            <div class="flex flex-wrap">
                <cfloop array="#prc.cheatsheets#" item="cheatsheet">
                    <article class="w-full p-4 md:w-1/3">
                        <div class="h-24 p-4 text-blue-900 bg-white border-2 border-blue-900 shadow">
                            <h2 class="inline p-1 text-2xl leading-none"><a href="#event.buildLink( '/cheatsheet/#cheatsheet.slug#' )#">#encodeForHTML( cheatsheet.title )#</a></h2>
                        </div>
                    </article>
                </cfloop>
            </div>
        </div>
    </div>

    #renderView( "partials/_signup" )#
</cfoutput>