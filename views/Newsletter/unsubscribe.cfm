<cfoutput>
    <div class="container py-10 mx-auto">
        <form action="/newsletter/unsubscribeUser" method="POST">
            <!---
                Show email input, optionally prefilled by the user clicking a link from their email
            --->
            <div class="mb-4">
                <label for="unsubscribeEmail" class="block mb-2">Enter your email address to unsubscribe</label>
                <input type="email" name="email" id="unsubscribeEmail" value="" class="block p-2 text-lg border-2 rounded-sm">
            </div>
            <!---
                Show all subscribed groups for the given email with a checkbox for each
            --->
            <!---
                Show "unsubscribe from all" option
            --->
            <!---
                Hidden nonce field
            --->
            <div class="mb-4">
                <input type="submit" value="Unsubscribe" class="p-2 text-white bg-green-700 rounded-sm" />
            </div>
        </form>
    </div>
</cfoutput>