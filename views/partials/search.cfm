<cfoutput>
<div class="text-white bg-blue-800">
	<div class="container p-8 mx-auto">
		<form action="#event.buildLink('search')#" method="GET">
			<div class="flex justify-center">
				<div class="block p-2">
					<label for="search" class="sr-only">Search</label>
					<input type="search" name="q" id="search" value="#encodeForHTMLAttribute( event.getValue( 'q', '' ) )#" class="p-4 text-white bg-blue-700 rounded shadow-inner" placeholder="queryexecute" />
				</div>
				<div class="block p-2">
					<input type="submit" class="p-4 text-blue-900 bg-white rounded" value="Search" />
				</div>
			</div>
		</form>
	</div>
</div>
</cfoutput>