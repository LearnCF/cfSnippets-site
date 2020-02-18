<cfoutput>
    <h1>Unsubscribe</h1>
    <p>Sorry to see you go!</p>
    <form action="/newsletter/unsubscribe">
        <!---
            Show email input, optionally prefilled by the user clicking a link from their email
        --->
        <!---
            Show all subscribed groups for the given email with a checkbox for each
        --->
        <!---
            Show "unsubscribe from all" option
        --->
        <!---
            Hidden nonce field
        --->
        <input type="submit" value="Unsubscribe" />
    </form>
</cfoutput>