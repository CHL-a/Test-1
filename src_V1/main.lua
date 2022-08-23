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
		-- <meta content="https://embed.com/this-is-the-site-url" property="og:url" />
		-- ^ is optional
		res.body = [[<title>Website Name</title>
		<meta content="This is a url embed test" property="og:title" />
		<meta content="Heres a cat to test the image" property="og:description" />
		<meta content="https://cdn.discordapp.com/attachments/794824303300182027/1011668557916020827/unknown.png" property="og:image" />
		<meta content="#000508" data-react-helmet="true" name="theme-color"/>]]
		
	end
end)
	.launch()