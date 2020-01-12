<cfoutput>
	<cfif NOT ArrayLen( prc.cheats )>
		<div class="px-4 py-3 my-10 text-teal-900 bg-teal-100 border-t-4 border-teal-500 rounded-b shadow-md" role="alert">
			<div class="flex">
				<div class="py-1"><svg class="w-6 h-6 mr-4 text-teal-500 fill-current" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 20 20"><path d="M2.93 17.07A10 10 0 1 1 17.07 2.93 10 10 0 0 1 2.93 17.07zm12.73-1.41A8 8 0 1 0 4.34 4.34a8 8 0 0 0 11.32 11.32zM9 11V9h2v6H9v-4zm0-6h2v2H9V5z"/></svg></div>
				<div>
					<p class="font-bold">Hmm, we couldn't find any snippets for that</p>
					<p class="text-sm">Try searching by the full function name, like <a href="/search?q=queryexecute" class="underline">QueryExecute</a>.</p>
				</div>
			</div>
		</div>
	<cfelse>
		#renderView(
			view = "Main/Cheat",
			collection = prc.cheats
		)#

		#renderView(
			view = "partials/pagination",
			args = prc.pagination
		)#
	</cfif>
</cfoutput>