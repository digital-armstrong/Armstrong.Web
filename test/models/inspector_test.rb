require 'test_helper'

class InspectorTest < ActiveSupport::TestCase
  test 'create_user_model_inspector' do
    inspector = create(:inspector)
    assert inspector.persisted?
  end
end
