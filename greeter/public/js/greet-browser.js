var bridge = new Bridge({apiKey: 'abcdefgh'});


$(document).ready(function(){
  $('#button').click(function(){
    bridge.getService('greeter', function (greeter) {
      greeter.greet('Interwebs', function (msg) {
        document.getElementById('notify').innerText = msg;
      });
    });
  });
});

bridge.connect();
