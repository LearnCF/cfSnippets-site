/**
* I handle all newsletter subscriptions - subscribe, unsubscribe.
*/
component extends="BaseHandler"{

    property name="subscribeToGroupID" inject="coldbox:setting:subscribeToGroupID";

    /**
     * Standalone newsletter subscription page
     */
    function index( event, rc, prc ){}


    function unsubscribe( event, rc, prc ){
        prc.page = {
            title: "Unsubscribe",
            subtitle: "I'm sorry to see you go, but it's ok. You'll be back!"
        };
    }

    /**
     * Newsletter unsubscribe route
     * Handles both unsubscribe form and an "api" to unsubscribe the user.
     */
    function unsubscribeUser( event, rc, prc ) allowedMethods="POST"{
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
        relocate( 'newsletter.unsubscribe' );
    }

    /**
     * Newsletter subscribe form
     */
    function subscribe( event, rc, prc ){
        prc.page = {
            title: "Subscribe",
            subtitle: "Receive occasional emails with new snippets and site updates. No spam, I promise."
        };
    }

    /**
     * Newsletter subscribe POST action
     * Send the user's provided email to mailerlite and add it to a specified group.
     */
    function subscribeUser( event, rc, prc ) allowedMethods="POST"{
        // validate email exists!
        if( !rc.keyExists( "email" ) || rc.email == "" ){
            messagebox.error( "Email is required." );
        }
        if ( messagebox.isEmptyMessage() ){
            var response = getInstance( "cfmailerlite@cfmailerlite" ).addSubscriberToGroup(
                id = variables.subscribeToGroupID,
                body = {
                    "email" : rc.email
                }
            );
            if ( response.isSuccess() ){
                messagebox.success( "Hooray! You've been subscribed!" );
            }
        }
        relocate( 'newsletter.subscribe' );
    }

}