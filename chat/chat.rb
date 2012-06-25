require 'bridge-ruby'

class KeyboardHandler < EM::Connection
  include EM::Protocols::LineText2

  def initialize(channel)
    @ch = channel
  end

  def receive_line(data)
    @ch.message("Ruby", data)
  end
end

class ChatHandler
  def message sender, msg
    puts "#{sender}: #{msg}"
  end
end

EM.run {
  bridge = Bridge::Bridge.new(:api_key => "abcdefgh")

  auth = bridge.get_service('auth')
  auth.join('bridge-lovers', 'secret123', ChatHandler.new) do |channel, name|
    puts "Joined: #{name}"
    EM.open_keyboard(KeyboardHandler, channel)
  end

  bridge.connect
}
