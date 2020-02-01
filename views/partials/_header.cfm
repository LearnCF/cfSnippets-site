<cfif structKeyExists( prc, "page")>
<cfoutput>
  <section class="bg-green-700">
    <div class="container py-10 mx-auto">
      <div class="">
        <cfif structKeyExists( prc.page, "title")>
          <h1 class="my-2 text-3xl text-white title">
            #prc.page.title#
          </h1>
        </cfif>
        <cfif structKeyExists( prc.page, "subtitle")>
          <h2 class="my-2 text-xl text-white title">
            #prc.page.subtitle#
          </h2>
        </cfif>
        <cfif structKeyExists( prc.page, "description")>
          <p class="my-4 text-white">
            #prc.page.description#
          </p>
        </cfif>
      </div>
    </div>
  </section>
</cfoutput>
</cfif>