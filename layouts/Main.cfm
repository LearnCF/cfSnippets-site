<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#encodeForHTML( prc.meta.title )#</title>
	<meta name="description" content="#prc.meta.description#">
	<meta name="author" content="#prc.meta.author#">

	#renderView( "Utilities/head" )#
</head>
<body>

	#renderView( "partials/_nav" )#
	#renderView( "partials/_header" )#

	<!---Container And Views --->
	<div>
		<div class="container mx-auto">
			#getInstance( "messagebox@cbmessagebox" ).renderIt()#
		</div>
		#renderView()#
	</div>

	#renderView( "partials/_footer" )#
</body>
</html>
</cfoutput>