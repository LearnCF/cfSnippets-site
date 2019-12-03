<cfoutput>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="utf-8">
	<title>#prc.meta.title#</title>
	<meta name="description" content="#prc.meta.description#">
	<meta name="author" content="#prc.meta.author#">
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulma/0.7.5/css/bulma.min.css" integrity="sha256-vK3UTo/8wHbaUn+dTQD0X6dzidqc5l7gczvH+Bnowwk=" crossorigin="anonymous" />
<!--- 	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bulmaswatch/0.7.2/lux/bulmaswatch.min.css" integrity="sha256-KWdpEps4XvqeBj3EVWeKs6A1TspBgEM57PTIw8c7/bM=" crossorigin="anonymous" /> --->
</head>
<body>

	#renderView( "partials/header" )#

	<!---Container And Views --->
	<div class="container">#renderView()#</div>

	#renderView( "partials/footer" )#

	<!--- Duh, scripts --->
	#renderView( "partials/highlight" )#
</body>
</html>
</cfoutput>