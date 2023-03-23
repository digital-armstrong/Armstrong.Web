require "test_helper"

class DeviceComponentControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get device_component_index_url
    assert_response :success
  end

  test "should get show" do
    get device_component_show_url
    assert_response :success
  end

  test "should get new" do
    get device_component_new_url
    assert_response :success
  end

  test "should get edit" do
    get device_component_edit_url
    assert_response :success
  end
end
