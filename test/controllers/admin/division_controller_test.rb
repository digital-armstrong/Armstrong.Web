require 'test_helper'

class Admin::DivisionControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get admin_division_index_url
    assert_response :success
  end
end
