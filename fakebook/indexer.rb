require 'bridge-ruby'
require 'lingua/stemmer'

class Indexer

  def initialize
    @word_counts = {}
    @stemmer= Lingua::Stemmer.new(:language => "en")
  end

  def index message
    message.split(' ').map do |word|
     stemmed = @stemmer.stem word 

     if @word_counts[stemmed]
       @word_counts[stemmed] += 1
     else
       @word_counts[stemmed] = 1
     end

    end
  end

end


EM.run do
  bridge = Bridge::Bridge.new :api_key => 'abcdefgh'
  bridge.publish_service('indexer', Indexer.new)
  bridge.connect
end
