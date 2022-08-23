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
		res.headers['Content-Type'] = 'application/json'
		res.body = [[{
			"content": null,
			"embeds": [
			  {
				"title": "heres a cat",
				"color": null,
				"author": {
				  "name": "successful test"
				},
				"image": {
				  "url": "https://cdn.discordapp.com/attachments/794824303300182027/1011668557916020827/unknown.png"
				}
			  }
			],
			"attachments": []
		  }]]
		
	end
end)
	.launch()