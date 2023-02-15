require 'test_helper'

class ChannelTest < ActiveSupport::TestCase
  test 'create_channel_model' do
    channel = create(:channel)
    assert channel.persisted?
  end
end
