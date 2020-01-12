<cfoutput>
  <header class="flex flex-wrap items-center justify-center text-white bg-green-500">
    <div class="flex items-center flex-shrink-0 p-4">
      <a class="text-2xl font-bold text-white" href="/">
        <span class="">CF Snippets</span>
			</a>
		</div>
      <div class="w-1/2 p-4">
        #renderView( "partials/search")#
      </div>
    </div>
	</header>

	<section class="bg-green-500">
		<div class="">
			<div class="container">
				<cfif structKeyExists( prc, "page") && structKeyExists( prc.page, "title")>
					<h1 class="title text-white">
						#prc.page.title#
					</h1>
				</cfif>
				<cfif structKeyExists( prc, "page") && structKeyExists( prc.page, "subtitle")>
					<h2 class="subtitle">
						#prc.page.subtitle#
					</h2>
				</cfif>
			</div>
		</div>
	</section>
</cfoutput>