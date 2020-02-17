<cfoutput>
    <div class="text-gray-200 bg-green-700">
        <div class="container py-20 mx-auto">
            <h2 class="mb-2 text-3xl">Get New Snippets In Your Inbox</h2>
            <form action="#event.buildLink( '/newsletter/signup' )#" method="POST">
                <label for="email" class="sr-only">Email</label>
                <input type="email" name="email" id="email" placeholder="Email" class="inline-block p-4 text-xl text-gray-900 bg-white rounded-sm" />
                <input type="submit" name="submit" value="Subscribe" class="inline-block p-4 text-xl text-gray-900 bg-white rounded-sm" /> 
            </form>
            <p class="my-2">No spam, not too many emails.</p>
        </div>
    </div>
</cfoutput>