require 'test_helper'

class MeasurementClassControllerTest < ActionController::TestCase
  def setup
    @measurement_group = create(:measurement_group)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get edit' do
    measurement_class = create(:measurement_class)
    get :edit, params: { id: measurement_class.id }
    assert_response :success
  end

  test 'should patch update' do
    measurement_class = create(:measurement_class)
    measurement_class_attrs = attributes_for(:measurement_class, measurement_group_id: @measurement_group.id)
    patch :update, params: { id: measurement_class.id, measurement_class: measurement_class_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    measurement_class = create(:measurement_class)
    delete :destroy, params: { id: measurement_class.id }
    assert_response :redirect
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get show' do
    measurement_class = create(:measurement_class)
    get :show, params: { id: measurement_class.id }
    assert_response :success
  end

  test 'should post create' do
    measurement_class = create(:measurement_class)
    measurement_class_attrs = attributes_for(:measurement_class, measurement_group_id: @measurement_group.id)
    post :create, params: { id: measurement_class.id, measurement_class: measurement_class_attrs }
    assert_response :redirect
  end
end