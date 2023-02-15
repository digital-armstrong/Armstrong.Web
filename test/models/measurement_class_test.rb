require 'test_helper'

class MeasurementClassTest < ActiveSupport::TestCase
  test 'create_mclass_model' do
    mc = create(:measurement_class)
    assert mc.persisted?
  end
end
