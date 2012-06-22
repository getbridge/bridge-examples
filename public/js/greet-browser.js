var bridge = new Bridge({apiKey: 'abcdefgh'});

bridge.getService('greeter', function (greeter) {
  greeter.greet('<<Namen>>', function (msg) {
    document.getElementById('notify').innerText = msg;
  });
});

bridge.connect();
