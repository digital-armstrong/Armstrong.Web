require 'test_helper'

class ManufacturerTest < ActiveSupport::TestCase
  test 'create_manufacurer_model' do
    manufacturer = create(:manufacturer)
    assert manufacturer.persisted?
  end
end
