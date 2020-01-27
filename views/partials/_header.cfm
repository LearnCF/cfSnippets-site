<cfif structKeyExists( prc, "page")>
  <section class="bg-blue-900">
    <div class="container py-8 mx-auto">
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
      </div>
    </div>
  </section>
</cfif>