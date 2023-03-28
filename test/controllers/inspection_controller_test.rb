require 'test_helper'

class InspectionControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    inspection = create(:inspection)
    pp inspection
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
