require 'test_helper'

class DeviceComponentTest < ActiveSupport::TestCase
  test 'create_device_component_model' do
    device_component = create(:device_component)
    assert device_component.persisted?
  end
end
