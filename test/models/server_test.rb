require "test_helper"

class ServerTest < ActiveSupport::TestCase
  test 'create_server_model' do
    server = create(:server)
    assert server.persisted?
  end
end
