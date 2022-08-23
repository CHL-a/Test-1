--run code below
local Static = require('Static')
local WebServer = require('WebServer')
	.new()
local cURL = require('cURL')


WebServer.onInvalidRequest(function(client, req, res)
	res.statusCode = 404
	res.statusMessage = 'Bad request'
	res.headers.connection = 'close'
	res.body = 'bad request idk'

	if req.headers['User-Agent']
		== 'Mozilla/5.0 (compatible; Discordbot/2.0; +https://discordapp.com)'
		and req.webPage == '/' 
		and req.requestType == 'GET'
		then
		
		res.statusCode = 200
		res.success = true
		res.statusMessage = 'OK'
		res.headers['Content-Type'] = 'text/html'
		res.body = [[<title>Website Name</title>
		<meta content="Embed Title" property="og:title" />
		<meta content="Site Description" property="og:description" />
		<meta content="https://embed.com/this-is-the-site-url" property="og:url" />
		<meta content="https://embed.com/embedimage.png" property="og:image" />
		<meta content="#43B581" data-react-helmet="true" name="theme-color"/>]]
		
	end
end)
	.launch()