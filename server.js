const express = require('express');

const app = express();

app.get('/', function(request, response) {
  app.use(express.static('comingsoon'));
  response.sendFile(__dirname + '/comingsoon/cs.html');
});

app.get('/status', function(request, response) {
  
  var request = require("request");
  var options = { method: 'POST',
    url: 'https://api.uptimerobot.com/v2/getMonitors',
    headers:
     { 'cache-control': 'no-cache',
       'content-type': 'application/x-www-form-urlencoded' },
    form: { api_key: 'm782021622-7e2987a098df6208d03abaa4', format: 'json', logs: '1' } };

  request(options, function (error, response, body) {
    if (error) throw new Error(error);

    console.log(body);
  });
});

app.get('/main', function(request, response) {
  app.use(express.static('/main'));
  response.sendFile(__dirname + '/main/main.html');
});

app.get('/about', function(request, response) {
  app.use(express.static('/about'));
  response.sendFile(__dirname + '/about/about.html');
});

/*app.get('/search', function(request, response) {
  app.use(express.static('main'));
  response.sendFile(__dirname + '/main/main.html');
});*/

/*app.get('/roblox', function(request, response) {
  app.use(express.static('roblox'));
  response.sendFile(__dirname + '/roblox/roblox.html');
});*/

app.get('/roblox/profile', function(request, response) {
  app.use(express.static('roblox'));
  response.sendFile(__dirname + '/roblox/profile.html');
});

app.get('/roblox/devforum', function(request, response) {
  app.use(express.static('roblox'));
  response.sendFile(__dirname + '/roblox/devforumprofile.html');
});

/*app.get('/countdown', function(request, response) {
  app.use(express.static('comingsoon'));
  response.sendFile(__dirname + '/comingsoon/cs.html');
});*/

// listen for requests :)
const listener = app.listen(process.env.PORT, function() {
  console.log('Your app is listening on port ' + listener.address().port);
});
