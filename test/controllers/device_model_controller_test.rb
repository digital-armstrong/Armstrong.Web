require 'test_helper'

class DeviceModelControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    device_model = create(:device_model)
    get :show, params: { id: device_model.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    device_model = create(:device_model)
    get :edit, params: { id: device_model.id }
    assert_response :success
  end

  test 'should patch update' do
    device_model = create(:device_model)
    device_model_attrs = attributes_for(:device_model)
    patch :update, params: { id: device_model.id, device_model: device_model_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    device_model = create(:device_model)
    device_model_attrs = attributes_for(:device_model)
    post :create, params: { id: device_model.id, device_model: device_model_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    device_model = create(:device_model)
    delete :destroy, params: { id: device_model.id }
    assert_response :redirect
  end
end
