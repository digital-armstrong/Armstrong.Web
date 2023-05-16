require 'test_helper'

class Admin::DeviceRegGroupControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    sign_in(users(:admin))
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should patch update' do
    device_reg_group = create(:device_reg_group)
    device_reg_group_attrs = attributes_for(:device_reg_group)
    patch :update, params: { id: device_reg_group.id, device_reg_group: device_reg_group_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    device_reg_group = create(:device_reg_group)
    device_reg_group_attrs = attributes_for(:device_reg_group)
    post :create, params: { id: device_reg_group.id, device_reg_group: device_reg_group_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    device_reg_group = create(:device_reg_group)
    delete :destroy, params: { id: device_reg_group.id }
    assert_response :redirect
  end
end
