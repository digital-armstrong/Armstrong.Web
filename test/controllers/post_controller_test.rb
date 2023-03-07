require 'test_helper'

class PostControllerTest < ActionController::TestCase
  test 'should get show' do
    post = create(:post)
    get :show, params: { id: post.id }
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    post = create(:post)
    get :edit, params: { id: post.id }
    assert_response :success
  end

  test 'should patch update' do
    post = create(:post)
    post_attrs = attributes_for(:post)
    patch :update, params: { id: post.id, post: post_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    post = create(:post)
    post_attrs = attributes_for(:post)
    post (:create), params: { id: post.id, post: post_attrs }
    assert_response :success
  end

  test 'should delete destroy' do
    post = create(:post)
    delete :destroy, params: { id: post.id }
    assert_response :redirect
  end
end
