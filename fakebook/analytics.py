from icolor import cformat
from BridgePython import Bridge
bridge = Bridge(api_key="abcdefgh")

class Analytics(object):
    def increment_visits(self, user_id):
        print cformat("#xWHITE; #BLACK; Login counted from user #RED;%s  " % user_id)

bridge.publish_service("analytics", Analytics())
bridge.connect()
