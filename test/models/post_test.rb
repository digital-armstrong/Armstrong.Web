require 'test_helper'

class PostTest < ActiveSupport::TestCase
  test 'create_post_model' do
    post = create(:post)
    assert post.persisted?
  end
end
