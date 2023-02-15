require 'test_helper'

class SupplementaryKitTest < ActiveSupport::TestCase
  test 'create_supp_kit_model' do
    supp_kit = create(:supplementary_kit)
    assert supp_kit.persisted?
  end
end
