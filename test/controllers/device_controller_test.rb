require 'test_helper'

class DeviceControllerTest < ActionController::TestCase
  # test 'should get show' do
  #   get :show
  #   assert_response :success
  # end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get edit' do
    device = create(:device)
    get :edit, params: { id: device.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end
end
