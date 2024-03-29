require 'test_helper'

class Admin::ManufacturerControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    sign_in(users(:admin))
  end

  test 'should get index' do
    get :index
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
