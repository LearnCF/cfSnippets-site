/**
* I handle all newsletter subscriptions - subscribe, unsubscribe.
*/
component extends="BaseHandler"{

    property name="subscribeToGroupID" inject="coldbox:setting:subscribeToGroupID";

    /**
     * Standalone newsletter subscription page
     */
    function index( event, rc, prc ){}

    /**
     * Newsletter unsubscribe route
     * Handles both unsubscribe form and an "api" to unsubscribe the user.
     */
    function unsubscribe( event, rc, prc ){
        // validate email exists!
        if( !rc.keyExists( "email" ) || rc.email == "" ){
            messagebox.error( "Email is required." );
        }
        // validate nonce matches
        if( !rc.keyExists( "nonce" ) || rc.nonce != variables.myNonce ){
            messagebox.error( "Sorry, form submission does not match security nonce." )
        }
        if ( messagebox.isEmptyMessage() ){
            getInstance( "cfmailerlite@cfmailerlite" ).addSubscriberToGroup(
                id = variables.subscribeToGroupID,
                body = {
                    "email" : rc.email
                }
            );
        }
    }

    /**
     * Newsletter subscribe route
     * Send the user's provided email to mailerlite and add it to a specified group.
     */
    function subscribe( event, rc, prc ){
        // validate email exists!
        if( !rc.keyExists( "email" ) || rc.email == "" ){
            messagebox.error( "Email is required." )
        }
        if ( messagebox.isEmptyMessage() ){
            getInstance( "cfmailerlite@cfmailerlite" ).addSubscriberToGroup(
                id = variables.subscribeToGroupID,
                body = {
                    "email" : rc.email
                }
            );
        }
    }

}