require 'test_helper'

class PubsubTest < Minitest::Test

  should 'publish a message' do
    @p = Phoenix::Pubsub::Redis.new 'Chat.PubSub'
    @p.publish 'rooms:lobby', 'new:msg', { user: 'rake', body: 'hello there!' }
  end

end
