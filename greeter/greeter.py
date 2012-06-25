import time
from BridgePython import Bridge
bridge = Bridge(api_key = 'abcdefgh')

class Greeter(object):
    def greet(self, name, callback):
        t = time.strftime("%H:%M:%S", time.gmtime())
        callback("Pleased to meet you, %s. Time is %s." % (name, t))

bridge.publish_service('greeter', Greeter())
bridge.connect()
