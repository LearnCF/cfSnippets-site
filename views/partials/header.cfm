<cfoutput>
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