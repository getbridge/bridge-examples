require 'bridge-ruby'
require 'yaml'
require 'obscenity'
require 'lingua/stemmer'

class SpamFilter
  def is_spam?(message)
    Obscenity.profane?(message)
  end
end



class PostHandler

  def initialize bridge
    @filter = SpamFilter.new
    @indexer = bridge.get_service('indexer')
    @bridge = bridge
  end

  def activateFeed handler, callback
    @bridge.join_channel('bb-feed', handler, false) do
      callback.call
    end
  end

  def submit user, message
    feed = @bridge.get_channel('bb-feed')
    feed.post(user, message) unless @filter.is_spam?(message)
    @indexer.index message
  end

end


EM.run do
  bridge = Bridge::Bridge.new :api_key => 'abcdefgh'
  bridge.publish_service('posts', PostHandler.new(bridge))
  bridge.connect
end
