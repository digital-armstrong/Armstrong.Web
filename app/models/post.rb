class Post < ApplicationRecord
  belongs_to :user

  validates :user, presence: true

  def self.ransackable_attributes(_auth_object = nil)
    ['body', 'category', 'created_at', 'id', 'title', 'updated_at', 'user_id']
  end
end
