require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'create_user_model' do
    user = create(:user)
    assert user.persisted?
  end
end
