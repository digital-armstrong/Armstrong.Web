require 'test_helper'

class DeviceControllerTest < ActionController::TestCase
  def setup
    @device_model = create(:device_model)
    @device_reg_group = create(:device_reg_group)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get edit' do
    device = create(:device)
    get :edit, params: { id: device.id }
    assert_response :success
  end

  test 'should patch update' do
    device = create(:device)
    device_attrs = attributes_for(
      :device,
      device_model_id: @device_model.id,
      device_reg_group_id: @device_reg_group.id,
    )
    patch :update, params: { id: device.id, device: device_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    device = create(:device)
    delete :destroy, params: { id: device.id }
    assert_response :redirect
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get show' do
    device = create(:device)
    get :show, params: { id: device.id }
    assert_response :success
  end

  test 'should post create' do
    device = create(:device)
    device_attrs = attributes_for(
      :device,
      device_model_id: @device_model.id,
      device_reg_group_id: @device_reg_group.id,
    )
    post :create, params: { id: device.id, device: device_attrs }
    assert_response :redirect
  end
end
