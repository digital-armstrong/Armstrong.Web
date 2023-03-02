require 'test_helper'

class EngineerTest < ActiveSupport::TestCase
  test 'create_user_model_engineer' do
    engineer = create(:engineer)
    assert engineer.persisted?
  end
end
