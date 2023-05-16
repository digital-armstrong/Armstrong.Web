require 'test_helper'

class Admin::DeviceModelControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    sign_in(users(:admin))
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    device_model = create(:device_model)
    get :show, params: { id: device_model.id }
    assert_response :success
  end

  test 'should patch update' do
    device_model = create(:device_model)
    device_model_attrs = device_model.as_json
    device_model_attrs.delete('id')
    patch :update, params: { id: device_model.id, device_model: device_model_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    device_model = create(:device_model)
    device_model_attrs = device_model.as_json
    device_model_attrs.delete('id')
    post :create, params: { id: device_model.id, device_model: device_model_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    device_model = create(:device_model)
    delete :destroy, params: { id: device_model.id }
    assert_response :redirect
  end
end
