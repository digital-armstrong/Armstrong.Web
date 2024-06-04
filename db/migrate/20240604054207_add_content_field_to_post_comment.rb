class AddContentFieldToPostComment < ActiveRecord::Migration[7.0]
  def change
    add_column :post_comments, :content, :text
  end
end
