require 'test_helper'

class DeviceModelTest < ActiveSupport::TestCase
  test 'create_device_m_model' do
    device_model = create(:device_model)
    assert device_model.persisted?
  end
end
