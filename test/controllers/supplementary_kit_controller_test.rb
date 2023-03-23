require 'test_helper'

class SupplementaryKitControllerTest < ActionController::TestCase
  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get edit' do
    supplementary_kit = create(:supplementary_kit)
    get :edit, params: { id: supplementary_kit.id }
    assert_response :success
  end

  test 'should patch update' do
    supplementary_kit = create(:supplementary_kit)
    supplementary_kit_attrs = attributes_for(:supplementary_kit)
    patch :update, params: { id: supplementary_kit.id, supplementary_kit: supplementary_kit_attrs }
    assert_response :redirect
  end

  test 'should delete destroy' do
    supplementary_kit = create(:supplementary_kit)
    delete :destroy, params: { id: supplementary_kit.id }
    assert_response :redirect
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should post create' do
    supplementary_kit = create(:supplementary_kit)
    supplementary_kit_attrs = attributes_for(:supplementary_kit)
    post :create, params: { id: supplementary_kit.id, supplementary_kit: supplementary_kit_attrs }
    assert_response :redirect
  end
end
