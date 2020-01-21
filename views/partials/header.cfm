<cfoutput>
  <header class="flex flex-wrap items-center justify-center text-white bg-green-500 md:flex-no-wrap">
    <div class="flex items-center flex-shrink-0 p-4">
      <a class="text-2xl font-bold text-white" href="/">
        <span class="">CF Snippets</span>
			</a>
		</div>
		<div class="w-full p-4">
			#renderView( "partials/search")#
		</div>
	</header>

	<cfif structKeyExists( prc, "page")>
		<section class="bg-green-500">
			<div class="">
				<div class="container">
					<cfif structKeyExists( prc.page, "title")>
						<h1 class="text-white title">
							#prc.page.title#
						</h1>
					</cfif>
					<cfif structKeyExists( prc.page, "subtitle")>
						<h2 class="subtitle">
							#prc.page.subtitle#
						</h2>
					</cfif>
				</div>
			</div>
		</section>
	</cfif>
</cfoutput>