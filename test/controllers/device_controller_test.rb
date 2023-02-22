require 'test_helper'

class DeviceControllerTest < ActionDispatch::IntegrationTest
  test 'should get show' do
    get device_show_url
    assert_response :success
  end

  test 'should get index' do
    get device_index_url
    assert_response :success
  end
end
