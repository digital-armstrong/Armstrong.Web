require 'test_helper'

class ManufacturerControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    manufacturer = create(:manufacturer)
    get :show, params: { id: manufacturer.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    manufacturer = create(:manufacturer)
    get :edit, params: { id: manufacturer.id }
    assert_response :success
  end

  test 'should patch update' do
    manufacturer = create(:manufacturer)
    manufacturer_attrs = attributes_for(:manufacturer)
    patch :update, params: { id: manufacturer.id, manufacturer: manufacturer_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    manufacturer = create(:manufacturer)
    manufacturer_attrs = attributes_for(:manufacturer)
    post :create, params: { id: manufacturer.id, manufacturer: manufacturer_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    manufacturer = create(:manufacturer)
    delete :destroy, params: { id: manufacturer.id }
    assert_response :redirect
  end
end
