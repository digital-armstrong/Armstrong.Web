require 'test_helper'

class DeviceComponentControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    device_component = create(:device_component)
    get :edit, params: { id: device_component.id }
    assert_response :success
  end

  test 'should patch update' do
    device_component = create(:device_component)
    device_component_attrs = device_component.as_json
    device_component_attrs.delete('id')
    patch :update, params: { id: device_component.id, device_component: device_component_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    device_component = create(:device_component)
    device_component_attrs = device_component.as_json
    device_component_attrs.delete('id')
    post :create, params: { id: device_component.id, device_component: device_component_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    device_component = create(:device_component)
    delete :destroy, params: { id: device_component.id }
    assert_response :redirect
  end
end
