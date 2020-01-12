<cfoutput>
	<form action="#event.buildLink('search')#" method="GET">
		<div class="flex justify-center">
			<div class="block">
				<label for="search" class="sr-only">Search</label>
				<input type="search" name="q" id="search" value="#encodeForHTMLAttribute( event.getValue( 'q', '' ) )#" class="p-2 text-sm text-white bg-green-700 shadow-inner md:rounded-l" placeholder="queryexecute" />
			</div>
			<div class="block">
				<input type="submit" class="p-2 text-sm text-blue-900 bg-white md:rounded-r" value="Search" />
			</div>
		</div>
	</form>
</cfoutput>