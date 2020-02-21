<cfoutput>
    <div class="text-gray-200 bg-green-700">
        <div class="container flex flex-wrap py-20 mx-auto md:flex-no-wrap md:justify-around">
            <div class="w-full px-4 md:w-2/5 md:text-right">
                <h2 class="mb-2 text-3xl">Get New Snippets In Your Inbox</h2>
                <p class="my-2">No spam, not too many emails.</p>
            </div>
            <form action="#event.buildLink( '/newsletter/subscribeUserToNewsletter' )#" method="POST" class="w-full px-4 md:w-2/5">
                <label for="email" class="sr-only">Email</label>
                <input type="email" name="email" id="email" placeholder="Email" class="inline-block p-4 text-xl text-gray-900 bg-white rounded-sm" />
                <input type="submit" name="submit" value="Subscribe" class="inline-block p-4 text-xl text-gray-900 bg-white rounded-sm" /> 
            </form>
        </div>
    </div>
</cfoutput>