<cfif structKeyExists( prc, "page")>
<cfoutput>
  <section class="bg-green-700">
    <div class="container p-4 py-16 mx-auto">
      <div class="md:w-2/3">
        <cfif structKeyExists( prc.page, "title")>
          <h1 class="my-2 text-4xl leading-tight text-white title">
            #prc.page.title#
          </h1>
        </cfif>
        <cfif structKeyExists( prc.page, "subtitle")>
          <h2 class="my-2 text-2xl leading-tight text-white title">
            #prc.page.subtitle#
          </h2>
        </cfif>
        <cfif structKeyExists( prc.page, "description")>
          <p class="my-4 text-lg text-white">
            #prc.page.description#
          </p>
        </cfif>
      </div>
    </div>
  </section>
</cfoutput>
</cfif>