require 'test_helper'

class MeasurementClassTest < ActiveSupport::TestCase
  test 'create_mclass_model' do
    mg = create(:measurement_group)
    mc = create(:measurement_class, measurement_group_id: mg.id)
    assert mc.persisted?
  end
end
