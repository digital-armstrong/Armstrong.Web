require 'test_helper'

class DeviceRegGroupTest < ActiveSupport::TestCase
  test 'create_rg_model' do
    rg = create(:device_reg_group)
    assert rg.persisted?
  end
end
