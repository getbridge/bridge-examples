require 'bridge-ruby'

EM.next_tick {
  bridge = Bridge::Bridge.new :api_key => "abcdefgh"
  Bridge.instance = bridge
  bridge.connect
}
