<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#encodeForHTML( prc.meta.title )#</title>
	<meta name="description" content="#prc.meta.description#">
	<meta name="author" content="#prc.meta.author#">

	#renderView( "Utilities/scripts" )#
	#renderView( "Utilities/stylesheets" )#
</head>
<body>

	#renderView( "partials/header" )#

	<!---Container And Views --->
	<div class="container py-10 mx-auto bg-white">#renderView()#</div>

	#renderView( "partials/footer" )#
</body>
</html>
</cfoutput>