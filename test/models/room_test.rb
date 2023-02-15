require 'test_helper'

class RoomTest < ActiveSupport::TestCase
  test 'create_room_model' do
    room = create(:room)
    assert room.persisted?
  end
end
