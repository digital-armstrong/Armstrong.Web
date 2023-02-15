require 'test_helper'

class ServiceTest < ActiveSupport::TestCase
  test 'create_service_model' do
    service = create(:service)
    assert service.persisted?
  end
end
