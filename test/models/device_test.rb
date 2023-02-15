require 'test_helper'

class DeviceTest < ActiveSupport::TestCase
  test 'create_device_model' do
    device = create(:device)
    assert device.persisted?
  end
end
