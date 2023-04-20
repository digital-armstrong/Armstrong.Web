require 'test_helper'

class Admin::MeasurementGroupControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    sign_in(users(:admin))
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get edit' do
    measurement_group = create(:measurement_group)
    get :edit, params: { id: measurement_group.id }
    assert_response :success
  end

  test 'should patch update' do
    measurement_group = create(:measurement_group)
    measurement_group_attrs = attributes_for(:measurement_group)
    patch :update, params: { id: measurement_group.id, measurement_group: measurement_group_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    measurement_group = create(:measurement_group)
    delete :destroy, params: { id: measurement_group.id }
    assert_response :redirect
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    measurement_group = create(:measurement_group)
    measurement_group_attrs = attributes_for(:measurement_group)
    post :create, params: { id: measurement_group.id, measurement_group: measurement_group_attrs }
    assert_response :redirect
  end
end
