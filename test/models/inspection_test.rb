require 'test_helper'

class InspectionTest < ActiveSupport::TestCase
  test 'create_inspection_model' do
    inspection = create(:inspection)
    assert inspection.persisted?
  end
end
