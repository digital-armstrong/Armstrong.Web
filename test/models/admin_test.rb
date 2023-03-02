require 'test_helper'

class AdminTest < ActiveSupport::TestCase
  test 'create_user_model_admin' do
    admin = create(:admin)
    assert admin.persisted?
  end
end
