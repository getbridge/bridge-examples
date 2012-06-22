var Bridge = require('bridge-js');

var bridge = new Bridge({apiKey: 'abcdefgh'});

bridge.getService('greeter', function (greeter) {
  greeter.greet('<<Namen>>', function (msg) {
    console.log(msg);
  });
});

bridge.connect();
