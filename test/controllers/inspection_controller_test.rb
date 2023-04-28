require 'test_helper'

class InspectionControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    sign_in(users(:admin))
  end

  test 'should get my_tasks' do
    get :my_tasks
    assert_response :success
  end

  test 'should get new_tasks' do
    get :new_tasks
    assert_response :success
  end

  test 'should get completed_tasks' do
    get :completed_tasks
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    inspection = create(:inspection)
    get :edit, params: { id: inspection.id }
    assert_response :success
  end

  test 'should patch update' do
    inspection = create(:inspection)
    inspection_attrs = inspection.as_json
    inspection_attrs.delete('id')
    patch :update, params: { id: inspection.id, inspection: inspection_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    inspection = create(:inspection)
    inspection_attrs = inspection.as_json
    inspection_attrs.delete('id')
    post :create, params: { id: inspection.id, inspection: inspection_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    inspection = create(:inspection)
    delete :destroy, params: { id: inspection.id }
    assert_response :redirect
  end
end
