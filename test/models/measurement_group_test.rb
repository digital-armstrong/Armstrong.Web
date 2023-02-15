require 'test_helper'

class MeasurementGroupTest < ActiveSupport::TestCase
  test 'create_mgroup_model' do
    mg = create(:measurement_group)
    assert mg.persisted?
  end
end
