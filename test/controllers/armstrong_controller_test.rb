require 'test_helper'

class ArmstrongControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get armstrong_index_url
    assert_response :success
  end

  test 'should get show' do
    get armstrong_show_url
    assert_response :success
  end
end
