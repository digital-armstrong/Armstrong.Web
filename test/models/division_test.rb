require 'test_helper'

class DivisionTest < ActiveSupport::TestCase
  test 'create_division_model' do
    division = create(:division)
    assert division.persisted?
  end
end
