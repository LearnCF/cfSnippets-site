<cfoutput>
  <nav class="flex flex-wrap items-center justify-between p-6 text-white bg-green-500" role="navigation" aria-label="main navigation">
    <div class="flex items-center flex-shrink-0">
      <a class="text-2xl font-bold text-white" href="/">
        <span class="">CF Snippets</span>
      </a>
  
      <div class="block md:hidden">
        <button class="flex items-center px-3 py-2 text-teal-200 border border-teal-400 rounded hover:text-white hover:border-white" aria-expanded="false" aria-controls="navbarFull">
          <svg class="w-3 h-3 fill-current" viewBox="0 0 20 20" xmlns="http://www.w3.org/2000/svg"><title>Menu</title><path d="M0 3h20v2H0V3zm0 6h20v2H0V9zm0 6h20v2H0v-2z"/></svg>
        </button>
      </div>
    </div>
  
    <div id="navbarFull" class="flex justify-between flex-grow block w-full md:pl-4 md:flex md:items-center md:w-auto">
      <div class="md:flex-grow">
        #renderView( "partials/search")#
      </div>
  
      <div class="flex items-center flex-shrink-0">
        <iframe src="https://ghbtns.com/github-btn.html?user=learncf&repo=cfcheats&type=star&count=true&size=large" frameborder="0" scrolling="0" width="120px" height="30px"></iframe>
      </div>
    </div>
  </nav>
</cfoutput>