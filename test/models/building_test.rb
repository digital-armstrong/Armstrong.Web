require 'test_helper'

class BuildingTest < ActiveSupport::TestCase
  test 'create_building_model' do
    building = create(:building)
    assert building.persisted?
  end
end
