<cfoutput>
	<section class="hero is-primary">
		<div class="hero-body">
			<div class="container">
				<cfif structKeyExists( prc, "page") && structKeyExists( prc.page, "title")>
					<h1 class="title">
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