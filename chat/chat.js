var readline = require('readline');
var Bridge = require('bridge-js');
var bridge = new Bridge({apiKey:'abcdefgh'});

var rl = readline.createInterface(process.stdin, process.stdout);

var chatHandler = {
  message: function (sender, message) {
    console.log(sender, ':', message);
  }
};

var joinCallback = function (channel, name) {
  console.log('Joined channel : ', name);
  rl.on('line', function (line) {
    channel.message('Jasper', line);
  });
};

bridge.getService('auth', function (auth) {
  auth.join('bridge-lovers', 'secret123', chatHandler, joinCallback);
});

bridge.connect();
