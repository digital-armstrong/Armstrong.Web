require 'test_helper'

class DefaultTest < ActiveSupport::TestCase
  test 'create_user_model_default' do
    default = create(:default)
    assert default.persisted?
  end
end
