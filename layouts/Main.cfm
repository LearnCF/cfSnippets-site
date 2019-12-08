<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#prc.meta.title#</title>
	<meta name="description" content="#prc.meta.description#">
	<meta name="author" content="#prc.meta.author#">

	#renderView( "Utilities/scripts" )#
</head>
<body class="has-background-light has-text-secondary">

	#renderView( "partials/nav" )#

	#renderView( "partials/header" )#

	<!---Container And Views --->
	<div class="container section">#renderView()#</div>

	#renderView( "partials/footer" )#

	<!--- Duh, scripts --->
	#renderView( "Utilities/stylesheets" )#
</body>
</html>
</cfoutput>