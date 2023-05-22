require 'test_helper'

class PostControllerTest < ActionController::TestCase
  include Devise::Test::ControllerHelpers

  def setup
    sign_in(users(:admin))
    @user = create(:user)
  end

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
    post_attrs = attributes_for(:post, user_id: @user.id)
    patch :update, params: { id: post.id, post: post_attrs }
    assert_response :redirect
  end

  test 'should post create' do
    post = create(:post)
    post_attrs = attributes_for(:post, user_id: @user.id)
    post (:create), params: { id: post.id, post: post_attrs } # rubocop:disable all
    assert_response :redirect
  end

  test 'should delete destroy' do
    post = create(:post)
    delete :destroy, params: { id: post.id }
    assert_response :redirect
  end
end
