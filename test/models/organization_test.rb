require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  test 'create_organization_model' do
    organization = create(:organization)
    assert organization.persisted?
  end
end
